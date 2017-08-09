package com.javalec.moneybook.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.moneybook.account.accountDto;
import com.javalec.moneybook.account.accountService;

@Controller
public class homeController {
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	homeService homeService;
	
	@Autowired
	accountService accService;
	
	ArrayList<Map<String, Object>> calList;
	
	@RequestMapping("/inoutputMoney.do")
	@ResponseBody
	public List<Map<String, Object>> inoutputMoney(homeDto hdto, @RequestParam HashMap<String,String> map)
	{
		System.out.println("ㄱㄱㄱㄱㄱㄱㄱ");
		//입금,출금 디비에 넣기
		HashMap<String, String> inputMap = new HashMap<String, String>();
		HashMap<String, String> outputMap = new HashMap<String, String>();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		
		String getMoney = map.get("getMoney");
		String moneyValue = map.get("moneyValue");
		String account = map.get("account");
		String category = map.get("category");
		
		if(moneyValue.equals("1")){
			System.out.println("입금 디비 입력");
			inputMap.put("input", getMoney);
			inputMap.put("start", hdto.start);
			inputMap.put("account", account);
			inputMap.put("type", "input");
			inputMap.put("category", category);
			System.out.println("어카운트 : " + account);
			homeService.inputMoney(inputMap);
			
			dataMap.put("title",getMoney);
			dataMap.put("start", hdto.start);
			list.add(dataMap);
		}
		else if(moneyValue.equals("2")){
			System.out.println("출금 디비 입력");
			outputMap.put("output", getMoney);
			outputMap.put("start", hdto.start);
			outputMap.put("account", account);
			outputMap.put("type", "output");
			outputMap.put("category", category);
			homeService.outputMoney(outputMap);
			
			dataMap.put("title", getMoney);
			dataMap.put("start", hdto.start);
			dataMap.put("color", "red");
			list.add(dataMap);
		}
		return list;
	}
	
	@RequestMapping("/getData.do")
	@ResponseBody
	public List<homeDto> getData(){
		System.out.println("데이터 전부 가져오기");
		//전체 디비 불러옴
		List<homeDto> data = homeService.getData();
		
		return data;	
	}
	
	@RequestMapping("/graphs.do")
	public ModelAndView graphs(Model model, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("graph");
		HttpSession session = request.getSession();
		String sessionID = (String) session.getAttribute("id");
		ArrayList<accountDto> list  = accService.account_list(sessionID);
		model.addAttribute("list",list);
		System.out.println("그래프에서 어카운트 받기");
		return mav;
	}
}
