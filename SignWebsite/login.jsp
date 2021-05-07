<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>로그인</title></head>
<%
	boolean isIDShow = false;
	String id = null;
	Cookie[] cookies = request.getCookies();	//요청전송된 모든 쿠기값을 얻어옴
	if(cookies != null && cookies.length > 0){	//쿠키값이 비어있지 않고 크기가 0보다 클경우(실행)
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){	//쿠기i번지 값의 이름이 id값(입력한 id값)과 같다면
				isIDShow = true;
				id = cookies[i].getValue();		//cookies[i]값의 value를 id에 넣어줌
			}
		}
	}
%>
<body>
	아이디와 비밀번호를 입력해주세요.<br/><br/>
	<form action="loginpro.jsp" method="post">	<!-- 확인 버튼을 누르면 검사를 위한 페이지로 이동(비밀번호가 보내지므로 get이 아닌 post로 보낸다) -->
	<table>
<%
if (isIDShow) {
%>
<tr>
<td>ID : </td>
<td><input type="text" name="id" value="<%= id %>"></td>
<td><input type="checkbox" name="idstore" value="store" checked>아이디 기억하기</td>
</tr>
<%
} else {
%>
<tr>
<td>ID : </td>
<td><input type="text" name="id"></td>
<td><input type="checkbox" name="idstore" value="store">아이디 기억하기</td>
</tr>
<%
}
%>
<tr>
<td>Password : </td>
<td><input type="password" name="pw"></td>
<td><input type="submit" value="전송"> <input type="button" onClick="history.go(-1)" value="취소"></td>
</tr>
</table>
</form>
</body>
</html>
