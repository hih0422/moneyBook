package com.javalec.moneybook.member;

import java.sql.Timestamp;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


@Component
public class mDao implements ImDao {

	@Autowired
	SqlSession sqlsession;
	
/*	JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}*/
	
	@Override
	public void insertMember(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("dao 인서트맴버");
		ImDao dao = sqlsession.getMapper(ImDao.class);
		dao.insertMember(map);
	}

	@Override
	public mDto checkUser(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		System.out.println("dao체크유저");
		ImDao Idao = sqlsession.getMapper(ImDao.class);
		mDto mdto = Idao.checkUser(map);
		return mdto;
	}

	@Override
	public mDto checkId(String mId) {
		// TODO Auto-generated method stub
		ImDao Idao = sqlsession.getMapper(ImDao.class);
		mDto mdto = Idao.checkId(mId);
		
		return mdto;
	}
	
	

}
