<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
		
      td, th{ border-collapse: collapse; border:1px solid black; }

      th{background-color: #e3e3e3; width:100px;}
      
      td{width:400px;}
      
      #board_title{
      width:430px; 
      height:30px;
      }
      #board_content{
      width:430px; 
      height:300px;
      }

</style>
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
				if(dNo == num){	
					String board_no = rs.getString(1);
			    	  
			          String board_id = rs.getString(2);

			          String board_title = rs.getString(3);

			          String board_content = rs.getString(4);

			  %>

			  

			  <form action="TipUpdatePro.jsp" method="post">

				<table class="body">
			    <tr>

			      <th style="height:40px;">글제목</th>

			      <td><input type="text" name="board_title" id="board_title" value="<%=board_title%>"></td>

			    </tr>
			    
			    <tr>

			      <th style="height:40px;">글번호</th>

			      <td><%=board_no%></td>

			    </tr>
			    
			     <tr>

			      <th style="height:40px;">작성자 ID</th>

			      <td><%=board_id %></td>

			    </tr>

			    <tr>

			      <th style="height:200px;">글내용</th>

			      <td><textarea name="board_content" id="board_content"><%=board_content%></textarea></td>

			    </tr>
			  </table>
			  <input type="hidden" id=board_no" name="board_no" value="<%=num %>">
			  <input type="submit" value="완료">
			  </form>			  

			  <%
			 	rs.close();
		     	stmt.close();
		     	conn.close();
				}
			}
			else{
				%>
				<script>
				alert("본인글만 수정할 수 있습니다.");
				history.go(-1);
				</script>
				<%
			}
			}
      
    }catch(SQLException e){
      }
    	%>
</body>