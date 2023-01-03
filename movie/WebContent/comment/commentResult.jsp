<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP가응답</title>
</head>
<body>
<h2>${ requestScope.msg }</h2>
<a href="${ header.referer }">후기 홈 화면으로</a>
</body>
</html>