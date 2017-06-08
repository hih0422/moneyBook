package com.javalec.moneybook.account;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public interface IaccDao {

	public void account_add(HashMap<String, String> map);
	public ArrayList<accountDto> account_list();
	public void account_delete(HashMap<String, String> map);
}
