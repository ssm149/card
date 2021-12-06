package com.spring.card.vo;

import java.util.Date;


public class UserInfoEdu {
	private Integer edu_idx;
	private Integer user_idx;
	private String edu_school_name;
	private String edu_status;
	private Date edu_date;
	public Integer getEdu_idx() {
		return edu_idx;
	}
	public void setEdu_idx(Integer edu_idx) {
		this.edu_idx = edu_idx;
	}
	public Integer getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}
	public String getEdu_school_name() {
		return edu_school_name;
	}
	public void setEdu_school_name(String edu_school_name) {
		this.edu_school_name = edu_school_name;
	}
	public String getEdu_status() {
		return edu_status;
	}
	public void setEdu_status(String edu_status) {
		this.edu_status = edu_status;
	}
	public Date getEdu_date() {
		return edu_date;
	}
	public void setEdu_date(Date edu_date) {
		this.edu_date = edu_date;
	}
	
	
	
}
