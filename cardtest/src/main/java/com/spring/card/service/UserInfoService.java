package com.spring.card.service;

import java.util.*;

import com.spring.card.vo.UserInfo;


public interface UserInfoService {
	
	//리스트 페이지
	public List<UserInfo> MinList();
	
	// 회원 insert
	public List<UserInfo> List(UserInfo userInfo);
	//public int MinInsert(UserInfo userInfo);
	
	//뷰페이지
	public UserInfo viewList(int intUserIdx);
	
	//삭제
	public int delete(int userIdx);
	
}