package com.javalec.moneybook.statics;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public interface IstaticsDao {
	public int sum_input(HashMap<String, String> data_map);
	public int sum_output(HashMap<String, String> data_map);
	public int this_input(HashMap<String, String> data_map);
	public int this_output(HashMap<String, String> data_map);
	public double av_input(HashMap<String, String> data_map);
	public double av_output(HashMap<String, String> data_map);
	public int before_input(HashMap<String, String> data_map);
	public int before_output(HashMap<String, String> data_map);
	public double before_av_input(HashMap<String, String> data_map);
	public double before_av_output(HashMap<String, String> data_map);
	public HashMap<Object, Object> maxDeposit(HashMap<String, String> data_map);
	public HashMap<Object, Object> secDeposit(HashMap<String, String> data_map);
	public HashMap<Object, Object> thrDeposit(HashMap<String, String> data_map);
	public HashMap<Object, Object> maxWithdraw(HashMap<String, String> data_map);
	public HashMap<Object, Object> secWithdraw(HashMap<String, String> data_map);
	public HashMap<Object, Object> thrWithdraw(HashMap<String, String> data_map);
}
