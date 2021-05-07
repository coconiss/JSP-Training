<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% 
	

    try{
    	String id = (String)session.getAttribute("userID");
    	int num = Integer.parseInt(request.getParameter("board_no"));
        Connection conn=null;
     	PreparedStatement stmt = null;
     	ResultSet rs = null;
     	String sql = null;
     	String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useSSL=false";
    	String dbId="jspid";
		String dbPass="jsppass";
		
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		sql = "SELECT * FROM board2";
		stmt = conn.prepareStatement(sql);
     	rs = stmt.executeQuery();
     	
     	while(rs.next()){
     		int dNo = rs.getInt("board_no");	//받아온 no로 검색한 값 dNo에 저장
			String dId = rs.getString("board_id");	//받아온 id로 검색한 값을 dId에 저장
			
			if(dId.equals(id)){
				if(dNo == num){		//넘어온 num(board_no)와 db의 bord_no가 같은지 비교한다.
					sql = "DELETE FROM board2 WHERE board_no=?";
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, num);
					stmt.executeUpdate();					
					response.sendRedirect("index.jsp?target=Tip");
					break;
				}
			}
			else{
				%>
				<script>
				alert("본인글만 삭제할 수 있습니다.");	<!-- id를 비교해 다를경우 삭제를 못하고 창을 띄워준다. -->
				history.go(-1);		<!-- 이전 페이지로 돌아간다. -->
				</script>
				<%
			}

					
			}
      
    }catch(SQLException e){

        out.println(e.toString());

      }
    	%>
</body>