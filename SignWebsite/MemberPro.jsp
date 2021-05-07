<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title></head>
<body>
<%
//넘어온 값들을 getParameter값으로 각 변수들에 값 저장
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String nickname = request.getParameter("nickname");
String phone = request.getParameter("ph1") + "-" + request.getParameter("ph2") + "-" + request.getParameter("ph3");
String license = request.getParameter("M_Status");
String country = request.getParameter("country");

String prnM=null;

Connection conn=null;
PreparedStatement pstmt = null;
String str = "";
try{
	String driverName = "com.mysql.jdbc.Driver";
	String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useSSL=false";
	String dbId="jspid";
	String dbPass="jsppass";
	
	Class.forName(driverName);
	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "insert into sitemember values(?,?,?,?,?,?,? )";	//들어갈 값들을 ?로 만들어 1,2,3..으로 값을 지정하여 넣어준다.
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, nickname);
	pstmt.setString(5, phone);
	pstmt.setString(6, license);
	pstmt.setString(7, country);
	pstmt.executeUpdate();
	response.sendRedirect("index.jsp");		//값을 넣은 후 index로 이동 단 target이 null이므로 home을 보여줌(이후 같은방법은 설명하지 않겠습니다.)
	out.println(prnM);
	
}catch(Exception e){
	   e.printStackTrace();
	   prnM="sitemember 테이블에 레코드 추가에 실패하였습니다.";
	   out.println(prnM);
}finally{
	
}
%>
</body>
</html>