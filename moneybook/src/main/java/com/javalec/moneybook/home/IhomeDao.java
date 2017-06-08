package com.javalec.moneybook.home;

import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public interface IhomeDao {

	public void inoutputMoney(HashMap<String, String> map);
	
}
