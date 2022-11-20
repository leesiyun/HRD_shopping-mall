<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
<header>
<h2>쇼핑몰 회원관리 프로그램</h2>
</header>
<nav>
<a target="content" href="register.jsp">회원등록</a>
<a target="content" href="list.jsp">회원목록조회/수정</a>
<a target="content" href="summary.jsp">회원매출조회</a>
<a target="content" href="main.jsp">홈으로.</a>
</nav>
<section>
<iframe name="content" src="main.jsp"></iframe>
</section>
<footer>
HRDKOREA Copyright&copy;2016 All rights reserved Human Resources Development Service of Korea.
</footer>
</body>
</html>