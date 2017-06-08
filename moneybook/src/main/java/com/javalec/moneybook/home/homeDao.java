package com.javalec.moneybook.home;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class homeDao implements IhomeDao {

	@Autowired
	SqlSession sqlsession;

	@Override
	public void inoutputMoney(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		IhomeDao ihomeDao = sqlsession.getMapper(IhomeDao.class);
		ihomeDao.inoutputMoney(map);
	}
	
	
}
