package com.javalec.moneybook.statics;

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
public class staticsController {

	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	staticsService sService;
	
	@Autowired
	accountService accService;
	
	@RequestMapping("/statics.do")
	public ModelAndView statics(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		String sessionID = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("statics");
		
		ArrayList<accountDto> list  = accService.account_list(sessionID);
		model.addAttribute("list",list);
		System.out.println("스태틱 컨트롤러그래프에서 어카운트 받기");
		return mav;
	}
	
	@RequestMapping("/getStaticsData.do")
	@ResponseBody
	public ArrayList<Object> getSData(@RequestParam HashMap<String, String> map ){
		String account = map.get("account");
		System.out.println("스태틱 데이터 얻기  계좌 //" + account);
		HashMap<String, String> data_map = new HashMap<String, String>();
		
		data_map.put("give_account", account);
		
		ArrayList<Object> data = sService.get_statics(data_map);
		return data;
	}
	
	@RequestMapping("/getTable")
	@ResponseBody
	public ArrayList<Object> getTable(@RequestParam HashMap<String, String> map) {
		String account = map.get("account");
		HashMap<String, String> table_data = new HashMap<String, String>();
		table_data.put("give_account", account);
		ArrayList<Object>data = sService.getTable(table_data);
		return data;
	}
	
	

	
}
