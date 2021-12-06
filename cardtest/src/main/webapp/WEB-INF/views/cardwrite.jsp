<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 이력 작성</title>
<link rel="stylesheet" type="text/css" href="./resources/css/cardwrite.css">
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function rewrite() {
	if(confirm("다시 쓰기겠습니까?")) {
		user.reset();
	} return;
}
function kakaopost() {
    new daum.Postcode({
        oncomplete: function(data) {
           document.querySelector("#userZipcode").value = data.zonecode;
           document.querySelector("#userAddress").value =  data.address
        }
    }).open();
}
</script>
<body>
	<section id="cardwirte">
	<h2>개 인 이 력 카 드</h2>
	<div class="inputBox">
		<div class="leftbox">
			<p>
			<c:choose>
				<c:when test="${userIdx == 0 }">새로운 회원</c:when>
				<c:when test="${userIdx != null }">회원 번호 : ${userIdx }</c:when>
			</c:choose>
			※ 새 이력 작성</p>
		</div>
		<div class="rightbox">
			<input type="button" value="뒤로가기" onclick="location='card'">
			<input type="submit" value="불러오기" onclick="">
			<input type="button" value="다시쓰기" onclick="rewrite(); false;">
			<input type="submit" value="저장" onclick="">
		</div>
	</div>
	<form name="user" method="post">
		<table class="userinfo" border="1">
			<tr>
				<th>*성명</th>
				<td>
					<input type="text" name="userName"> 
				</td>
				<th>*주민등록번호</th>
				<td colspan="3">
					<input type="text" name="userSocialSecunum" placeholder='"-" 제외한 숫자만 입력'> 
				</td>
				<th>성별</th>
				<td>
					<select name="userGender">
						<option value="">선택</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>소속회사</th>
				<td colspan="5">
					<input type="text" name="userComp"> 
				</td>
				<th>입사일</th>
				<td>
					<input type="date" name="userCompEnterdate">
				</td>
			</tr>
			<tr>
				<th>부서</th>
				<td><input type="text" name="userDept"></td>
				<th>직위</th>
				<td><input type="text" name="userSpot"></td>
				<th width="100px">병역</th>
				<td><input type="text" name="userArmyServ"></td>
				<th>결혼</th>
				<td>
					<select name="userMaritalStatus">
						<option value="">선택</option>
						<option value="기혼">기혼</option>
						<option value="미혼">미혼</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					<p>병역</p>
					<p>입대일 ~ 제대일</p>
				</th>
				<td colspan="2">
					<input type="date" name="userArmyServEnter" >
				</td>
				<th>~</th>
				<td colspan="2">
					<input type="date" name="userArmyServLeave">
				</td>
				<th>역종/병과</th>
				<td>
					<input type="text" name="userArmyServPeriod">
				</td>
			</tr>
		</table>
		
		<table class="userinfo2" border="1">
			<tr>
				<th>전화</th>
				<td colspan="2">
					<input type="text" placeholder='휴대전화 "-" 포함' name="userTelnumWired">
				</td>
				<td>
					<input type="text" placeholder='유선 "-" 포함' name="userTelnumWireless">
				</td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td colspan="2">
					<input type="text" name="userEmail">
				</td>
				<td>
					<select name="userDomain">
						<option value="">선택해주세요</option>
						<option value="@naver.com">@naver.com</option>
						<option value="@google.com">@google.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" placeholder="우편번호" id="userZipcode" name="userZipcode">
				</td>
				<td>
					<input type="button" value="우편번호 찾기" onclick="kakaopost()">
				</td>
				<td>
					<input type="text" id="userAddress" name="userAddress" placeholder="주소">
				</td>
			</tr>
		</table>
		
		<div class="table3">
			<table class="userschool" border="1">
				<tr>
					<th>학교명</th>
					<th>상태</th>
					<th>날짜</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="edu_school_name">
					</td>
					<td>
						<select name="edu_status">
							<option value="">선택없음</option>
							<option value="입학">입학</option>
							<option value="재학">재학</option>
							<option value="졸업">졸업</option>
							<option value="졸업예정">졸업예정</option>
						</select>
					</td>
					<td>
						<input type="date" name="edu_date">
					</td>
				</tr>
			</table>
			<div class="addBox">
				<input type="button" value="+" class="add">
			</div>
		</div>
		
		<div class="table4">
			<table class="userqualifi" border="1">
				<tr>
					<th>자격증명</th>
					<th>취득일</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="qualifi_name">
					</td>
					<td>
						<input type="date" name="qualifi_getdate">
					</td>
				</tr>
			</table>
			<div class="addBox">
				<input type="button" value="+" class="add">
			</div>
		</div>
		
		<table border="1">
			<tr>
				<th rowspan="2">회사명</th>
				<th colspan="2">재직 기간</th>
				<th rowspan="2">직위</th>
				<th rowspan="2">담당업무</th>
			</tr>
			<tr>
				<th>시작일</th>
				<th>종료일</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="career_comp_name">
				</td>
				<td>
					<input type="date" name="career_enterdate">
				</td>
				<td>
					<input type="date" name="career_leavedate">
				</td>
				<td>
					<input type="text" name="career_spot">
				</td>
				<td>
					<input type="text" name="career_responsib">
				</td>
			</tr>
		</table>
		<div class="addBox">
			<input type="button" value="+" class="add">
		</div>
		
		<div class="table5">
			<table class="usertraining" border="1">
				<tr>
					<th>교육명</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>기관</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="training_name">
					</td>
					<td>
						<input type="date" name="training_startdate">
					</td>
					<td>
						<input type="date" name="training_enddate">
					</td>
					<td>
						<input type="text" name="training_agency">
					</td>
				</tr>
			</table>
			<div class="addBox">
				<input type="button" value="+" class="add">
			</div>
		</div>
		<div class="table6">
			<table class="userlicen" border="1">
				<tr>
					<th>보유기술 및 외국어능력</th>
					<th>숙련도<br/>(A,B,C)</th>
				</tr>
				<tr>
					<td>
						<input type="text" name="licen_name">
					</td>
					<td>
						<input type="text" name="licen_skill_level">
					</td>
				</tr>
			</table>
			<div class="addBox">
				<input type="button" value="+" class="add">
			</div>
		</div>
		
		<table class="userproject" border="1">
			<tr>
				<th rowspan="2">프로젝트명<br/>업무명</th>
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
				<td><input type="text" name="skill_project_name"></td>
				<td><input type="date" name="skill_startdate"></td>
				<td><input type="date" name="skill_enddate"></td>
				<td><input type="text" name="skill_customer_comp"></td>
				<td><input type="text" name="skill_work_comp"></td>
				<td><input type="text" name="skill_applied"></td>
				<td><input type="text" name="skill_industry"></td>
				<td><input type="text" name="skill_role"></td>
				<td><input type="text" name="skill_model"></td>
				<td><input type="text" name="skill_os"></td>
				<td><input type="text" name="skill_lang"></td>
				<td><input type="text" name="skill_dbms"></td>
				<td><input type="text" name="skill_comm"></td>
				<td><input type="text" name="skill_tool"></td>
				<td><input type="text" name="skill_etc"></td>
			</tr>
		</table>
		<div class="addBox">
			<input type="button" value="+" class="add">
		</div>
	</form>
	</section>
</body>
</html>