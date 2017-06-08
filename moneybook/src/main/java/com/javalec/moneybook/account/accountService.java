package com.javalec.moneybook.account;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class accountService {

	@Autowired
	accDao accdao;
	
	public void account_add(HashMap<String, String> map)
	{
		System.out.println("서비스  어카운트 인서트");
		accdao.account_add(map);
	}
	
	public ArrayList<accountDto> account_list()	
	{
		System.out.println("서비스 어카운트 리스트");
		ArrayList<accountDto> list =accdao.account_list();
		return list;
	}
	
	public void account_delete(HashMap<String, String> map)
	{
		System.out.println("서비스 어카운트 딜리트");
		accdao.account_delete(map);
		
	}
}
