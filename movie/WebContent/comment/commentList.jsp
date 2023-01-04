<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,model.vo.CommentVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP가응답하는코멘트리스트</title> 
<style>
table {
    border-collapse: collapse;
}
table, th, td {
    border: 1px solid #007A00;
  padding: 3px;
 }
th {	
	background-color: #00CC00;
}
td {	
	background-color: #75FF47;	
} 
</style>
</head>
<body>
<%
	ArrayList<CommentVO> list = (ArrayList<CommentVO>)request.getAttribute("commentlist");    
   if(list.size() != 0) {
%>
      <h1>Comment 테이블의 내용</h1><hr>
	  <table>
	  <tr><th>작성자</th><th>내용</th></tr>
<%
	for(CommentVO vo : list) {
%>
		<tr><td><%= vo.getNickname() %></td><td><%= vo.getContent() %></td></tr>
<%
	   }
%>
      </table>
 <%
	} else {
 %>
	   <h1>Comment 테이블에 데이터가 없습니다.</h1>
  <%
	}
  %>
<br><a href="${ header.referer }">후기 홈 화면으로</a>
</body>
</html>







