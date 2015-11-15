package com.tommy.model.enu;

public enum LotteryEnum {
	DIGIT_QIAN(1),DIGIT_BAI(2),DIGIT_SHI(3),DIGIT_GE(4),
	SUCCESS(1000,"成功"),
	ERROR(1001,"失败"),
	DIGIT_ERROR(1002,"数字填写错误"),
	START_NO_ERROR(1003,"开奖期号错误"),
	DATA_NAME_EXSIST(1004,"该名称已录入"),
	DATA_NAME_EMPTY(1005,"名称不能为空");
	
	private int code;
	private String msg;
	LotteryEnum(int code){
		this.code = code;
	}
	LotteryEnum(int code,String msg){
		this.code = code;
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
