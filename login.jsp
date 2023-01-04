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
	<div class="d-grid gap-1 "  >	
		<div class="p-2 color">
			<div class="container-fluid text-center ">
				<h1 class="display-3 " style="margin: 0;">Display 2</h1>
			</div>
			<nav class="navbar ">
			  <div class="container-fluid">
			    <a class="navbar-brand color" href="#">Offcanvas navbar</a>
			    <button class="navbar-toggler  bg-color" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
			      <span class="btn icon-white">login</span>
			    </button>
			    
			    <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			      <div class="container">
			        
			        <div class="d-flex justify-content-center mt-3" id="loginBoxTitle">
			         로그인 타이틀
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
					<button class="w-100 btn btn-lg btn-primary mt-3" type="submit">로그인</button>
					
			      </div>
			      <div class="offcanvas-body">
			        
			      </div>
			    </div>
			  </div>
			</nav>
			
		</div>
		<div class="p-2  " >		
			<div style="width: 100vw; ">
				<div class="container text-center bg-dark" style=" width: 100wv; height:5vh;">
					<p style="color:black">현재 상영작</p>
				</div>
				<div class="px-3 d-flex flex-row" style=" overflow:auto; max-width:100vw; height:70vh;">
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw;height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh; ">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
				</div>
			</div>
		<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content bg">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body " >
			        ...
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <a type="button" class="btn btn-primary" href="http://www.naver.com">네이버</a>
			      </div>
			    </div>
			  </div>
			</div>
	
		</div>
		<div class="p-2 " >		
			<div style="width: 100vw; ">
				<div class="container text-center bg-dark" style=" width: 100wv; height:5vh;">
					<p style="color:black">최신 인기작 </p>
				</div>
				<div class="px-3 d-flex flex-row" style=" overflow:auto; max-width:100vw; height:70vh;">
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw;height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh; ">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
					<div class="img bg-primary mx-3 mt-3" data-bs-toggle="modal" data-bs-target="#exampleModal" style="min-width: 20vw; height:60vh;">
						1번째
					</div>
				</div>
			</div>
		
	
		</div>
		
	</div>
	<hr style="color:black; ">
	<footer class="container-fluid  text-center py-3 mt-3">
		
		<p>우리가 만든 거</p>
		<p>우리가 만든 거</p>
		<p>우리가 만든 거</p>
	</footer>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>


</html>