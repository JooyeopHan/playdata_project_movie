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
	.img{
		border-radius: 12px;
		box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
	}
</style>
</head>
<body   class="bg color p-2" style=" width: 100vw; height: 100vh;">
	<jsp:include page="header.jsp"></jsp:include>
	<hr class="my-3"style="color:white; width:100%;">
	<div class="container bg-secondary py-3 pt-3 my-3" style="height:auto;">
		<div class="container bg-white mx-auto" style="width:80vw; height:auto;">
			<img class="mt-3 img" src="halabong.jpg" style="width:30vw; height: 50vh;">
			<hr style="color:black;">
			<p>영화 제목</p>
			<p>영화 내용</p>
			<p>영화 제목</p>
			<p>영화 내용</p>
			<p>영화 제목</p>
			<p>영화 내용</p>
			<p>영화 제목</p>
			<p>영화 내용</p>
			<hr style="color:black;">
			<form>
				<div class="input-group mb-3 mx-auto floating-right row">
	  				<input type="text" class="form-control col-10" placeholder="댓글을 작성해주세요" aria-describedby="button-addon2">
	  				<button class="btn col-2" type="submit" id="button-addon2" style="border:0.1px solid black;background-color:#D0D0D0;">게시</button>
				</div>
			</form>
			<hr style="color:black;">
			<table class="table">
				<thead>
					<tr>
						<th class="col-2">닉네임</th>
						<th class="col-8">댓글 내용</th>
						<th class="col-1">수정</th>
						<th class="col-1">삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>kkwr0504</td>
						<td>안녕하세요</td>
						<th class="col-1"><input type="image" src="edit.png" style="width:20px; height:20px;"></th>
						<th class="col-1"><input type="image" src="delete.png" style="width:20px; height:20px;"></th>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</html>