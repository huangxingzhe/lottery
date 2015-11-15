package com.tommy.common;

import java.io.Serializable;

/**
 * 返回给客户端的类
 * 
 * @company 荷尔蒙科技
 * @author jon
 * @date 2015年6月16日
 */
public class AjaxResponse<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2274107357370574461L;
	int ret;// 状态码
	String msg;// 提示消息
	T result;// 返回实体类

	public int getRet() {
		return ret;
	}

	public void setRet(int ret) {
		this.ret = ret;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getResult() {
		return result;
	}

	public void setResult(T result) {
		this.result = result;
	}

}
