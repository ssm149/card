<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
table th {
font-weight: normal;
}
</style>
</head>
<script type="text/javascript">
function View(idx) {
	//location = "/card/home?userIdx="+ idx;

	document.getElementById('userIdx').value = idx;
	
	document.getElementById('frm').submit();
	
}
</script>
<body>
	<table  align="center">
<form action="/card/write" id="frm" method="post">
<input type="hidden" id="userIdx" name="userIdx" value="">
</form>
	<tr>
	<td align="left">
			<input type="button" value="로그인" onClick="location.href='#'">
			<input type="button" value="회원가입" onClick="location.href='#'">
		</td>
		<td align="right">
			total : ${MinListCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="ListTable" border = "1">
				<tr>
					<td width="80" align="center">
						번호
					</td>
					<td width="40" align="center">
						이름
					</td>
					<td width="300" align="center">
						이메일
					</td>
					<td width="150" align="center">
						가입일자
					</td>
				</tr>
				<c:choose>
					<c:when test="${MinList != null }">
						<c:forEach items="${MinList}" var="Minlist">
							<tr>
								<th>
									${Minlist.userIdx}
								</th>
								<th><a href="#" onClick="View(${Minlist.userIdx})">
									${Minlist.userName}
								</th>
								<th>
									${Minlist.userEmail}
								</th>
								<th>
									${Minlist.userRegisterDate}
								</th>
							</tr>	
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</td>
	</tr>
	<tr>
		</td><td align="right">
			<input type="button" value="글쓰기" onClick="location.href='/card/write'">

		</td>
		
	</tr>
	
	
	
	
</form>

</th>
	</table>
</body>
</html>