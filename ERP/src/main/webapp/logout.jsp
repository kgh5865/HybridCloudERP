<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션을 무효화합니다.
    if (session != null) {
        session.invalidate(); // 세션 무효화
    }
    // 로그아웃 후 메인 페이지로 리다이렉트합니다.
    response.sendRedirect("index.jsp");
%>
