<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.VO.memberVO,model.VO.MovieVO, java.util.List, java.util.ArrayList" %>    
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
#scroll::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

</style>
</head>
<body>
<div class="p-2" >
<%
	String title = request.getParameter("title");
	ArrayList<MovieVO> movielist = (ArrayList<MovieVO>)session.getAttribute("movielist"); 
%>		
			<div style="width: 100vw; ">
				<div class="container text-center bg-secondary mb-5 mt-3" style=" width: 100wv; height:5vh;">
					<p style="color:black"><%=title %></p>
				</div>
				<div class="container-fluid d-flex flex-row"  id="scroll" style=" overflow:scroll; max-width:100vw; height:70vh;">
				<c:forEach var="i" begin="0" end="7" >
					<form action="detail" method="post">
						<input type="image" class="mt-3 mx-3 img" src="${movielist.get(i).getImgUrl()}" style="max-width: 20vw;height:60vh;">
						<input type="hidden" name="id" value="${i}" >
						<input type="hidden" name="movie" value="${movielist.get(i).getMovieNM()}" >
						<input type="hidden" name="action" value="select">
					</form>
				</c:forEach>
				</div>
			</div>
	
		</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</html>