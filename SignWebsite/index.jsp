<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String targetPage=request.getParameter("target");
if (targetPage == null){
   targetPage = "Home";				//targetPage가 받은 값이 null일때 Home화면을 보여줍니다. 이번 사이트에서는 질문게시판과 방명록을 누르면 null값이 넘어와 메인페이지를 보여준다.
}
targetPage = targetPage + ".jsp";
Date nowTime = new Date();
%>
<html>
<head>
<title></title>
</head>
<body>
<table width="1000" height="500" border="1" cellpadding="5" align="center">
<tr>
	<td colspan="3">
	<jsp:include page = "top.jsp" flush="false"/>
	</td>
</tr>

<tr>
	<td width="20%">
	<jsp:include page = "Lmenu.jsp" flush="false"/>
	</td>
	
	<td width="80%" valign="middle">
	<jsp:include page="<%= targetPage %>" flush="false" />
	</td>

</tr>

</table>
</body>
</html>