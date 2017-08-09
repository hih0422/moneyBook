package com.javalec.moneybook.home;

import java.sql.Timestamp;
import java.util.Date;

public class homeDto {

	String input;
	String output;
	String start; 
	String title;
	String color;
	

	public String getCallDate() {
		return start;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public void setCallDate(String pDate) {
		this.start = pDate;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}
	public String getOutput() {
		return output;
	}
	public void setOutput(String output) {
		this.output = output;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setAttrTitle(String output , String input) {
		setTitle("입금:"+ input + " 출금:"+ output);
	}
	
	public void setAttrInput(String input){
		setTitle(input);
	}
	
	public void setAttrOutput(String output){
		setTitle(output);
	}

	@Override
	public String toString() {
		return "homeDto [input=" + input + ", output=" + output + ", start=" + start + ", title=" + title + "]";
	}
}
