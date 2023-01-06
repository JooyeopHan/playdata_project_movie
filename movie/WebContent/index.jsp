<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList, model.vo.MovieVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>NaverAPI 결과</title>
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
     
     <p>영화 이름 : <%= movie1.getMovieNM()%></p>
     <p>영화 부제 : <%= movie1.getSubtitle()%></p>
	 <p>영화 박스오피스 순위 : <%= movie1.getRank()%></p>
     <p>영화 감독 : <%= movie1.getDirector()%></p>
     <p>출연 배우 : <%= movie1.getActor()%></p>
     <p>이미지 주소 : <%= movie1.getImgUrl()%></p>
     <p>개봉년도 : <%= movie1.getPubDate()%></p>
     <p>영화 평점 : <%= movie1.getUserRating()%></p>
     
     <p>영화 이름 : <%= movielist.get(0).getMovieNM()%></p>
     <p>영화 부제 : <%= movielist.get(0).getSubtitle()%></p>
	 <p>영화 박스오피스 순위 : <%= movielist.get(0).getRank()%></p>
     <p>영화 감독 : <%= movielist.get(0).getDirector()%></p>
     <p>출연 배우 : <%= movielist.get(0).getActor()%></p>
     <p>이미지 주소 : <%= movielist.get(0).getImgUrl()%></p>
     <p>개봉년도 : <%= movielist.get(0).getPubDate()%></p>
     <p>영화 평점 : <%= movielist.get(0).getUserRating()%></p>
     
     <p>영화 평점 : <%= movielist%></p>

   </c:when>
</c:choose>
</body>
</html>