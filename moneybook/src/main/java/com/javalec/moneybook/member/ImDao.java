package com.javalec.moneybook.member;

import java.sql.Timestamp;
import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public interface ImDao {
	public void insertMember(HashMap<String, Object> map);
	public mDto checkUser(HashMap<String, String> map);
	public mDto checkId(String mId);
}
