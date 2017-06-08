package com.javalec.moneybook.member;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javalec.moneybook.account.accountDto;
import com.javalec.moneybook.account.accountService;

@Controller
public class memberController {

	
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	memberService mService;
	
	@Autowired
	accountService accService;
	
	
	@RequestMapping("/intro.do")
	public ModelAndView home()
	{
		System.out.println("인트로------------------"); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("intro");
		return mav;
	}
	
	@RequestMapping("/member/login.do")
	public ModelAndView login()
	{
		System.out.println("로그인--------");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/member/loginOk.do")
	public String loginOk(mDto mdto, HttpServletRequest request)
	{
		System.out.println("로그인 오케이222222222222222222");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", mdto.getmId());
		map.put("pw", mdto.getmPw());
		String mId = mService.checkUser(map);
		if(mId.equals(mdto.getmId()))
		{
			System.out.println("아이디마즘");
			HttpSession session = request.getSession();
			session.setAttribute("id", mId);
			return "/home";
		}
		else if(mId.equals("noId"))
		{
			System.out.println("아이디 아님");
			return "/join";
		}
		System.out.println("리턴ㄴ바로전");
		
		return "redirect:/home";
	}
	
	@RequestMapping("/member/join.do")
	public String join()
	{
		System.out.println("조인---------");
		return "/join";
	}
	
	@RequestMapping("/member/joinOk.do")
	public String joinOk(mDto mdto)
	{
		System.out.println("조인 오케이------");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", mdto.getmId());
		map.put("pw", mdto.getmPw());
		map.put("name", mdto.getmName());
		map.put("address", mdto.getmAddress());
		map.put("phone", mdto.getmPhone());
		mService.insertMember(map);
		return "/login";
	}
	
	@RequestMapping("/member/idCheck.do")
	@ResponseBody
	public HashMap<String,Integer> idCheck(HttpServletRequest request)
	{
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		String mId =  request.getParameter("mId");
		System.out.println("아이디 체크 아이디--" + mId);
		
		int resultCount;
		int count = mService.checkId(mId);
		
		if(count ==0)
		{
			resultCount =0;
		}
		else
		{
			resultCount =1;
		}
		
		result.put("count",resultCount );
		
		return result;
	}
	
	@RequestMapping(value ={"/home.do"})
	public ModelAndView main(Model model)
	{
		System.out.println("메인------------------");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		
		ArrayList<accountDto> list = accService.account_list();
		System.out.println("어카운트리스트로 받아온 계좌목록" + list.toString());
		model.addAttribute("list",list);
		return mav;
	}
}
