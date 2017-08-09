package com.javalec.moneybook.graphs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public interface IgraphsDao {

	public List<Map<String,String>> barChartData(HashMap<String, String>map);
	public Map<String, String> getOutputGraphsData(HashMap<String, String>map);
}
