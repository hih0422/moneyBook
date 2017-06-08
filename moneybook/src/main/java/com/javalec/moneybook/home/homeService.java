package com.javalec.moneybook.home;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class homeService {

	@Autowired
	homeDao hDao;
	
	public void inoutputMoney(HashMap<String, String> map)
	{
		System.out.println("서비스인아웃풋 머니");
		hDao.inoutputMoney(map);
	}
}
