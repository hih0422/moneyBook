package com.javalec.moneybook.statics;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class staticsDao implements IstaticsDao {

	@Autowired
	SqlSession sqlsession;

	@Override
	public int sum_input(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		int data = isDao.sum_input(data_map);
		return data;
	}
	
	@Override
	public int sum_output(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		int data = isDao.sum_output(data_map);
		return data;
	}
	
	@Override
	public int this_input(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		int data = isDao.this_input(data_map);
		return data;
	}
	
	@Override
	public int this_output(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		int data = isDao.this_output(data_map);
		return data;
	}
	
	@Override
	public double av_input(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		double data = isDao.av_input(data_map);
		return data;
	}
	
	@Override
	public double av_output(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		double data = isDao.av_output(data_map);
		return data;
	}
	
	@Override
	public int before_input(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		int data = isDao.before_input(data_map);
		return data;
	}
	
	@Override
	public int before_output(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		int data = isDao.before_output(data_map);
		return data;
	}
	
	@Override
	public double before_av_input(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		double data = isDao.before_av_input(data_map);
		return data;
	}
	
	@Override
	public double before_av_output(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		double data = isDao.before_av_output(data_map);
		return data;
	}

	@Override
	public HashMap<Object, Object> maxDeposit(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		HashMap<Object, Object> maxDeposit = isDao.maxDeposit(data_map);
		return maxDeposit;
	}
	
	@Override
	public HashMap<Object, Object> secDeposit(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		HashMap<Object, Object> secDeposit = isDao.secDeposit(data_map);
		return secDeposit;
	}
	
	@Override
	public HashMap<Object, Object> thrDeposit(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		HashMap<Object, Object> thrDeposit = isDao.thrDeposit(data_map);
		return thrDeposit;
	}
	
	@Override
	public HashMap<Object, Object> maxWithdraw(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		HashMap<Object, Object> maxWithdraw = isDao.maxWithdraw(data_map);
		return maxWithdraw;
	}
	
	@Override
	public HashMap<Object, Object> secWithdraw(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		HashMap<Object, Object> secWithdraw = isDao.secWithdraw(data_map);
		return secWithdraw;
	}
	
	@Override
	public HashMap<Object, Object> thrWithdraw(HashMap<String, String> data_map) {
		// TODO Auto-generated method stub
		IstaticsDao isDao = sqlsession.getMapper(IstaticsDao.class);
		HashMap<Object, Object> thrWithdraw = isDao.thrWithdraw(data_map);
		return thrWithdraw;
	}
	
	
}
