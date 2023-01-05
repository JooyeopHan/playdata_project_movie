<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myCss.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
.img{
          border-radius: 12px;
          transition: transform 0.2s ease-in-out;
          box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
        }
.img:hover{
          transform: scale(1.05) translateY(-8px);
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title"); 
%>
<div class="p-2" >		
			<div style="width: 100vw; ">
				<div class="container text-center bg-secondary" style=" width: 100wv; height:5vh;">
					<p style="color:black"><%=title %></p>
				</div>
				<div class="container-fluid d-flex flex-row" style=" overflow:scroll; max-width:100vw; height:70vh;">
				<c:forEach var="i" begin="1" end="8" >
					<form action="detail.jsp" method="post">
						<input type="image" class="mt-3 mx-3 img" src="halabong.jpg" style="max-width: 20vw;height:60vh;">
						<input type="hidden" name="id" value="${i}" >
					</form>
				</c:forEach>
				</div>
			</div>
	
		</div>
</body>
</html>