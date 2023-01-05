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
	.img:hover{
		 opacity: 0.5;
	}
	.icon-white{
  		color: white;
	}
	.bg-color{
		background-color:#D0D0D0;
		border:none;
	}
	.color{
		color:#D0D0D0;
	}
	.bg{
		background-color:#292929;
	}
</style>
</head>

<body   class="bg color " style=" width: 100vw; height: 100vh;">
	<div class="d-grid gap-1">	
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="movieList.jsp">
			<jsp:param name="title" value="일별 박스오피스" />
		</jsp:include>
		<jsp:include page="movieList.jsp">
			<jsp:param name="title" value="최신 인기작 " />
		</jsp:include>
	</div>
	<hr style="color:black; ">
	<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>


</html>