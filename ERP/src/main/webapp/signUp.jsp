<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AAA Company</title>
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

        .card-header {
            background-color: #343a40;
            color: #fff;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
        }

        .btn-submit {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-submit:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            회원가입
        </div>
        <div class="card-body">
            <form action="signUpAction.jsp" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">성별</label>
                    <select class="form-select" id="gender" name="gender" required>
                        <option value="M">남성</option>
                        <option value="W">여성</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="dob" class="form-label">생년월일</label>
                    <input type="date" class="form-control" id="dob" name="dob" required>
                </div>
                <div class="mb-3">
                    <label for="employee_id" class="form-label">사원번호</label>
                    <input type="text" class="form-control" id="employee_id" name="employee_id" required>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">전화번호</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">주소</label>
                    <textarea class="form-control" id="address" name="address" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-submit">가입</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>