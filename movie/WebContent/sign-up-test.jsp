<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 구현 테스트</title>
		<link rel="stylesheet" href="myCss.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
	</head>
	<body>
		<div class="container py-4">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center">
                    <span class="text-primary h1">회원가입</span>                 
                </a>
            </div>
            <form id="signupForm">
                <div class="form-floating mt-4">
					 <input type="text" class="form-control" id="id" placeholder="holdid" required>
					 <label for="id">아이디</label>
					 <div class="valid-feedback">사용가능</div>
					 <div class="invalid-feedback">4자리 이상 입력하세요.</div>
				</div>					
				<div class="form-floating mt-4">
					<input type="password" class="form-control" id="pwd" placeholder="holdpwd" required>
					<label for="pwd">비밀번호</label>
					<div class="valid-feedback">사용가능</div>
					<div class="invalid-feedback">4자리 이상 입력하세요.</div>
				</div>
				<div class="form-floating mt-4">
					<input type="password" class="form-control" id="repwd" placeholder="holdrepwd" required>
					<label for="repwd">비밀번호 재확인</label>
					<div class="valid-feedback">일치합니다.</div>
					<div class="invalid-feedback">일치하지 않습니다.</div>
				</div>
                <div class="form-floating mt-4">
                    <input type="text" class="form-control" id="name" placeholder="holdname" required>
                    <label for="name">이름</label>
                </div>
			    <div class="form-group">
			      <label for="Select" class="form-label mt-4">성별</label>
			      <select class="form-select" id="Select">
			        <option>남자</option>
			        <option>여자</option>
			      </select>
			    </div>                
                <div class="form-group">
               		<label for="InputEmail1" class="form-label mt-4">Email</label>
                    <input type="email" class="form-control" id="InputEmail1" placeholder="이메일" required>
                </div>
				<div class="d-grid mt-4 gap-2">
                    <button class="btn btn-primary btn-lg" type="submit">가입하기</button>
                </div>
            </form>
        </div>
        
        <script>
  			
        	document.querySelector("#id").addEventListener("input", function(){
        		let inputId=this.value;
        		isValid = inputId.length > 4 ? true : false;   
      		
        		if(isValid){
        			this.classList.remove("is-invalid");
        			this.classList.add("is-valid");
//         			id = inputId;
        			
        		} else{        			
        			this.classList.remove("is-valid");
        			this.classList.add("is-invalid");
        		}
        	});
        	
        	let pwd = "";
        	document.querySelector("#pwd").addEventListener("input", function(){
        		let inputPwd=this.value;
        		isValid = inputPwd.length > 4 ? true : false;   
      		
        		if(isValid){
        			this.classList.remove("is-invalid");
        			this.classList.add("is-valid");
        			pwd = inputPwd;
        			console.log(pwd)
        			
        		} else{        			
        			this.classList.remove("is-valid");
        			this.classList.add("is-invalid");
        		}
        	});
        	
        	document.querySelector('#repwd').addEventListener("input", function(){
        		let inputRepwd=this.value;
        		isValid = inputRepwd == pwd ? true : false;
        		console.log(pwd)
        		console.log(repwd)
        		
        		if(isValid){
        			this.classList.remove("is-invalid");
        			this.classList.add("is-valid");       			
        		
        		} else{        			
        			this.classList.remove("is-valid");
        			this.classList.add("is-invalid");
        		}       		
        	});

        </script>
        
	</body>
</html>