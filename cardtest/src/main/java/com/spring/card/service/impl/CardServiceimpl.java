package com.spring.card.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.card.dao.CardDao;
import com.spring.card.service.CardService;
import com.spring.card.vo.UserInfo;

@Service
public class CardServiceimpl implements CardService {

	@Autowired
	CardDao cardDao;
	
	@Override
	public List<UserInfo> userList() {
		
		return cardDao.userList();
	}
	
	
}
