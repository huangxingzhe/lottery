package com.tommy.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tommy.common.FastJsonUtil;
import com.tommy.model.Lottery;
import com.tommy.model.Remark;
import com.tommy.model.dto.LotteryDTO;
import com.tommy.model.dto.LotteryLogDTO;
import com.tommy.model.enu.LotteryEnum;
import com.tommy.service.LotteryService;

@Controller
public class LotteryController {
	
	@Autowired
	private LotteryService service;
	
	@RequestMapping("/lot/index")
	public String index(Model model){
		model.addAttribute("remark", service.getRemark());
		return "add";
	}
	
	@RequestMapping("/lot/add")
	public void add(LotteryDTO lot,Model model,HttpServletResponse response) throws IOException{
		if(StringUtils.isEmpty(lot.getStartNo())){
			response.getWriter().write(FastJsonUtil.ajax(LotteryEnum.START_NO_ERROR));
			return;
		}
//		if(StringUtils.isEmpty(lot.getDataName())){
//			response.getWriter().write(FastJsonUtil.ajax(LotteryEnum.DATA_NAME_EMPTY));
//			return;
//		}
		LotteryEnum ret = service.addOrUpdate(lot);
		response.getWriter().write(FastJsonUtil.ajax(ret));
	}
	
	@RequestMapping("/lot/list")
	public String list(Model model,String startNo){
		if(StringUtils.isEmpty(startNo)){
			return "/list";
		}
		List<Lottery> list = service.queryList(Integer.valueOf(startNo));
		model.addAttribute("startNo", startNo);
		model.addAttribute("lots", list);
		return "/list";
	}
	
	@RequestMapping("/lot/delete")
	public void delete(Integer id,HttpServletResponse response) throws IOException{
		int ret = service.delete(id);
		response.getWriter().write(FastJsonUtil.ajaxSuccess());
	}

	@RequestMapping("/lot/history")
	public String history(Model model,String startNo){
		if(StringUtils.isEmpty(startNo)){
			return "/list";
		}
		Map<String,List<LotteryLogDTO>> map = service.historyList(Integer.valueOf(startNo),null);
		model.addAttribute("startNo", startNo);
		model.addAllAttributes(map);
		return "/history";
	}
	
	@RequestMapping("/lot/search")
	public String search(Model model,String startNo,String dataName){
		List<LotteryLogDTO> list = service.query(Integer.valueOf(startNo),dataName);
		model.addAttribute("lots", list);
		return "/search";
	}

	@RequestMapping("/lot/add/remark")
	public void addRemark(Remark remark,Model model,HttpServletResponse response) throws IOException{
		service.addRemark(remark);
		model.addAttribute("remark", remark);
		response.getWriter().write(FastJsonUtil.ajaxSuccess());
	}
}
