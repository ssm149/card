package com.spring.card.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.card.dao.CardDao;
import com.spring.card.vo.UserInfo;

@Repository
public class CardDaoimpl implements CardDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<UserInfo> userList() {
		
		return sqlSession.selectList("card.userList");
	}
	
}
