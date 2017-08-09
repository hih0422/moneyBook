package com.javalec.moneybook.graphs;

public class graphsDto {

	String start;
	int input_sum;
	int output_sum;

	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public int getInput_sum() {
		return input_sum;
	}
	public void setInput_sum(int input_sum) {
		this.input_sum = input_sum;
	}
	public int getOutput_sum() {
		return output_sum;
	}
	public void setOutput_sum(int output_sum) {
		this.output_sum = output_sum;
	}
	

	
	public String toString(){
		return "graphsDto[input_sum : " + input_sum + " output_sum" + output_sum + "start " + start + "]";
	}
	

}
