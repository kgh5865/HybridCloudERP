<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 결과</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
        }

        .container {
            max-width: 400px;
        }

        .card-header {
            background-color: #343a40;
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
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
        <div class="card-header">
            로그인 결과
        </div>
        <div class="card-body">
            <% 
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                // 여기서는 간단한 예시를 위해 하드코딩된 값으로 로그인을 검증합니다.
                // 실제 프로덕션 환경에서는 데이터베이스와 연동하여 사용자 정보를 검증해야 합니다.
                if (username.equals("admin") && password.equals("password")) {
            %>
                <h3 class="text-success">로그인 성공!</h3>
                <p class="lead">환영합니다, <%= username %>님!</p>
                <div class="text-center">
                    <a href="./index.jsp" class="btn btn-home">홈으로 이동</a>
                </div>
            <% } else { %>
                <h3 class="text-danger">로그인 실패!</h3>
                <p class="lead">아이디 또는 비밀번호가 올바르지 않습니다.</p>
                <div class="text-center">
                    <a href="./Login.jsp" class="btn btn-home">다시 시도</a>
                </div>
            <% } %>
        </div>
    </div>
</div>
<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
