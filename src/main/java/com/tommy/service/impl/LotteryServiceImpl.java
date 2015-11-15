package com.tommy.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.tommy.common.Limit;
import com.tommy.common.ex.UserInputException;
import com.tommy.dao.LotteryLogDao;
import com.tommy.dao.LotteryLogMapper;
import com.tommy.dao.LotteryMapper;
import com.tommy.dao.RemarkMapper;
import com.tommy.model.Lottery;
import com.tommy.model.LotteryExample;
import com.tommy.model.LotteryLog;
import com.tommy.model.LotteryLogExample;
import com.tommy.model.LotteryLogExample.Criteria;
import com.tommy.model.Remark;
import com.tommy.model.RemarkExample;
import com.tommy.model.dto.LotteryDTO;
import com.tommy.model.dto.LotteryLogDTO;
import com.tommy.model.enu.LotteryEnum;
import com.tommy.service.LotteryService;

@Service
public class LotteryServiceImpl implements LotteryService{
	@Autowired
	private LotteryMapper mapper;
	@Autowired
	private LotteryLogMapper lotteryLogMapper;
	@Autowired
	private RemarkMapper remarkMapper;
	@Autowired
	private LotteryLogDao dao;
	
	@Transactional
	@Override
	public LotteryEnum addOrUpdate(LotteryDTO lot) {
		for(int i=0;i<5;i++){
			int q = i==0?lot.getQianRadio1():i==1?lot.getQianRadio2():i==2?lot.getQianRadio3():i==3?lot.getQianRadio4():i==4?lot.getQianRadio5():0;
			int b = i==0?lot.getBaiRadio1():i==1?lot.getBaiRadio2():i==2?lot.getBaiRadio3():i==3?lot.getBaiRadio4():i==4?lot.getBaiRadio5():0;
			int s = i==0?lot.getShiRadio1():i==1?lot.getShiRadio2():i==2?lot.getShiRadio3():i==3?lot.getShiRadio4():i==4?lot.getShiRadio5():0;
			int g = i==0?lot.getGewRadio1():i==1?lot.getGewRadio2():i==2?lot.getGewRadio3():i==3?lot.getGewRadio4():i==4?lot.getGewRadio5():0;
			add(lot.getStartNo(),lot.getDataName()[i],LotteryEnum.DIGIT_QIAN.getCode(),
					lot.getQian()[i],q);
			add(lot.getStartNo(),lot.getDataName()[i],LotteryEnum.DIGIT_BAI.getCode(),
					lot.getBai()[i],b);
			add(lot.getStartNo(),lot.getDataName()[i],LotteryEnum.DIGIT_SHI.getCode(),
					lot.getShi()[i],s);
			add(lot.getStartNo(),lot.getDataName()[i],LotteryEnum.DIGIT_GE.getCode(),
						lot.getGew()[i],g);
		}
		
		return LotteryEnum.SUCCESS;
	}
	
	private void add(int startNo,String dataName,int type,String digit,int radio){
		if(StringUtils.isEmpty(digit))
			return;
		if(StringUtils.isEmpty(digit) || !digit.matches("^[-+]?(([0-9]+)([.]([0-9]+))?|([.]([0-9]+))?)$")){
			throw new UserInputException(LotteryEnum.DIGIT_ERROR);
		}
		//判断数据名称是否存在
		if(!StringUtils.isEmpty(dataName)){
			LotteryLogExample example = new LotteryLogExample();
			example.createCriteria().andStartNoEqualTo(startNo).andDataNameEqualTo(dataName).andPositionEqualTo(type);
			List<LotteryLog> logs = lotteryLogMapper.selectByExample(example);
			if(logs != null  && logs.size()>0){
				throw new UserInputException(LotteryEnum.DATA_NAME_EXSIST);
			}
		}
		
		LotteryExample example2 = new LotteryExample();
		example2.createCriteria().andStartNoEqualTo(startNo).andTypeEqualTo(type);
		List<Lottery> list = mapper.selectByExample(example2);
		Lottery lottery = new Lottery();
		if(list !=null && list.size()>0){
			lottery = list.get(0);
		}
		
		String reverse = "";//需要统计个数的
		if(radio == 1){//默认反数
			reverse = getReverse(digit); 
		}else if(radio ==2){//杀数
			reverse = digit;
		}
		int count = 0;
		for(int i=0;i<reverse.length();i++){
			int s = Integer.valueOf(reverse.substring(i, i+1));
			if(s==0){
				count = lottery.getZero() == null?0:lottery.getZero();
				lottery.setZero(count+1);
			}else if(s==1){
				count = lottery.getOne() == null?0:lottery.getOne();
				lottery.setOne(count+1);
			}else if(s==2){
				count = lottery.getTwo() == null?0:lottery.getTwo();
				lottery.setTwo(count+1);
			}else if(s==3){
				count = lottery.getThree() == null?0:lottery.getThree();
				lottery.setThree(count+1);
			}else if(s==4){
				count = lottery.getFour() == null?0:lottery.getFour();
				lottery.setFour(count+1);
			}else if(s==5){
				count = lottery.getFive() == null?0:lottery.getFive();
				lottery.setFive(count+1);
			}else if(s==6){
				count = lottery.getSix() == null?0:lottery.getSix();
				lottery.setSix(count+1);
			}else if(s==7){
				count = lottery.getSeven() == null?0:lottery.getSeven();
				lottery.setSeven(count+1);
			}else if(s==8){
				count = lottery.getEight() == null?0:lottery.getEight();
				lottery.setEight(count+1);
			}else if(s==9){
				count = lottery.getNine() == null?0:lottery.getNine();
				lottery.setNine(count+1);
			}
			
		}
	
		//记录数据
		LotteryLog lotLog = new LotteryLog();
		lotLog.setContent(digit);//输入的内容
		lotLog.setReverse(reverse);//需要统计的内容
		lotLog.setDataName(dataName);
		lotLog.setRadio(radio);
		lotLog.setStartNo(startNo);
		lotLog.setPosition(type);
		lotteryLogMapper.insertSelective(lotLog);
		//统计数据
		if(lottery.getId()==null){
			lottery.setStartNo(startNo);
			lottery.setCreateTime(new Date());
			lottery.setType(type);
			mapper.insertSelective(lottery);
		}else {
			mapper.updateByPrimaryKeySelective(lottery);
		}
	}
	
