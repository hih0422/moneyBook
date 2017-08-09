package com.javalec.moneybook.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class homeService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	homeDao hDao;
	
	public void inputMoney(HashMap<String, String> map)
	{
		hDao.inputMoney(map);
	}
	
	public void outputMoney(HashMap<String, String> map)
	{
		hDao.outputMoney(map);
	}

	public List<homeDto> getData(){
		ArrayList<homeDto> input = hDao.getData_input();
		ArrayList<homeDto> output = hDao.getData_output();
		List<homeDto> list = new ArrayList<homeDto>();
		
		
		for(int i=0; i<input.size(); i++){
			logger.info(input.get(i).toString());
			list.add(input.get(i));
		}
		
		for(int j=0; j<output.size(); j++){
			logger.info(output.get(j).toString());
			output.get(j).setColor("red");
			list.add(output.get(j));
		}
			
		return list;
	}
	
}
