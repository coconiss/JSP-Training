<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
<head>
    <title>게시판 테스트</title>
    <meta charset="UTF-8">

    <style>
      .body{
        width:700px;
        margin:50px auto 0;
        text-align: center;
      }



      .body, .body td, .body th{ 
      border-collapse: collapse; 
      border:1px solid black; 
      box-sizing: border-box;
      }

      .body th{
      background-color: #e3e3e3;
      }

    </style>

</head>

<body>

  <%
    Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
    String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useSSL=false"; // mysql 데이터베이스명
    String dbId="jspid";
	String dbPass="jsppass";	
    int total = 0;		//페이징 구현을 위한 변수(페이징 구현에 실패하였습니다..)

    try{

      Connection conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);    // 실제 DB 연동시도
      Statement stmt = conn.createStatement();
      String totalSql = "select count(*) from board2;";  // 총 글갯수를 찾는 sql문
      ResultSet rs = stmt.executeQuery(totalSql);

      if(rs.next()){            // 결과가 있다면 true값을 반환합니다
        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입
      }

      String listSql = "select board_no, board_id, board_title, board_date from board2;"; // 전체 리스트를 가져오는 sql문
      rs = stmt.executeQuery(listSql);

      // try catch에서 오류가없을시에 출력되는 내용입니다
  %>

  <table class="body">

    <tr>
      <th>글번호</th>      
      <th style="height:40px;">작성자 ID</th>
      <th>글제목</th>
      <th>작성일자</th>
    <tr>

  <%
    if(total==0){	//DB에 게시글이 없다면 게시글이 존재하지 않다고 뜬다.
  %>
    <tr>
      <td colspan="4">게시글이 존재하지 않습니다</td>	
    </tr>
  <%

    } else{

      while(rs.next()){ //rs값이 있을때까지 반복합니다.
        int board_no = rs.getInt(1);          	 // sql문의 첫번째 컬럼내용을 담습니다.       
        String board_id = rs.getString(2);		// sql문의 두번째 컬럼내용을 담습니다.
        String board_title = rs.getString(3);   // sql문의 세번째 컬럼내용을 담습니다.
        String board_date = rs.getString(4); 	// sql문의 네번째 컬럼내용을 담습니다.

  	// 실제 리스트가 출력되는 부분 입니다.
	// board2에서 가져온 no, id, title, date가 테이블에 출력되는 부분입니다.
  %>
    <tr>

      <td><%=board_no%></td>	
      <td><%=board_id %></td>
      <td> <a href="TipDetail.jsp?board_no=<%=board_no %>"> <%=board_title%></a></td>
      <td><%=board_date%></td>

    </tr>

  <%
      }
    }
    rs.close();	//사용했던것들을 닫아줍니다.
    conn.close();
    stmt.close();

  }catch(SQLException e){
    out.println(e.toString());
  }
    
  %>	
   
  </table>
  <button onclick="location='index.jsp?target=TipWriter'">글쓰기</button>	<!-- target은 index.jsp에서 지정해놨고 TipWriter.jsp로 이동하라는 버튼입니다. -->
</body>

</html> 