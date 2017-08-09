package com.javalec.moneybook.graphs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class graphsDao implements IgraphsDao{
	@Autowired
	SqlSession sqlsession;
	
	public List<Map<String,String>> barChartData(HashMap<String, String> map){
		IgraphsDao igDao = sqlsession.getMapper(IgraphsDao.class);
		List<Map<String,String>> data = igDao.barChartData(map);
		return data;
	}

	@Override
	public  Map<String,String> getOutputGraphsData(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		IgraphsDao igDao = sqlsession.getMapper(IgraphsDao.class);
		 Map<String,String> data = igDao.getOutputGraphsData(map);
		return data;
	}
	

}