	private String getReverse(String digit){
		if(digit == null)
			return null;
		StringBuilder sb = new StringBuilder();
		String source = "0123456789";
		digit = StringUtils.trimAllWhitespace(digit);
		boolean flag = false;
		for(int j=0;j<source.length();j++){
			flag = false;
			for(int i=0;i<digit.length();i++){
				if(source.charAt(j)==digit.charAt(i)){
					flag = true;
				}
			}
			if(!flag){
				sb.append(source.charAt(j));
			}
		}
		return sb.toString();
	}

	@Override
	public List<Lottery> queryList(int startNo) {
		LotteryExample example = new LotteryExample();
		example.createCriteria().andStartNoEqualTo(startNo);
		example.setOrderByClause(" type asc");
		return mapper.selectByExample(example);
	}

	
	@Override
	public Map<String,List<LotteryLogDTO>> historyList(int startNo,String search) {
		
		LotteryLogExample example = new LotteryLogExample();
		Criteria cri = example.createCriteria();
		cri.andStartNoEqualTo(startNo);
		if(!StringUtils.isEmpty(search)){
			cri.andDataNameLike(search);
		}
		example.setOrderByClause(" id desc");
	    List<LotteryLog> lots =  lotteryLogMapper.selectByExample(example);
	    Map<String,List<LotteryLogDTO>> mapList = new HashMap<String, List<LotteryLogDTO>>();
	    List<LotteryLogDTO> qian = new ArrayList<LotteryLogDTO>();
	    List<LotteryLogDTO> bai = new ArrayList<LotteryLogDTO>();
	    List<LotteryLogDTO> shi = new ArrayList<LotteryLogDTO>();
	    List<LotteryLogDTO> gew = new ArrayList<LotteryLogDTO>();
	    for(LotteryLog l : lots){
	    	LotteryLogDTO dto = new LotteryLogDTO();
	    	dto.setId(l.getId());
	    	dto.setDataName(l.getDataName());
	    	dto.setType(l.getPosition());
	    	dto.setRadio(l.getRadio());
	    	if(!StringUtils.isEmpty(l.getReverse())){
	    		for(int i=0;i<l.getReverse().length();i++){
	    			int s = Integer.valueOf(l.getReverse().substring(i, i+1));
	    			if(s==0)
	    				dto.setZero(1+"");
	    			else if(s==1)
	    				dto.setOne(1+"");
	    			else if(s==2)
	    				dto.setTwo(1+"");
	    			else if(s==3)
	    				dto.setThree(1+"");
	    			else if(s==4)
	    				dto.setFour(1+"");
	    			else if(s==5)
	    				dto.setFive(1+"");
	    			else if(s==6)
	    				dto.setSix(1+"");
	    			else if(s==7)
	    				dto.setSeven(1+"");
	    			else if(s==8)
	    				dto.setEight(1+"");
	    			else if(s==9)
	    				dto.setNine(1+"");
	    		}
	    	}
	    	if(dto.getType()==1){
	    		qian.add(dto);
	    	}else if(dto.getType()==2){
	    		bai.add(dto);
	    	}else if(dto.getType()==3){
	    		shi.add(dto);
	    	}else if(dto.getType()==4){
	    		gew.add(dto);
	    	}
	    }
	    mapList.put("qian", qian);
    	mapList.put("bai", bai);
    	mapList.put("shi", shi);
    	mapList.put("gew", gew);
	    return mapList;
	}
	
	

