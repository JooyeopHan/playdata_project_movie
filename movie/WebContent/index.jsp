<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, model.vo.MovieVO" %>
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
		ArrayList<MovieVO> movielist = (ArrayList<MovieVO>)session.getAttribute("movielist"); 

	%>
	
     <h1>Hello</h1>
<%--      <p><%=naverUrl %></p><br> --%>
<%--      <p><%=boxOffUrl %></p> --%>
     
     <p>��ȭ �̸� : <%= movie1.getMovieNM()%></p>
     <p>��ȭ ���� : <%= movie1.getSubtitle()%></p>
	 <p>��ȭ �ڽ����ǽ� ���� : <%= movie1.getRank()%></p>
     <p>��ȭ ���� : <%= movie1.getDirector()%></p>
     <p>�⿬ ��� : <%= movie1.getActor()%></p>
     <p>�̹��� �ּ� : <%= movie1.getImgUrl()%></p>
     <p>�����⵵ : <%= movie1.getPubDate()%></p>
     <p>��ȭ ���� : <%= movie1.getUserRating()%></p>
     
     <p>��ȭ �̸� : <%= movielist.get(0).getMovieNM()%></p>
     <p>��ȭ ���� : <%= movielist.get(0).getSubtitle()%></p>
	 <p>��ȭ �ڽ����ǽ� ���� : <%= movielist.get(0).getRank()%></p>
     <p>��ȭ ���� : <%= movielist.get(0).getDirector()%></p>
     <p>�⿬ ��� : <%= movielist.get(0).getActor()%></p>
     <p>�̹��� �ּ� : <%= movielist.get(0).getImgUrl()%></p>
     <p>�����⵵ : <%= movielist.get(0).getPubDate()%></p>
     <p>��ȭ ���� : <%= movielist.get(0).getUserRating()%></p>
     
     <p>��ȭ ���� : <%= movielist%></p>

   </c:when>
</c:choose>
</body>
</html>