package com.javalec.moneybook.statics;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class staticsService {

	@Autowired
	staticsDao sDao;
	
	public ArrayList<Object> get_statics(HashMap<String, String> data_map){
		int sum_input = sDao.sum_input(data_map);
		int sum_output = sDao.sum_output(data_map);
		int this_input = sDao.this_input(data_map);
		int this_output = sDao.this_output(data_map);
		double av_input = Double.parseDouble((String.format("%.2f", sDao.av_input(data_map))));
		double av_output = Double.parseDouble((String.format("%.2f", sDao.av_output(data_map))));
		int before_input = sDao.before_input(data_map);
		int before_output = sDao.before_output(data_map);
		double before_av_input = sDao.before_av_input(data_map);
		double before_av_output = sDao.before_av_output(data_map);
		
		String input_rate = input_rating((double)this_input,(double)before_input);
		String output_rate = output_rating((double)this_output,(double)before_output);
		String input_av_rate =input_rating(av_input,before_av_input);
		String output_av_rate = output_rating(av_output,before_av_output);
		
		String input_rate_num = input_rate.split("/")[0];
		String input_rate_reg = input_rate.split("/")[1];
		String output_rate_num = output_rate.split("/")[0];
		String output_rate_reg = output_rate.split("/")[1];
		String input_av_num = input_av_rate.split("/")[0];
		String input_av_reg = input_av_rate.split("/")[1];
		String output_av_num = output_av_rate.split("/")[0];
		String output_av_reg = output_av_rate.split("/")[1];
		
		System.out.println("전체 입금 합 :" + sum_input + " 전체 출금 합 : " + sum_output + " 평균 입금 : " + av_input + " 평균 출금 : " + av_output);
		System.out.println("이번달 입금 " + this_input + " 저번달 입금 : " + before_input + " 이번달 출금 : " + this_output + " 저번달 출금 : " + before_output);
		System.out.println("입금 전달 대비 증가 or 감소 :" + input_rate_num +" 업다운: " + input_rate_reg +  "출금 전달 대비 증가or감소 : " + output_rate_num + " 업다운 :" + output_rate_reg);;

		ArrayList<Object> statics_data = new ArrayList<Object>();
		statics_data.add(sum_input);
		statics_data.add(sum_output);
		statics_data.add(this_input);
		statics_data.add(this_output);
		statics_data.add(av_input);
		statics_data.add(av_output);
		statics_data.add(input_rate_num);
		statics_data.add(input_rate_reg);
		statics_data.add(output_rate_num);
		statics_data.add(output_rate_reg);
		statics_data.add(input_av_num);
		statics_data.add(input_av_reg);
		statics_data.add(output_av_num);
		statics_data.add(output_av_reg);
		
		
		return statics_data;
	}
	
	public String input_rating(double this_input,double before_input){
		//DecimalFormat form = new DecimalFormat("#.##");
		double input_up_rate=0;
		double input_down_rate=0;
		double input_rate = (this_input / before_input);
		if(input_rate>=1){
			 input_up_rate = Double.parseDouble(String.format("%.2f", input_rate));
			 return input_up_rate*100+"/up";
		}else{
			 input_down_rate =Double.parseDouble(String.format("%.2f", input_rate));
			 return input_down_rate*100+"/down";
		}
	}
	
	public String output_rating(double this_output,double before_output){
		//DecimalFormat form = new DecimalFormat("#.##");
		double output_up_rate=0;
		double output_down_rate=0
				;
		double output_rate = (this_output / before_output);
		if(output_rate>=1){
			output_up_rate = Double.parseDouble((String.format("%.2f", output_rate)));
			 return output_up_rate*100+"/up";
		}else{
			output_down_rate = Double.parseDouble((String.format("%.2f", output_rate)));
			 return output_down_rate*100+"/down";
		}
	}
	
	
	public ArrayList<Object> getTable(HashMap<String, String> data_map){
		HashMap<Object, Object> max_Deposit = sDao.maxDeposit(data_map);
		HashMap<Object, Object> sec_Deposit = sDao.secDeposit(data_map);
		HashMap<Object, Object> thr_Deposit = sDao.thrDeposit(data_map);
		
		HashMap<Object, Object> max_Withdraw = sDao.maxWithdraw(data_map);
		HashMap<Object, Object> sec_Withdraw = sDao.secWithdraw(data_map);
		HashMap<Object, Object> thr_Withdraw = sDao.thrWithdraw(data_map);
		
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(max_Deposit);
		list.add(sec_Deposit);
		list.add(thr_Deposit);
		list.add(max_Withdraw);
		list.add(sec_Withdraw);
		list.add(thr_Withdraw);
		return list;
	}

	
	
}
