package com.javalec.moneybook.account;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class accDao implements IaccDao {

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void account_add(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		IaccDao iadao = sqlsession.getMapper(IaccDao.class);
		iadao.account_add(map);
	}

	@Override
	public ArrayList<accountDto> account_list() {
		// TODO Auto-generated method stub
		IaccDao iadao = sqlsession.getMapper(IaccDao.class);
		ArrayList<accountDto> list = iadao.account_list();
		return list;
	}

	@Override
	public void account_delete(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		IaccDao iadao = sqlsession.getMapper(IaccDao.class);
		iadao.account_delete(map);
	}
	
	

	
}
