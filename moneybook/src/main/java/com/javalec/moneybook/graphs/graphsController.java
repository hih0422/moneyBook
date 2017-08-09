

package com.javalec.moneybook.graphs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class graphsController {
	
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	graphsService gService;
	
	
	@RequestMapping("/getGraphsData.do")
	@ResponseBody
	public List<Map<String,String>> getGraphsData(@RequestParam HashMap<String, String> map){
		String account = map.get("account");
		HashMap<String, String> get_account = new HashMap<String, String>();
		System.out.println("컨트롤러로 온 계좌 : " + account);
		
		get_account.put("get_account", account);
		List<Map<String,String>> data = gService.getGraphsData(get_account);
		
		return data;
	}
	
	

}
