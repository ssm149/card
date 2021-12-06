package com.spring.card.dao;

import java.util.List;

import com.spring.card.vo.UserInfo;

public interface UserInfoDao {


	//리스트 페이지
	public List<UserInfo> MinList();

	//회원 insert 
	public List<UserInfo> List(UserInfo userInfo);
	//public int MinInsert(UserInfo userInfo);
	
	//뷰페이지
	public UserInfo viewList(int userIdx);
	
	//삭제
	public int delete(int userIdx);
	
}
