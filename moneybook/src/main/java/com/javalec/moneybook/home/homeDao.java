package com.javalec.moneybook.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class homeDao implements IhomeDao {

	@Autowired
	SqlSession sqlsession;

	@Override
	public void inputMoney(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		IhomeDao ihomeDao = sqlsession.getMapper(IhomeDao.class);
		ihomeDao.inputMoney(map);
	}
	
	@Override
	public void outputMoney(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		IhomeDao ihomeDao = sqlsession.getMapper(IhomeDao.class);
		ihomeDao.outputMoney(map);	
	}

	@Override
	public ArrayList<homeDto> getData_input() {
		// TODO Auto-generated method stub
		IhomeDao ihomeDao = sqlsession.getMapper(IhomeDao.class);
		ArrayList<homeDto> data = ihomeDao.getData_input();
		return data;
	}

	@Override
	public ArrayList<homeDto> getData_output() {
		// TODO Auto-generated method stub
		IhomeDao ihomeDao = sqlsession.getMapper(IhomeDao.class);
		ArrayList<homeDto> data = ihomeDao.getData_output();
		return data;
	}




}
