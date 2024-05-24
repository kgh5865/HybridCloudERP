<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
        }

        .login-container {
            max-width: 300px; /* 변경된 부분 */
            margin: auto;
            margin-top: 5rem;
        }

        .card-header {
            background-color: #343a40;
            color: #000;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
        }

        .btn-login {
            background-color: #007bff;
            border-color: #007bff;
            color: #000; /* 변경된 부분: 로그인 버튼의 텍스트 색을 검정으로 변경 */
        }

        .btn-login:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="menu.jsp" %>
<%@ include file="connection.jsp" %>
<div class="login-container">
    <div class="card">
        <div class="card-header">
            로그인
        </div>
        <div class="card-body">
            <form action="loginAction.jsp" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-login">로그인</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>