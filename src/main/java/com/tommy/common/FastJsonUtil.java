package com.tommy.common;

import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.tommy.model.enu.LotteryEnum;

/**
 * gson的工具类
 * @author miles
 *
 */
public class FastJsonUtil  {
 
	/**
	 * @author jon
	 * @date 2015年6月16日
	 * @param ret
	 * @return
	 */
	public static <T> T jsonToObject(String json, Class<T> clazz) {
		return JSON.parseObject(json,clazz);
	}

	/**
	 * @author jon
	 * @date 2015年6月24日
	 * @param source
	 * @return
	 */
	public static Map<String, String> jsonToMap(String source) {
		@SuppressWarnings("unchecked")
		Map<String,String> map = (Map<String, String>)JSON.parse(source);
		return map;
	}

	/**
	 * 
	 * @author jon
	 * @date 2015年7月7日
	 * @param t
	 * @return
	 */
	public static <T> String toJson(T t) {
		return JSON.toJSON(t).toString();
	}
	
	public static String ajaxSuccess() {
		AjaxResponse<String> ajaxResponse = new AjaxResponse<String>();
		ajaxResponse.setRet(LotteryEnum.SUCCESS.getCode());
		ajaxResponse.setMsg(LotteryEnum.SUCCESS.getMsg());
		return FastJsonUtil.toJson(ajaxResponse);
	}
	
	public static String ajax(LotteryEnum hCode) {
		return ajax(hCode.getCode(), hCode.getMsg());
	}
	
	public static <T> String ajax(int code, String msg) {
		AjaxResponse<T> ajaxResponse = new AjaxResponse<T>();
		ajaxResponse.setRet(code);
		ajaxResponse.setMsg(msg);
		return FastJsonUtil.toJson(ajaxResponse);
	}
	
	public static void main(String args[]){
		String s = FastJsonUtil.toJson(LotteryEnum.START_NO_ERROR);
		System.out.println(FastJsonUtil.ajax(LotteryEnum.START_NO_ERROR));
	}
}
