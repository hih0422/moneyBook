package com.javalec.moneybook.home;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class homeController {
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	homeService homeService;
	
	@RequestMapping("/inoutputMoney.do")
	@ResponseBody
	public String inoutputMoney(homeDto hdto)
	{
		System.out.println("인풋아웃풋머니");
		HashMap<String, String> map = new HashMap<String, String>();
		System.out.println("아웃풋머니로그"+hdto.input+"//"+hdto.output);
		map.put("input", hdto.input);
		map.put("output", hdto.output);
		homeService.inoutputMoney(map);
		String code ="1";
		return code;
	}
}
