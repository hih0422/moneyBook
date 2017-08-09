package com.javalec.moneybook.graphs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class graphsService {
	
	Logger logger = Logger.getLogger(getClass());
	@Autowired
	graphsDao gDao;
	
	
	public List<Map<String,String>> getGraphsData(HashMap<String, String> map){
		List<Map<String,String>> barChartData =gDao.barChartData(map);
		
		System.out.println("바 차트 서비스 : " + barChartData.toString());
		
		return barChartData;
	}
	
}
