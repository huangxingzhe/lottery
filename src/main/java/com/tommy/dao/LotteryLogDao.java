package com.tommy.dao;

import java.util.List;
import java.util.Map;

import com.tommy.model.LotteryLog;

public interface LotteryLogDao {
	
	List<LotteryLog> query(Map<String,Object> params);

}
