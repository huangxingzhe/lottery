package com.tommy.common.ex;

import com.tommy.model.enu.LotteryEnum;

public class UserInputException extends BaseException{
	
	/**
	 * @param hCode
	 */
	public UserInputException(LotteryEnum hCode) {
		super(hCode);
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -2299556937834778577L;

}
