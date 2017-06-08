package com.javalec.moneybook.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class memberService {


	@Autowired
	private mDao mdao;
	
	
	public void insertMember(HashMap<String, Object> map)
	{
		System.out.println("서비스 인서트맴버");
		mdao.insertMember(map);
	}
	
	public String checkUser(HashMap<String, String> map)
	{
		System.out.println("서비스 체크유저");
		mDto dto = mdao.checkUser(map);
		String id;
		if(dto== null)
		{
			id= "noId";
		}
		else
		{
			id = dto.getmId();
		}
		System.out.println("서비스 체크유저 리턴되는 아이디 "+  id);
		return id;
	}
	
	public int checkId(String id)
	{
		System.out.println("서비스 아이디체크");
		int count=0;
		mDto dto = mdao.checkId(id);
		if(dto == null) //아이디 사용가능
		{
			count =0;
		}
		else if(dto!=null) //아이디사용불가
		{
			count = 1;
		}
		return count;
	}
}
