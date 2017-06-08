package com.javalec.moneybook.account;

public class accountDto {
	
	String accNo;	
	String accName;
	String accNumber;
	
	
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public String getAccNumber() {
		return accNumber;
	}
	@Override
	public String toString() {
		return "accountDto [accNo=" + accNo + ", accName=" + accName + ", accNumber=" + accNumber + "]";
	}
	public void setAccNumber(String accNumber) {
		this.accNumber = accNumber;
	}
}
