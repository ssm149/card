package com.spring.card.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.card.dao.UserInfoDao;
import com.spring.card.service.UserInfoService;
import com.spring.card.vo.UserInfo;


@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfoDao Dao;

	//리스트 페이지
	@Override
	public List<UserInfo> MinList() {
		// TODO Auto-generated method stub
		return Dao.MinList();
	}
	// 회원 insert
	@Override
	public List<UserInfo> List(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return Dao.List(userInfo);
	}
	/*
	 * @Override public int MinInsert(UserInfo userInfo) { // TODO Auto-generated
	 * method stub return Dao.MinInsert(userInfo); }
	 */

	//뷰페이지
	@Override
	public UserInfo viewList(int userIdx) {
		// TODO Auto-generated method stub
		return Dao.viewList(userIdx);
	}

	//삭제
	@Override
	public int delete(int userIdx) {
		// TODO Auto-generated method stub
		return Dao.delete(userIdx);
	}

	

	



	

	



}
