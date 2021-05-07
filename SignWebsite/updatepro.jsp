<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title></head>
<body>
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String sql ="";
	try{	
		String driverName = "com.mysql.jdbc.Driver";
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useSSL=false";
		String dbId="jspid";
		String dbPass="jsppass";	
		
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		sql = "select pw from sitemember where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			rs.getString(1);
			String dpw = rs.getString("pw");
			if(pw.equals(dpw)){
				sql = "update sitemember where id=? and pw=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				pstmt.executeUpdate();
				%>
				<script>
				alert("수정 성공!");
				</script>
				<%
				session.invalidate();
				response.sendRedirect("index.jsp");
			}else{
			%>
				<script>
				alert("패스워드가 다릅니다.");
				history.go(-1);
				</script>
				<%
			}
		}else{%>
			<script>
			alert("존재하지 않는 ID입니다.");
			history.go(-1);
			</script>
			<%
			rs.close();
			pstmt.close();
			conn.close();
		}
	}
	catch (Exception e){
		e.printStackTrace();
	}

%>
</body>
</html>