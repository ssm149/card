package com.spring.card;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.card.service.CardService;
import com.spring.card.service.UserInfoService;
import com.spring.card.vo.UserInfo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	UserInfoService userInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String min(HttpServletRequest request, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		
		List<UserInfo> List = new ArrayList<UserInfo>();
		List<UserInfo> MinList = userInfoService.MinList();
	    logger.info("----------------------리스트-------------------------" + MinList);
	   
	    int MinListCnt = 0;
	    /*
	     * !MinList.isEmpty() == MinList != null
	     *  MinList.isEmpty() == MinList == null
	     */
	    if(!MinList.isEmpty()) {
		    for(int i =0; i<MinList.size(); i++) {
		    	++MinListCnt;
		    }
	    }	
	   
	    model.addAttribute("MinListCnt", MinListCnt);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("List", List);
		
		model.addAttribute("MinList", MinList);
		
		return "list";
	}
	
	  //글쓰기 화면
	  @RequestMapping(value = "/write", method = RequestMethod.GET) 
	  public String write(Locale locale, Model model) {
	  logger.info("글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기글쓰기.", locale);
	  
	  Date date = new Date();
	  DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	  
	  String formattedDate = dateFormat.format(date);
	  System.out.println("글쓰기 페이지 이동");
	  
	  model.addAttribute("serverTime", formattedDate);
	  
	  return "/write"; 
	  }
	 
	
	//글 저장
	@RequestMapping(value = "/writeInsert", method = RequestMethod.POST)
	public String writeAction(Locale locale, Model model, UserInfo userInfo,HttpServletRequest request) {
		logger.info("글쓰기액션글쓰기액션글쓰기액션글쓰기액션글쓰기액션글쓰기액션.", locale);
		
		//insert 
		String userEmail = request.getParameter("userEmail");
		String userDomain = request.getParameter("userDomain");
		userEmail = userEmail + userDomain;
		
		userInfo.setUserEmail(userEmail);
		
		 userInfoService.List(userInfo);
		 
			/*
			 * int insertCnt = userInfoService.MinInsert(userInfo);
			 * 
			 * if(insertCnt > 0) { System.out.println("정상값 입력 완료"); } else {
			 * System.err.println("정삽값 입력 실패"); }
			 */
		
		//model.addAttribute("MinInsert", insert);
		//model.addAttribute("serverTime", formattedDate);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String ListAction(Locale locale, Model model, HttpServletRequest request) {
		logger.info("작성 데이터 보여주기", locale);
		
		String userIdx = request.getParameter("userIdx");
		
		int IntUserIdx = 0;
		if(userIdx != "" && userIdx != null) {
			IntUserIdx = Integer.parseInt(userIdx);
		}
		
		System.out.println("회원 번호 : " + IntUserIdx);
		
		UserInfo userInfo = userInfoService.viewList(IntUserIdx);
		
		System.err.println("회원 이름 : "+userInfo.getUserName());
		

		model.addAttribute("userInfo", userInfo);
		
		return "write";
	}
	
	//삭제
	  @RequestMapping(value = "/delete", method = RequestMethod.POST) 
	  public String minDelete(Locale locale, Model model, @RequestParam (value = "userIdx", required = false) int userIdx) {
	  logger.info("삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제삭제.", locale);
	  
		/*
		 * try { int delete = userInfoService.delete(userIdx); } catch (Exception e) {
		 * // TODO Auto-generated catch block e.printStackTrace(); }
		 */
  
	 // userInfoService.delete(userIdx);
	  
	  List<UserInfo> delete = new ArrayList<UserInfo>();
	  
	  System.out.println(userIdx);
	  
	  int deleteCnt = userInfoService.delete(userIdx);

	  return "redirect:/"; //새요청   Dispatch 
	  
	  }
	
}
