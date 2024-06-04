<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>인사 등록 결과</title>
</head>
<body>
<%@ include file="connection.jsp" %>
<%

//데이터베이스 연결
ResultSet rs = null;
PreparedStatement pstmt = null;

String code = request.getParameter("code");
int department = Integer.parseInt(request.getParameter("department"));
int position = Integer.parseInt(request.getParameter("position"));
String startdate = request.getParameter("startdate");

//폼 데이터 처리

try {
	String insertSql = "INSERT INTO personnel (code, d_num, date, total, p_num, startdate) VALUES (?, ?, 0, 0, ?, ?)";
    pstmt = conn.prepareStatement(insertSql);
    pstmt.setInt(1, Integer.parseInt(code));
    pstmt.setInt(2, department);
    pstmt.setInt(3, position);
    pstmt.setDate(4, Date.valueOf(startdate));

    int result = pstmt.executeUpdate();

    if(result > 0){
    	%>
    	<script type="text/javascript">
    	alert("인사 등록 완료");
    	location.href = 'personnelManagement.jsp'
	</script>
        <%
    	
    }else{
    	%>
    	<script type="text/javascript">
		alert("인사 등록 실패");
		location.href = 'personnelManagement.jsp'
	</script>
        <%
    }
} catch(Exception e) {
    e.printStackTrace();
} finally {
    try { if (pstmt != null) pstmt.close(); } catch(Exception e) {}
    try { if (conn != null) conn.close(); } catch(Exception e) {}
}

%>
</body>
</html>
