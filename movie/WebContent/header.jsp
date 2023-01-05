<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<div class="p-2 color">
			<div class="container-fluid text-center ">
				<h1 class="display-3 " style="margin: 0;">Display 2</h1>
			</div>
			<nav class="navbar ">
			  <div class="container-fluid">
			    <a class="navbar-brand " href="http://localhost:8088/reprotype/login.jsp"><span class="color">Offcanvas navbar</span></a>
			    <button class="navbar-toggler" style="background-color:#D0D0D0;border:none;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
			      <span class="btn" style="color: white;">login</span>
			    </button>
			    
			    <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			      <div class="container">
			        
			        <div class="d-flex justify-content-center mt-3" id="loginBoxTitle">
			         <h3 class="mb-3">로그인 타이틀</h3>
			        </div>
			      	<div class="form-floating mt-3">
					 <input type="text" class="form-control" id="id">
					 <label for="id">아이디</label>
					</div>
					<div class="form-floating mt-3">
					 <input type="password" class="form-control" id="pwd">
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
			      </div>
			      <div class="offcanvas-body">
			        
			      </div>
			    </div>
			  </div>
			</nav>
			
		</div>
</body>
</html>