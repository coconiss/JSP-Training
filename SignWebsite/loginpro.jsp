<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title></head>
<body>
<%
Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;

	try{	
		String driverName = "com.mysql.jdbc.Driver";
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useSSL=false";
		String dbId="jspid";
		String dbPass="jsppass";	
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select id,pw from sitemember";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String did = rs.getString("id");		//db에서 넘어온id와 같은 값을 did에 넣어준다.
			String dpw = rs.getString("pw");		//db에서 넘어온 pw와 같은 값을 pdw에 넣어준다.
			
			if(did.equals(id)){		//입력받은 id와 db아이디가 같은경우
				if(dpw.equals(pw)){			//입력받은 pw와 db의 pw가 같은 경우
					session.setAttribute("userID",id);
					session.setMaxInactiveInterval(300*6);		//세션 만료 시간
					response.sendRedirect("index.jsp");			//로그인에 성공하면 index로 간다. 이때 target이 null이므로 home.jsp를 보여준다
					break;
				}else{	//pw가 다를때 출력
					%>
					<script>
					alert("패스워드가 다릅니다.");
					history.go(-1);
					</script>
				<%}
			}
			else{	//id가 다를때 출력
				%>
				<script>
				alert("아이디가 다릅니다.");
				history.go(-1);
				</script>
				<%
			}
			
		}
		
		
		
		}
	
		catch (Exception e){
	}
	finally{
		conn.close();		//사용후 닫음
		pstmt.close();
		rs.close();
	}

%>
</body>
</html>