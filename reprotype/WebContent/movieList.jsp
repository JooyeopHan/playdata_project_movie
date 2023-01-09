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
          box-shadow: #0c3869 10px 10px 20px;
        }
.img:hover{
          transform: scale(1.05) translateY(-8px);
}
#scroll::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

#subtitle {
		height: 50px;
	    top: 50%;
	    margin-top: -25px; /* Half this element's height */
}

/* .bgimg{

 	border: 0;
    padding: 0; 
    background-image: url('bg.jpg');
    min-height: 100%;
    background-position: center;
    background-size: cover;
} */

</style>
</head>
<body>
<div class="p-2" >
<%
	String title = request.getParameter("title");
	ArrayList<MovieVO> movielist = (ArrayList<MovieVO>)session.getAttribute("movielist"); 
%>		
			<div style="width: 100vw; ">
				<div class="container-fluid mx-3 mt-3" style=" width: 100wv; height:5vh;">
					<p class = "h3" id = "subtitle"  style=" color: #869fd9; text-shadow : black 2px 2px 2px"> &nbsp;<%= title %></p>
				</div>
				<div class="container-fluid d-flex flex-row"  id="scroll" style="color:#265ff0; overflow:scroll; max-width:100vw; height:80vh;">
					<c:forEach var="i" begin="0" end="9" >
				
						<form action="select" method="get" style=" color: #869fd9;">
							<div class ="container col" style = "background-color:#265ff0;   border-radius:30px;"">
							<input type="image" class="mt-3 mx-3 img" src="${movielist.get(i).getImgUrl()}" style=" max-width: 20vw;height:60vh" >
							</div>
							<input type="hidden" name="id" value="${i}" >
							<input type="hidden" name="movie" value="${movielist.get(i).getMovieNM()}" >
							<br>
							<c:if test="${movielist.get(i).getRank() eq 1}">
							<h1 class = "mt-3 text-center">&nbsp;TOP ${movielist.get(i).getRank() }</h1>
							</c:if>
							<c:if test="${movielist.get(i).getRank() eq 2}">
							<h2 class = "mt-3 text-center">&nbsp;TOP ${movielist.get(i).getRank() }</h2>
							</c:if>
							<c:if test="${movielist.get(i).getRank() eq 3}">
							<h3 class = "mt-3 text-center">&nbsp;TOP ${movielist.get(i).getRank() }</h3>
							</c:if>
							<c:if test="${movielist.get(i).getRank() > 3}">
							<h4 class = "mt-3 text-center">&nbsp;TOP ${movielist.get(i).getRank() }</h4>
							</c:if>
							
							<p class = "text-center mb-3">&nbsp;${movielist.get(i).getMovieNM() }</p>
						</form>
					
					</c:forEach>
				</div>
			</div>
	
		</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</html>