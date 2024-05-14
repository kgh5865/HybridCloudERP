<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<!-- 부트스트랩 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f8f9fa;
        color: #212529;
    }

    .container {
        max-width: 600px;
    }

    .btn-home {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-home:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-success text-white">
            회원가입 완료
        </div>
        <div class="card-body">
            <h1 class="display-6">회원가입이 성공적으로 완료되었습니다!</h1>
            <p class="lead">아래는 회원가입 정보입니다.</p>
            <ul class="list-group">
                <li class="list-group-item">이름: <%= request.getParameter("name") %></li>
                <li class="list-group-item">성별: <%= request.getParameter("gender") %></li>
                <li class="list-group-item">생년월일: <%= request.getParameter("dob") %></li>
                <li class="list-group-item">사원번호: <%= request.getParameter("employee_id") %></li>
                <li class="list-group-item">아이디: <%= request.getParameter("username") %></li>
                <li class="list-group-item">전화번호: <%= request.getParameter("phone") %></li>
                <li class="list-group-item">주소: <%= request.getParameter("address") %></li>
                <li class="list-group-item">이메일: <%= request.getParameter("email") %></li>
            </ul>
            <div class="text-center mt-3">
                <a href="./index.jsp" class="btn btn-home">홈으로 이동</a>
            </div>
        </div>
    </div>
</div>
<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
