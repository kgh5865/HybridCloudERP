<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users Data</title>
</head>
<body>
    <%
    	Connection conn = null;
        // 데이터베이스 연결 정보
        String jdbcDriver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://210.119.103.176:8001/erp";
        String user = "AAA"; // 설정한 MySQL 사용자
        String password = "1234"; // 설정한 MySQL 비밀번호
        
     // JDBC 드라이버 로드
        Class.forName(jdbcDriver);
        
     // 데이터베이스 연결
        conn = DriverManager.getConnection(url, user, password);

    %>
</body>
</html>