<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.VO.memberVO,model.VO.MovieVO, model.VO.CommentVO, java.util.List, java.util.ArrayList" %>        
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
<body   class="bg color " style=" width: 100vw; height: 100vh;">
<%
/* 	Integer id =  Integer.parseInt(request.getParameter("id")); */
	Integer id =  Integer.parseInt(String.valueOf(request.getAttribute("id"))); 
	ArrayList<MovieVO> movielist = (ArrayList<MovieVO>)session.getAttribute("movielist");
	ArrayList<CommentVO> commentlist = (ArrayList<CommentVO>)request.getAttribute("commentlist");
	
	String m1 = movielist.get(id).getImgUrl();
	String m2 = movielist.get(id).getMovieNM();
	String m3 = movielist.get(id).getSubtitle();
	Integer m4 = movielist.get(id).getRank();
	Double m5 = movielist.get(id).getUserRating();
	Integer m6 = movielist.get(id).getPubDate();
	String m7 = movielist.get(id).getDirector();
	String m8 = movielist.get(id).getActor();

	
%>		
	<jsp:include page="header.jsp"></jsp:include>
	<hr class="my-3"style="color:white; width:100%;">
	<div class="container bg-secondary py-3 pt-3 my-3" style="height:auto;">
		<div class="container bg-white mx-auto" style="width:80vw; height:auto; color:black;">
			<img class="mt-3 img" src=<%=m1 %> style="width:30vw; height: 50vh;">
			<hr style="color:black;">
			<p>영화 제목 : <%=m2 %> </p>
			<p>영화 부제 : <%=m3 %> </p>
			<p>영화 등급 : <%=m4 %> </p>
			<p>관객 평점 : <%=m5 %> </p>
			<p>시작 날짜 : <%=m6 %> </p>
			<p>영화 감독 : <%=m7 %> </p>
			<p>영화 배우 : <%=m8 %> </p> 
			<hr style="color:black;">
			<form >
				<div class="input-group mb-3 mx-auto floating-right row">
					<input type="hidden" name="movieNM" value=<%=m2 %>>
					<input type="hidden" name="nickname" value=<%=m2 %>>
	  				<input type="text" name="context" class="form-control col-10" placeholder="댓글을 작성해주세요" aria-describedby="button-addon2">
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
				<c:forEach var="item" items = "${commentlist}"  begin="0" end="3" >
					<tr>
						<td>${item.nickname}</td>
						<td>${item.content}</td>
						<th class="col-1">					
							<button type="button"
		                        class="btn btn-sm btn-outline-primary"
		                        data-bs-toggle="modal"
		                        data-bs-target="#comment-edit-modal"
		                        data-bs-action="update"
		                        data-bs-cnt="${item.cnt}"
		                        data-bs-movie="<%=m2 %>"
		                        data-bs-id="<%=id %>">수정
               				</button>
<%-- 								<input type="image" name="update" value="${i}" src="edit.png" style="width:20px; height:20px;">
								<input type = "hidden" name = "cnt" value = "${item.cnt}">
								<input type="hidden" name="action" value="update"> --%>

						</th>
						<th class="col-1">
							<form action="detail" method="get">
								<input type="image" name="delete" value="${i}" src="delete.png" style="width:20px; height:20px;">
								<input type = "hidden" name = "cnt" value = "${item.cnt}">
								<input type="hidden" name="id" value="<%=id %>" >
								<input type="hidden" name="movie" value="<%=m2 %>" >
								<input type="hidden" name="action" value="delete">
							</form>
						</th>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Modal -->
<div class="modal fade" id="comment-edit-modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 댓글 작성 폼 -->
                <form>
                    <!-- 댓글 본문 입력 -->
                    <div class="mb-3">
                        <label class="form-label">댓글 내용</label>
                        <textarea class="form-control form-control-sm" rows="3" id="edit-comment-body"></textarea>
                    </div>

                    <!-- 히든 인풋 -->
                    <input type="hidden" id="edit-comment-id" value = "<%= id%>">
                    <input type="hidden" id="edit-comment-cnt" value = "1">
                    <input type="hidden" id="edit-comment-movie" value = "<%= m2%>">

                    <!-- 전송 버튼 -->
                    <button type="button" class="btn btn-outline-primary btn-sm" id="comment-update-btn">수정 완료</button>
                </form>
            </div>
        </div>
    </div>
</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script>

//수정 완료 버튼
const commentUpdateBtn = document.querySelector("#comment-update-btn");



{
    // 모달 요소 선택
    const commentEditModal = document.querySelector("#comment-edit-modal");

    // 모달 이벤트 감지
    commentEditModal.addEventListener("show.bs.modal", function(event) {
        // 트리거 버튼 선택
        const triggerBtn = event.relatedTarget;

        // 데이터 가져오기
        const cnt= triggerBtn.getAttribute("data-bs-cnt");
        const movie= triggerBtn.getAttribute("data-bs-moive");
        const id= triggerBtn.getAttribute("data-bs-id");

        // 데이터 반영
        document.querySelector("#edit-comment-cnt").value = cnt;

        
    });

{

}	// 수정 완료 버튼 누를 시!
	commentUpdateBtn.addEventListener("click",function() {
	    // 수정 객체 댓글을 생성
	    const comment = {
	        cont: document.querySelector("#edit-comment-body").value,
	        cnt: document.querySelector("#edit-comment-cnt").value,
	        movie: document.querySelector("#edit-comment-movie").value,
	        id: document.querySelector("#edit-comment-id").value,
	        action : "update"
	    };
	
	    console.log(comment);
	
	    // 수정 REST API 호출 - fetch()
	    
	    fetch("/reprotype/detail", {
	        method: "POST",          
	        headers: {
	            'Content-Type': 'application/json',
	          },
	        body: JSON.stringify(comment), // 수정된 댓글 객체를 JSON 으로 전달
	    }).then(response => {
	        // http 응답 코드에 따른 메세지 출력
	            const msg = (response.ok) ? "댓글 수정이 완료 되었습니다." : "댓글 수정 실패...!";
	            window.alert(msg);
	        // 현재 페이지를 새로 고침
	        window.location.reload();
	    });
	});

}
	
</script>
</html>