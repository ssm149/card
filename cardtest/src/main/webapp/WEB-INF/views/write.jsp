<%@page import="com.spring.card.vo.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./resources/css/Min.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakao() {
	new daum.Postcode({
		oncomplete: function(data) { //선택시 입력값 세팅
			document.getElementById("userZipcode").value = data.zonecode; // 주소 넣기
	        document.getElementById("userAddress").value = data.address; // 주소 넣기
	       	}
	}).open();
}

	function Save() {
		//location = "/card/home?userIdx="+ idx;
		if(confirm("저장하시겠습니까?")== true){
		alert("---------save---------");
		var userName = document.getElementById("userName");
		
		document.getElementById('frm').submit();
		} else {
			return false;
		}
	}
	
	function Delete(idxx) {
		if (confirm("정말 삭제하시겠습니까?" + idxx) == true) {
		
		document.getElementById('userIdx').value = idxx;
		
		document.getElementById('frmm').submit();
		
		} else {   //취소

		     return false;

		 }
	}
	
</script>
<meta charset="UTF-8">

</head>
<body>
<form action="/card/delete" id="frmm" method="post">
<input type="hidden" id="userIdx" name="userIdx" value="${userIdx}">
</form>
	<h2 align= "center">개인 이력카드</h2>
	
		<!-- <input type="submit" value="저장"> -->
					 <button onclick="Save()" id= "save">
						저장
					</button> 
		<input type="button" value="돌아가기" onclick="javascript:location='/card/'">
					<!-- <button onclick="javascript:location='\' " >
						돌아가기
					</button> -->
					
		<%-- <input type="button" value="삭제" oncliclk="Delete(${userIdx})">	 --%>	
					<button onclick="Delete(${userInfo.userIdx})">
						삭제
					</button>
	
	
	<form action="/card/writeInsert" id="frm" method="post">
				
		<div class = "table1">
				
			<table border=1 class="#">

				<tbody>
					<tr>
						<th>*성명</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><input type="text" name="userName" id="userName"></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><input type="text" name="userName" id="userName" value="${userInfo.userName }"></td>
							</c:when>
						</c:choose>
						<!-- <td><input type="text" name="userName" id="userName"></td> -->
						<th colspan="2">*주민등록번호</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td colspan="2"><input type="password" name="userSocialSecunum" id="userSocialSecunum" maxlength="13" placeholder='  "-" 제외한 숫자만 입력'></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td colspan="2"><input type="password" name="userSocialSecunum" id="userSocialSecunum" maxlength="13" placeholder='  "-" 제외한 숫자만 입력' value="${userInfo.userSocialSecunum }"></td>
							</c:when>
						</c:choose>
						<!-- <td colspan="2"><input type="password" name="userSocialSecunum" id="userSocialSecunum" maxlength="13" placeholder='  "-" 제외한 숫자만 입력'></td> -->
						<th>성별</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><select id="userSex">
								<option value="">선택없음</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
						</select></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><select id="userSex" value="${userInfo.userSex }">
								<option value="">선택없음</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
						</select></td>
							</c:when>
						</c:choose>
						<!-- <td><select id="userSex">
								<option value="">선택없음</option>
								<option value="남성">남성</option>
								<option value="여성">여성</option>
						</select></td> -->
					</tr>
		
					<tr>
						<th>소속회사</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td colspan="5"><input type="text" name="userComp" id="userComp"></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td colspan="5"><input type="text" name="userComp" id="userComp" value="${userInfo.userComp }"></td>
							</c:when>
						</c:choose>
						<!-- <td colspan="5"><input type="text" name="userComp" id="userComp"></td> -->
						<th>입사일</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><input type="date" name="userCompEnterdate" id="userCompEnterdate"></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><input type="date" name="userCompEnterdate" id="userCompEnterdate" value="${userInfo.userCompEnterdate }"></td>
							</c:when>
						</c:choose>
						<!-- <td><input type="date" name="userCompEnterdate" id="userCompEnterdate"></td> -->
					</tr>
		
					<tr>
						<th>부서</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><input type="text" name="userDept" id="userDept"></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><input type="text" name="userDept" id="userDept" value="${userInfo.userDept }"></td>
							</c:when>
						</c:choose>
						<!-- <td><input type="text" name="userDept" id="userDept"></td> -->
						<th>직위</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><input type="text" name="userSpot" id="userSpot"></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><input type="text" name="userSpot" id="userSpot" value="${userInfo.userSpot }"></td>
							</c:when>
						</c:choose>
						<!-- <td><input type="text" name="userSpot" id="userSpot"></td> -->
						<th>병역</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><input type="text" name="userArmyServ" id="userArmyServ"></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><input type="text" name="userArmyServ" id="userArmyServ" value="${userInfo.userArmyServ }"></td>
							</c:when>
						</c:choose>
						<!-- <td><input type="text" name="userArmyServ" id="userArmyServ"></td> -->
						<th>결혼</th>
						<c:choose>
							<c:when test="${userInfo == null }">
								<td><select name="userMaritalStatus" id="userMaritalStatus">
								<option value="">선택없음</option>
								<option value="기혼">기혼</option>
								<option value="미혼">미혼</option>
						</select></td>
							</c:when>
							<c:when test="${userInfo != null }">
								<td><select name="userMaritalStatus" id="userMaritalStatus" value="${userInfo.userMaritalStatus }">
								<option value="">선택없음</option>
								<option value="기혼">기혼</option>
								<option value="미혼">미혼</option>
						</select></td>
							</c:when>
						</c:choose>
						<!-- <td><select name="userMaritalStatus" id="userMaritalStatus">
								<option value="">선택없음</option>
								<option value="기혼">기혼</option>
								<option value="미혼">미혼</option>
						</select></td> -->
					</tr>
		
					<tr>
						<th><p>병역</p>
							<p>입대 ~ 제대일</p></th>
								<c:choose>
									<c:when test="${userInfo == null }">
										<td colspan="2"><input type="date" name="userArmyServEnter" id="userArmyServEnter"></td>
									</c:when>
									<c:when test="${userInfo != null }">
										<td colspan="2"><input type="date" name="userArmyServEnter" id="userArmyServEnter" value="${userInfo.userArmyServEnter }"></td>
									</c:when>
								</c:choose>
						<!-- <td colspan="2"><input type="date" name="userArmyServEnter" id="userArmyServEnter"></td> -->
						<th>~</th>
						<c:choose>
									<c:when test="${userInfo == null }">
										<td><input type="date" name="userArmyServLeave" id="userArmyServLeave"></td>
									</c:when>
									<c:when test="${userInfo != null }">
										<td><input type="date" name="userArmyServLeave" id="userArmyServLeave" value="${userInfo.userArmyServLeave }"></td>
									</c:when>
								</c:choose>
						<!-- <td><input type="date" name="userArmyServLeave" id="userArmyServLeave"></td> -->
						<th>역종/병과</th>
								<c:choose>
									<c:when test="${userInfo == null }">
										<td colspan="2"><input type="date" name="userArmyServPeriod" id="userArmyServPeriod"></td>
									</c:when>
									<c:when test="${userInfo != null }">
										<td colspan="2"><input type="date" name="userArmyServPeriod" id="userArmyServPeriod" value="${userInfo.userArmyServPeriod }"></td>
									</c:when>
								</c:choose>
						<!-- <td colspan="2"><input type="text" name="userArmyServPeriod" id="userArmyServPeriod"></td> -->
						
						<td><input type="file" name="" id="file"></td>
					</tr>
		
				</tbody>
			</table>
	
		</div>
	
		<div class = "table2">
	
				<table border=1 class="#">
		
				<tbody>
					<tr>
						<th>전화</th>
							<c:choose>
								<c:when test="${userInfo == null }">
									<td colspan="2"><input type="text" name="userTelnumWired" id="userTelnumWired" maxlength="13" placeholder='  휴대전화 "-" 포함'></td>
								</c:when>
								<c:when test="${userInfo != null }">
									<td colspan="2"><input type="text" name="userTelnumWired" id="userTelnumWired" maxlength="13" placeholder='  휴대전화 "-" 포함' value="${userInfo.userTelnumWired }"></td>
								</c:when>
							</c:choose>
						<!-- <td colspan="2"><input type="text" name="userTelnumWired" id="userTelnumWired" maxlength="13" placeholder='  휴대전화 "-" 포함'></td> -->
		
							<c:choose>
								<c:when test="${userInfo == null }">
									<td colspan="2"><input type="text" name="userTelnumWireless" id="userTelnumWireless" maxlength="13" placeholder='  유선 "-" 포함'></td>
								</c:when>
								<c:when test="${userInfo != null }">
									<td colspan="2"><input type="text" name="userTelnumWireless" id="userTelnumWireless" maxlength="13" placeholder='  유선 "-" 포함' value="${userInfo.userTelnumWireless }"></td>
								</c:when>
							</c:choose>
						<!-- <td colspan="2"><input type="text" name="userTelnumWireless" id="userTelnumWireless" maxlength="13" placeholder='  유선 "-" 포함'></td> -->
					</tr>
					<tr>
						<th>이메일</th>
							<c:choose>
								<c:when test="${userInfo == null }">
									<td colspan="2"><input type="text" name="userEmail" id="userEmail" placeholder="이메일 아이디 입력"></td>
								</c:when>
								<c:when test="${userInfo != null }">
									<td colspan="2"><input type="text" name="userEmail" id="userEmail" value="${userInfo.userEmail }" placeholder="이메일 아이디 입력"></td>
								</c:when>
							</c:choose>
						<!-- <td colspan="2"><input type="text" name="userEmail" id="userEmail" placeholder="이메일 아이디 입력"></td> -->
		
							<%-- <c:choose>
								<c:when test="${userInfo == null }">
									<td colspan="2"><select name="userDomain" id="userDomain">
										<option value="">선택없음</option>
										<option value="@naver.com">@naver.com</option>
										<option value="@hanmail.net">@hanmail.net</option>
									</select></td>
								</c:when>
								<c:when test="${userInfo != null }">
									<td colspan="2"><select name="userDomain" id="userDomain" value="${userInfo.userDomain }">
										<option value="">선택없음</option>
										<option value="@naver.com">@naver.com</option>
										<option value="@hanmail.net">@hanmail.net</option>
									</select></td>
								</c:when>
							</c:choose> --%>
						<td colspan="2"><select name="userDomain" id="userDomain">
								<option value="">선택없음</option>
								<option value="@naver.com">@naver.com</option>
								<option value="@hanmail.net">@hanmail.net</option>
						</select></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div>
							<c:choose>
								<c:when test="${userInfo == null }">
									<input type="text" name="userZipcode" id="userZipcode" placeholder="우편번호"> 
								</c:when>
								<c:when test="${userInfo != null }">
									<input type="text" name="userZipcode" id="userZipcode" value="${userInfo.userZipcode }" placeholder="우편번호"> 
								</c:when>
							</c:choose>
								<!-- <input type="text" name="userZipcode" id="userZipcode" placeholder="우편번호">  -->
								<input type="button" value="우편번호 찾기" onclick="kakao();"/>
							</div>
						</td>
						<c:choose>
								<c:when test="${userInfo == null }">
									<td colspan="2"><input type="text" name="userAddress" id="userAddress" maxlength="13" placeholder='  주소'></td>
								</c:when>
								<c:when test="${userInfo != null }">
									<td colspan="2"><input type="text" name="userAddress" id="userAddress" value="${userInfo.userAddress }" maxlength="13" placeholder='  주소'></td>
								</c:when>
							</c:choose>
						<!-- <td colspan="2"><input type="text" name="userAddress" id="userAddress" maxlength="13" placeholder='  주소'></td> -->
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	
	<!-- <div class = "table3">
	
	<table style="float: left;" border=1 >

		<tbody>

			<tr>
				<th>학교</th>
				<th>상태</th>
				<th>날짜</th>
			</tr>
			<tr>
				<td><input type="text" id=""></td>
				<td><select id="#">
						<option value="">선택없음</option>
						<option value="졸업">졸업</option>
						<option value="재학중">재학중</option>
				</select></td>
				<td><input type="date" id=""></td>
			</tr>

		</tbody>
	</table>
	<table style="float: right;"  border=1>
		<tbody>
			<tr>
				<th>자격증</th>
				<th>취득일</th>
			</tr>
			<tr>
				<td><input type="text" id=""></td>
				<td><input type="date" id=""></td>
			</tr>



		</tbody>
	</table>
