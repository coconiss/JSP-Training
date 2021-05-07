<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <title>게시글 작성</title>

    <meta charset="UTF-8">

    <script> // 자바 스크립트 시작

      function Insert(){
        var insertFrm = document.insertFrm;

        if( !insertFrm.board_title.value ){
          alert( "글제목을 적어주세요" );
          insertFrm.board_title.focus();
          return;
         }

        if( !insertFrm.board_content.value ){
          alert( "글내용을 적어주세요" );
          insertFrm.board_content.focus();
          return;
         }

        insertFrm.submit();
        }

   </script>

    <style>

      .body{
        width:700px;
        margin:50px;
        text-align: center;
      }

      .body, .body td, .body th{ border-collapse: collapse; border:1px solid black; box-sizing: border-box;}

      .body th{width:242px; padding:10px 0;}

      .body td{
      padding:10px 0;
      }
      #board_title{
      width:430px; 
      height:30px;
      }
      #board_content{
      width:430px; 
      height:300px;
      }
      .Btn{
      margin:30px auto 0;
       width:100px;
       }
    </style>

</head>

<body>
	<%
	String userId = (String)session.getAttribute("userID");
	if(userId==null){
	%><script>
		alert("회원만 게시글을 작성할 수 있습니다.");
		location.href="index.jsp?target=login";
	</script>
	<%
	}else{
	%>

  <form name="insertFrm" id="insertFrm" action="TipInsert.jsp">

    <table class="body">

      <tr>

        <th>글제목</th>

        <td><input type="text" id="board_title" name="board_title"></td>

      </tr>

      <tr>

        <th>글내용</th>

        <td><textarea id="board_content" name="board_content"></textarea></td>

      </tr>

    </table>

  </form>

    <input type="button" value="등록" OnClick="javascript:Insert();">
    <input type="button" onClick="history.go(-1)" value="취소">
    <%} %>



</body>

</html>