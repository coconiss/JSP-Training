<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 보기</title>
<style>
		
      td, th{ border-collapse: collapse; border:1px solid black; }

      th{background-color: #e3e3e3; width:100px;}
      
      td{width:400px;}

    </style>
    
</head>
<body>

  <%

  Class.forName("com.mysql.jdbc.Driver");
  String jdbcUrl = "jdbc:mysql://localhost:3306/jsptest?useSSL=false"; // mysql 데이터베이스명
  String dbId = "jspid";   // mysql id값
  String dbPass = "jsppass";   // mysql pw값
  String userID = (String)session.getAttribute("userID");

    int num = Integer.parseInt(request.getParameter("board_no"));

    try{

      Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

      Statement stmt = conn.createStatement();

      String sql = "select board_no,board_id, board_title, board_content from board2 where board_no="+num;

      ResultSet rs = stmt.executeQuery(sql);

      if(rs.next()){
    	  
    	String board_no = rs.getString(1);
    	  
        String board_id = rs.getString(2);

        String board_title = rs.getString(3);

        String board_content = rs.getString(4);

  %>

  <table class="body">

    <tr>

      <th style="height:40px;">글제목</th>

      <td><%=board_title%></td>

    </tr>
    
    <tr>

      <th style="height:40px;">글번호</th>

      <td><%=board_no%></td>

    </tr>
    
    <tr>

      <th style="height:40px;">작성자 ID</th>

      <td><%=board_id%></td>

    </tr>

    <tr>

      <th style="height:200px;">글내용</th>

      <td><%=board_content%></td>

    </tr>

  </table>
  <br/>
  <a href="TipDelete.jsp?board_no=<%=board_no %>">삭제</a>
  <a href="TipUpdate.jsp?board_no=<%=board_no %>">수정</a>
  <a href="index.jsp?target=Tip">이전 페이지로</a>

  <%
  
  	  rs.close();
      stmt.close();
      conn.close();
      }

    }catch(SQLException e){

      out.println(e.toString());

    }
    
    
   %>

</body>