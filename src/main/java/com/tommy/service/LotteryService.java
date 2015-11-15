package com.tommy.service;

import java.util.List;
import java.util.Map;

import com.tommy.model.Lottery;
import com.tommy.model.Remark;
import com.tommy.model.dto.LotteryDTO;
import com.tommy.model.dto.LotteryLogDTO;
import com.tommy.model.enu.LotteryEnum;

public interface LotteryService {
	
	LotteryEnum addOrUpdate(LotteryDTO lot);
	
	List<Lottery> queryList(int startNo);
	
	Map<String,List<LotteryLogDTO>>  historyList(int startNo,String search);
	
	List<LotteryLogDTO>  query(int startNo,String search);
	
	int deleteByStartNo(int startNo);
	
	int delete(int id);

	String getMaxStartNo();
	
	int addRemark(Remark remark);
	
	Remark getRemark();
}
