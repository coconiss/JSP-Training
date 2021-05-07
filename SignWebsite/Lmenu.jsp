<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;
charset=UTF-8" pageEncoding="UTF-8"%>

<%
String userID = (String)session.getAttribute("userID");
String ip = request.getRemoteAddr();
if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")){		//ip를 가져와 출력했을 때 이러한 값이 나오면 출력을 바꿔준다..(인터넷 참고)
	InetAddress inet=InetAddress.getLocalHost();
	ip=inet.getHostAddress();
}
boolean isLogin = false;
if(userID != null){	//로그인중인지 확인
isLogin = true;
}

SimpleDateFormat date = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
Calendar time = Calendar.getInstance();
String format = date.format(time.getTime());
%>
<html>
<head><title></title></head>
<body>
접속 IP : <%= ip %><br/><br/><br/><br/>
현재 시간 : <%= format %> 입니다.<br/><br/><br/><br/>
<%

if(userID != null){		//로그인을 했을 경우에만 아래 메뉴들을 보여준다.(비 로그인시 필요하지 않은 메뉴들을 숨김)
%>
"<%= userID %>"님 반갑습니다.<br/><br/>
<a href="index.jsp?target=update">회원정보 수정</a><br/>
<a href="index.jsp?target=logout">로그아웃</a><br/>
<a href="index.jsp?target=MemberDelete">회원탈퇴</a><br/>
<%
	}
%>
	<a href="index.jsp?target=Member">회원가입</a><br/>
	<% 
	if(userID == null){
	%>
	<a href="index.jsp?target=login">로그인</a><br/>
	<%} %>
</body>
</body>
</html>