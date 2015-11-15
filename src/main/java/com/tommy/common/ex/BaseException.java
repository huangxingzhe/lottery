package com.tommy.common.ex;

import com.tommy.model.enu.LotteryEnum;

public class BaseException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2299556937834778577L;

	LotteryEnum hCode;
	private String message;
	public BaseException(String message) {
		super(message);
		this.message = message;
		
	}
	public BaseException(Throwable message) {
		super(message);
	}

	public BaseException(LotteryEnum hCode) {
		super(hCode.getMsg());
		this.message = hCode.getMsg();
		this.hCode = hCode;
	}

	public LotteryEnum gethCode() {
		return hCode;
	}

	public void sethCode(LotteryEnum hCode) {
		this.hCode = hCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
