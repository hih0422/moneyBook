package com.javalec.moneybook.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;

@Component
public interface IhomeDao {

	public void inputMoney(HashMap<String, String> map);
	public void outputMoney(HashMap<String, String> map);
	public ArrayList<homeDto> getData_input();
	public ArrayList<homeDto> getData_output();
	
}
