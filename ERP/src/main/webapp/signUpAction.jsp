<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
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
    <!-- 메뉴 부분을 menu.jsp로부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>
<%
    // 데이터베이스 연결 정보


    // 폼에서 전달된 회원가입 정보 추출
    String id = request.getParameter("username");
    String code = request.getParameter("employee_id");
    String pw = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("dob");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    // 데이터베이스 연결 및 회원가입 정보 삽입
    try {
        Class.forName("com.mysql.jdbc.Driver");
       
        // 회원가입 정보를 데이터베이스에 삽입하는 SQL 쿼리
        String sql = "INSERT INTO users (id, code, pw, name, gender, birthday, email, phone, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setInt(2, Integer.parseInt(code));
        pstmt.setString(3, pw);
        pstmt.setString(4, name);
        pstmt.setString(5, gender);
        pstmt.setString(6, birthday);
        pstmt.setString(7, email);
        pstmt.setString(8, phone);
        pstmt.setString(9, address);
        pstmt.executeUpdate();

        // 데이터베이스 연결 및 쿼리 실행 종료
        pstmt.close();
        conn.close();
%>

<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-success text-white">
            회원가입 완료
        </div>
        <div class="card-body">
            <h1 class="display-6">회원가입이 성공적으로 완료되었습니다!</h1>
            <p class="lead">아래는 회원가입 정보입니다.</p>
            <ul class="list-group">
                <li class="list-group-item">아이디: <%= id %></li>
                <li class="list-group-item">사원번호: <%= code %></li>
                <li class="list-group-item">이름: <%= name %></li>
                <li class="list-group-item">성별: <%= gender %></li>
                <li class="list-group-item">생년월일: <%= birthday %></li>
                <li class="list-group-item">이메일: <%= email %></li>
                <li class="list-group-item">전화번호: <%= phone %></li>
                <li class="list-group-item">주소: <%= address %></li>
            </ul>
            <div class="text-center mt-3">
                <a href="./index.jsp" class="btn btn-home">홈으로 이동</a>
            </div>
        </div>
    </div>
</div>

<%
    } catch (Exception e) {
        out.println("데이터베이스 오류 발생: " + e.getMessage());
    }
%>

<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>