package com.spring.card.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.card.dao.UserInfoDao;
import com.spring.card.vo.UserInfo;

@Repository
public class UserInfoDaoImpl implements UserInfoDao {

	@Autowired
	private SqlSession sqlSession;

	// 리스트 페이지
	public List<UserInfo> MinList() {

		return sqlSession.selectList("userInfoDao.MinList");
	}

	// 회원 insert
	public List<UserInfo> List(UserInfo userInfo) {
		return sqlSession.selectList("userInfoDao.List", userInfo);
	}
	// 회원 insert
	/*
	 * @Override public int MinInsert(UserInfo userInfo) { // TODO Auto-generated
	 * method stub return sqlSession.insert("userInfoDao.MinInsert", userInfo); }
	 */
	
	// 뷰페이지
	@Override
	public UserInfo viewList(int userIdx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userInfoDao.viewList",userIdx);
	}

	//삭제
	@Override
	public int delete(int userIdx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("userInfoDao.delete", userIdx);
	}

}