</div>

<div class = "table4">

	<table border=1 class="#">
		<tbody>
			<tr>
				<th rowspan="2">회사명</th>
				<th colspan="2">재직기간</th>
				<th rowspan="2">직위</th>
				<th rowspan="2">담당업무</th>
			</tr>

			<tr>
				<th>시작일</th>
				<th>종료일</th>
			</tr>
			<tr>
				<td><input type="text" id=""></td>
				<td><input type="date" id=""></td>
				<td><input type="date" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
			</tr>
		</tbody>
	</table>


</div>

<div class = "table5">
	<table style="float: left;" border=1 >

		<tbody>

			<tr>
				<th>교육</th>
				<th>시작</th>
				<th>종료</th>
				<th>기관</th>
			</tr>
			<tr>
				<td><input type="text" id=""></td>
				<td><input type="date" id=""></td>
				<td><input type="date" id=""></td>
				<td><input type="text" id=""></td>
			</tr>

		</tbody>
	</table>
	
	<table style="float: right;"  border=1>
		<tbody>
			<tr>
				<th>보유기술 및 외국어능력</th>
				<th>숙련도 </br>
				(A,B,C)</th>
			</tr>
			<tr>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
			</tr>

		</tbody>
	</table>
</div>


<div class = "table6">
	<table border=1 class="#">
		<tbody>
			<tr>
				<th rowspan="2">프로젝트명 <p> 업무명</th>
				<th colspan="2">참여기간</th>
				<th rowspan="2">고객사</th>
				<th rowspan="2">근무회사</th>
				<th colspan="2">개발분야</th>	
				<th rowspan="2">역할</th>
				<th colspan="7">개발환경</th>	
			</tr>

			<tr>
			<th>시작일</th>
			<th>종료일</th>
			<th>산업</th>
			<th>응용</th>
			<th>기종</th>
			<th>O.S</th>
			<th>언어</th>
			<th>DBMS</th>
			<th>TOOL</th>
			<th>통신</th>
			<th>기타</th>
			</tr>
			<tr>
				<td><input type="text" id=""></td>
				<td><input type="date" id=""></td>
				<td><input type="date" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
				<td><input type="text" id=""></td>
			</tr>
		</tbody>
	</table>
</div> -->



</body>
</html>