package com.javalec.moneybook.account;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;import org.eclipse.jdt.internal.compiler.ast.ThisReference;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.common.LoggerManager;

@Controller	
public class accountController {

	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	accountService accService;
	
	@RequestMapping("/account_list.do")
	public String account_list(Model model) {
		ArrayList<accountDto> list = accService.account_list();
		System.out.println("어카운트리스트로 받아온 계좌목록" + list.toString());
		model.addAttribute("list", list);
		return "/account_list";
	}
	
	
	@RequestMapping(value="/account_Add.do", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> account_add(accountDto adto) {
		LoggerManager.getInfoLogger(this.getClass(), "====== Logger Test ======");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accName", adto.accName);
		map.put("accNumber", adto.accNumber);
		System.out.println("account");
		
		accService.account_add(map);
		
		map.clear();
		map.put("code", "1");
		
		return map;
	}
	
	@RequestMapping("/account_Delete.do")
	public String account_delete(accountDto adto) {
		System.out.println("어카운트 딜리트---------");
		System.out.println("지울 번호 " + adto.accNo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accNo", adto.accNo);
		accService.account_delete(map);
		
		return "redirect:/account_list.do";
	}
	
	
}
