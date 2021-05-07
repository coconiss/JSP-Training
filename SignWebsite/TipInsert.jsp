<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>

<html>

<head>

    <title>게시판 테스트2</title>

    <meta charset="UTF-8">

    <meta name="description" content="">

    <meta name="keywords" content="">

</head>

<body>

  <%

    request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리

     Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
     String jdbcUrl = "jdbc:mysql://localhost:3306/jsptest?useSSL=false"; // mysql 데이터베이스명
     String dbId = "jspid";   // mysql id값
     String dbPass = "jsppass";   // mysql pw값

     String board_id = (String)session.getAttribute("userID");		//로그인중인 id 값 저장
     
     String board_title = request.getParameter("board_title");    // 넘어온 글제목 값 저장

     String board_content = request.getParameter("board_content"); // 넘어온 글내용 값 저장



     try{

       Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);    // 실제 DB 연동시도
       String sql = "insert into board2(board_id, board_title, board_content) values(?,?,?)"; // insert 쿼리문
       PreparedStatement pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, board_id);
       pstmt.setString(2, board_title);
       pstmt.setString(3, board_content);
       pstmt.execute();
       pstmt.close();
       response.sendRedirect("index.jsp?target=Tip");
     }catch(SQLException e){
       out.println(e.toString());
     }
  %>

 

</body>

</html>