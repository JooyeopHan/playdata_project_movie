<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "model.vo.MovieVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>NaverAPI ���</title>
</head>
<body>

<%
/* 	Object naverUrl = request.getAttribute("naverUrl");    */
	Object boxOffUrl = request.getAttribute("boxOffUrl"); 
%>

<c:choose>
  <c:when test="${!empty movie}">
	<%
		MovieVO movie1 = (MovieVO)session.getAttribute("movie");
	%>
	
     <h1>Hello</h1>
<%--      <p><%=naverUrl %></p><br> --%>
     <p><%=boxOffUrl %></p>
     
     <p>��ȭ �̸� : <%= movie1.getMovieNM()%></p>
     <p>��ȭ ���� ��ü : <%= movie1%></p>
   </c:when>
</c:choose>
</body>
</html>