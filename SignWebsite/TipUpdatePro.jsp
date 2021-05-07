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
    	String board_no = request.getParameter("board_no");
    	String board_title = request.getParameter("board_title");
    	String board_content = request.getParameter("board_content");
        Connection conn=null;
     	PreparedStatement pstmt = null;
     	ResultSet rs = null;
     	String sql = null;
     	String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useSSL=false";
    	String dbId="jspid";
		String dbPass="jsppass";
		
		String driverName = "com.mysql.jdbc.Driver";
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
      	sql = "update board2 set board_title=?, board_content=? where board_no=?";
     	pstmt = conn.prepareStatement(sql);

     	pstmt.setString(1, board_title);

      	pstmt.setString(2, board_content);

     	pstmt.setString(3, board_no);

      pstmt.execute();

  %>



  <!--수정 완료 창 띄운 후에 수정된 게시글 상세보기로 이동 -->

  <script>

    alert("수정완료 되었습니다");
    window.location.href = "TipDetail.jsp?board_no="+<%=board_no%>;
  </script>

  <%

      pstmt.close();

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>

</body>
</html>