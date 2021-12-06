package com.spring.card.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.card.HomeController;
import com.spring.card.service.CardService;
import com.spring.card.vo.UserInfo;

@Controller
public class CardController {
	
	@Autowired
	CardService cardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/card", method = RequestMethod.GET)
	public String card(Locale locale, Model model) {
		logger.info("========== card 영역", locale);
		
		List<UserInfo> userList = cardService.userList();
		
		model.addAttribute("userList", userList);
		
		return "card";
	}
	
	@RequestMapping(value = "/cardwrite", method = RequestMethod.GET)
	public String cardwrite(Locale locale, Model model, HttpServletRequest request) {
		logger.info("========== cardwrite 영역", locale);
		
		String struserIdx = request.getParameter("userIdx");
		int userIdx = 0;
		if(struserIdx == null || struserIdx == "") {
			model.addAttribute("userIdx", userIdx);
		} else if(struserIdx != null || struserIdx != "") {
			userIdx = Integer.parseInt(request.getParameter("userIdx"));
			model.addAttribute("userIdx", userIdx);
		}
		return "cardwrite";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, Model model) {
		logger.info("========== login 영역", locale);
		
		return "login";
	}
	
}
