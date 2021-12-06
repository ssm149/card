package com.spring.card.vo;

import java.util.Date;


public class UserInfoTraining {
	private Integer training_idx;
	private Integer user_idx;
	private String training_name;
	private Date training_startdate;
	private Date training_enddate;
	private String training_agency;
	public Integer getTraining_idx() {
		return training_idx;
	}
	public void setTraining_idx(Integer training_idx) {
		this.training_idx = training_idx;
	}
	public Integer getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}
	public String getTraining_name() {
		return training_name;
	}
	public void setTraining_name(String training_name) {
		this.training_name = training_name;
	}
	public Date getTraining_startdate() {
		return training_startdate;
	}
	public void setTraining_startdate(Date training_startdate) {
		this.training_startdate = training_startdate;
	}
	public Date getTraining_enddate() {
		return training_enddate;
	}
	public void setTraining_enddate(Date training_enddate) {
		this.training_enddate = training_enddate;
	}
	public String getTraining_agency() {
		return training_agency;
	}
	public void setTraining_agency(String training_agency) {
		this.training_agency = training_agency;
	}
	
	
	
	
}