	@Override
	public List<LotteryLogDTO> query(int startNo, String search) {
		Map<String,Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("startNo", startNo);
		paramsMap.put("dataName", search);
	    List<LotteryLog> lots =  dao.query(paramsMap);
	    List<LotteryLogDTO> list = new ArrayList<LotteryLogDTO>();
	    for(LotteryLog l : lots){
	    	LotteryLogDTO dto = new LotteryLogDTO();
	    	dto.setId(l.getId());
	    	dto.setDataName(l.getDataName());
	    	dto.setType(l.getPosition());
	    	dto.setRadio(l.getRadio());
	    	if(!StringUtils.isEmpty(l.getReverse())){
	    		for(int i=0;i<l.getReverse().length();i++){
	    			int s = Integer.valueOf(l.getReverse().substring(i, i+1));
	    			if(s==0)
	    				dto.setZero(1+"");
	    			else if(s==1)
	    				dto.setOne(1+"");
	    			else if(s==2)
	    				dto.setTwo(1+"");
	    			else if(s==3)
	    				dto.setThree(1+"");
	    			else if(s==4)
	    				dto.setFour(1+"");
	    			else if(s==5)
	    				dto.setFive(1+"");
	    			else if(s==6)
	    				dto.setSix(1+"");
	    			else if(s==7)
	    				dto.setSeven(1+"");
	    			else if(s==8)
	    				dto.setEight(1+"");
	    			else if(s==9)
	    				dto.setNine(1+"");
	    		}
	    	}
	    	list.add(dto);
	    }
	    return list;
	}

	@Override
	public int deleteByStartNo(int startNo) {
		LotteryExample example = new LotteryExample();
		example.createCriteria().andStartNoEqualTo(startNo);
		return mapper.deleteByExample(example);
	}

	@Transactional
	@Override
	public int delete(int id) {
		LotteryLog lotlog = lotteryLogMapper.selectByPrimaryKey(id);
		if(lotlog == null)
			return 1;
		LotteryExample example = new LotteryExample();
		example.createCriteria().andStartNoEqualTo(lotlog.getStartNo()).andTypeEqualTo(lotlog.getPosition());
		List<Lottery> lotterys = mapper.selectByExample(example);
		Lottery lottery = null;
		if(lotterys!=null && lotterys.size()>0){
			lottery = lotterys.get(0);
				//查找已被統計的數字
				String content = lotlog.getRadio()==1?lotlog.getReverse():lotlog.getContent();
				System.out.println("lotLog:"+lotlog.getId()+" content:"+content);
				for(int i=0;i<content.length();i++){
					int s = Integer.valueOf(content.substring(i, i+1));
					if(s==0)
	    				lottery.setZero(lottery.getZero()-1);
	    			else if(s==1)
	    				lottery.setOne(lottery.getOne()-1);
	    			else if(s==2)
	    				lottery.setTwo(lottery.getTwo()-1);
	    			else if(s==3)
	    				lottery.setThree(lottery.getThree()-1);
	    			else if(s==4)
	    				lottery.setFour(lottery.getFour()-1);
	    			else if(s==5)
	    				lottery.setFive(lottery.getFive()-1);
	    			else if(s==6)
	    				lottery.setSix(lottery.getSix()-1);
	    			else if(s==7)
	    				lottery.setSeven(lottery.getSeven()-1);
	    			else if(s==8)
	    				lottery.setEight(lottery.getEight()-1);
	    			else if(s==9)
	    				lottery.setNine(lottery.getNine()-1);
				}
				mapper.updateByPrimaryKeySelective(lottery);
		}
		int ret = lotteryLogMapper.deleteByPrimaryKey(id);
		return ret;
	}

	@Override
	public String getMaxStartNo() {
		LotteryExample example = new LotteryExample();
		example.setLimit(Limit.buildLimit(1, 1));
		example.setOrderByClause(" start_no desc");
		mapper.selectByExample(example);
		return null;
	}

	@Override
	public int addRemark(Remark remark) {
		remark.setCreateTime(new Date());
		if(remark.getId()==null){
			return remarkMapper.insertSelective(remark);
		}else{
			return remarkMapper.updateByPrimaryKeySelective(remark);
		}
		
	}

	@Override
	public Remark getRemark() {
		RemarkExample example = new RemarkExample();
		example.setOrderByClause(" id desc");
		example.setLimit(Limit.buildLimit(1, 1));
		List<Remark> list = remarkMapper.selectByExample(example);
		if(list != null && list.size()>0)
			return list.get(0);
		return null;
	}
	
	
}
