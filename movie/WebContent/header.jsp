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
.bg-color{
		background-color:#D0D0D0;
		border:none;
}
.color{
		color:#D0D0D0;
}

#loginBoxTitle{
  color:#000000;
  font-weight: bold;
  font-size: 50px;
  padding: 5px;
  margin-bottom: 20px;
  background: linear-gradient(to left, #f6e9fd, #cb89ea);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.subindex_purplebox {
    padding: 16px 17px 0;
    border-radius: 12px;
    border: solid 1px #cb89ea;
    background-color: #fff;
    box-sizing: border-box;
}
.profile_area {
   	-webkit-text-size-adjust: none;
    font-size: 1rem;
    font-family: -apple-system,BlinkMacSystemFont,helvetica,"Apple SD Gothic Neo",sans-serif;
    color: #1e1e23;
    text-align: center;
    box-sizing: border-box;
    padding: 12px 20px 12px;
    display: block;
    background-color: #fff;
}
.title_text {
	opacity: 0.5;
}
.userid {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 0px;
}
.useremail {
	margin-bottom: 0px;
}
.main-title {
	font-size: 32px;
  	font-weight: 600;
 	color: #1928A2;
 	text-align: center;
 	margin: 48px 0 24px;
	}
</style>
</head>
<body>
	<div class="p-2 color">
			<div class="container-fluid text-center" >
				<a href="http://localhost:8088/reprotype/log">
			  	 <img src="./logo.png" style="width: 30vw; height: 15vh">
			   </a>
<!-- 				<h1 class="main-title " style="margin: 0;"></h1> -->
			</div>
			<nav class="navbar ">
			  <div class="container-fluid mx-5 justify-content-md-end">
			   
			    <button class="navbar-toggler mt-3 " style="padding:0px" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
<!-- 			      <span class="btn btn-primary btn-lg">로그인</span> -->
					<svg xmlns="http://www.w3.org/2000/svg" width="5vw" height="3vw" fill="white" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
					  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
					</svg>
					  
			    </button>
			    
			    <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			      <div class="container">
							<%
								memberVO member = (memberVO)session.getAttribute("mem");
								boolean loginox = false;
								if(member != null){
									loginox = true;
								}
							%>
			      	<% if(!loginox){%>
			        <form method="post" action="login">
			        <div class="d-flex justify-content-center mt-3" id="loginBoxTitle">
			         <h3 class="mb-3">로그인 타이틀</h3>
			        </div>
			      	<div class="form-floating mt-3">
					 <input type="text" class="form-control" name="id" id="id">
					 <label for="id">아이디</label>
					</div>
					<div class="form-floating mt-3">
					 <input type="password" class="form-control" name="pwd" id="pwd">
					 <label for="pwd">비밀번호</label>
					</div>
					<div class="form-check mt-3">
       				 <input type="checkbox" class="form-check-input" id="dropdownCheck">
        			 <label class="form-check-label" for="dropdownCheck">
         			  아이디 저장
       				 </label>
       				</div> 
					<button class="w-100 btn btn-lg btn-secondary mt-3" type="submit">로그인</button>
					<a href="http://localhost:8088/reprotype/sign-up.jsp"><button class="w-100 btn btn-lg btn-secondary mt-3" type="button">회원가입</button></a>
			      	</form>
			      	<%} else{%>
			      		<div class="subindex_purplebox mt-3">
						<div class="profile_area">
							<img src="https://phinf.pstatic.net/contact/20191003_136/1570029116351cmgSW_GIF/200.gif?type=s160" width="84" height="84" alt="프로필 이미지">
								<div class="profile">
									<p class="userid"><%=member.getNickname() %></p>
									<p class="useremail"><%=member.getEmail() %></p>
									<p class="signupdate">가입날짜 : <%=member.getCurdate() %></p>
								</div>
							</div>
						</div>
			      		<form method="get" action="login">
			      			<input type="hidden" name="action" value="logout">
			      			<button class="w-100 btn btn-lg btn-secondary mt-3" type="submit">로그아웃</button>
			      		</form>
			      	<%} %>
			      </div>
			      <div class="offcanvas-body">
			        
			      </div>
			    </div>
			  </div>
			</nav>
			<!-- 로그인을 한다 ->서버 쪽으로 아이디랑 패스워드가 -> 서버쪽에랑 크롬 세션 저장: 아이디만 request session단위라면 크롬이 다 꺼지기전까지
			세션에 저장한값은 남아 있을거라서   -->
		</div>
</body>
</html>