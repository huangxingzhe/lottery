package com.tommy.common.ex;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import com.tommy.common.AjaxResponse;
import com.tommy.common.FastJsonUtil;

public class CustomExceptionResolver extends SimpleMappingExceptionResolver{
	private Log logger = LogFactory.getLog(this.getClass());

	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		logger.error("系统错误", ex);
		String msg = "";
		if (isAjaxRequest(request)) {// ajax 请求
			try {
				ajaxError(ex,response);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return new ModelAndView();
		} else {// 表单请求、jsp请求、普通跳转
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("msg", msg);
			param.put("detailMsg", ex.getMessage());
			String viewName = this.determineViewName(ex, request);// 获取配置的错误页面
			if (null == viewName) {
				viewName = "error";
			}
			request.setAttribute("msg", msg);
			return new ModelAndView("forward:/" + viewName, param);
		}
	}

	public static void ajaxError(Exception ex, ServletResponse response) throws IOException {
		AjaxResponse<String> ajaxResponse = new AjaxResponse<String>();

		if (ex instanceof BaseException) {
			setErrorResponse(ajaxResponse, ex);
		} else {
			Throwable throwable = ex.getCause();
			if (null != throwable && throwable instanceof BaseException) {
				setErrorResponse(ajaxResponse, throwable);
			} else {
				ajaxResponse.setMsg(ex.getMessage());
			}
		}
		headerResponse(response);
		response.getWriter().write(FastJsonUtil.ajax(ajaxResponse.getRet(),ajaxResponse.getMsg()));
	}
	private static void headerResponse(ServletResponse response) {
		response.setContentType("text/plain;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	}
	
	public boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		boolean isAjax = "XMLHttpRequest".equals(header) ? true : false;
		return isAjax;
	}

	private static <T> void setErrorResponse(AjaxResponse<T> ajaxResponse, Throwable throwable) {
		BaseException be = (BaseException) throwable;
		ajaxResponse.setRet(be.gethCode().getCode());
		ajaxResponse.setMsg(be.gethCode().getMsg());
	}
	
	public static void main(String args[]){
		AjaxResponse<String> ajaxResponse = new AjaxResponse<String>();
		ajaxResponse.setRet(1000);
		ajaxResponse.setMsg("操作成功");
		String ret = FastJsonUtil.toJson(ajaxResponse);
		System.out.println(ret);
	}
	
	public static String ajax(int ret ,String msg){
		return "{\"msg\":\"'"+msg+"'\",\"ret\":'"+ret+"'}";
	}
}
