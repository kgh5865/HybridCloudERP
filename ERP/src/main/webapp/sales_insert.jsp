<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>거래 입력 결과</title>
</head>
<body>
<%@ include file="connection.jsp" %>
<%
//폼에서 받은 데이터를 변수에 저장
String customer = request.getParameter("label_customer");
String date = request.getParameter("label_date");
String name = request.getParameter("label_name");
int count = Integer.parseInt(request.getParameter("label_count"));
int price = Integer.parseInt(request.getParameter("label_price"));
int supply = count * price; // 공급가액 계산
int vat = (int)(supply * 0.1); // 부가세 계산
String payment = request.getParameter("label_payment");
String account = request.getParameter("label_account");

int item_code=0;

    ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	//pinventory 확인
	try {
        String sql = "SELECT code FROM pinventory Where name=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        
        
        while (rs.next()) {
        	item_code = rs.getInt("code");
        }
    } catch (SQLException ex) {
    	%>
    	<script type="text/javascript">
		alert("상품명이 없습니다");
		location.href = 'salesManagement.jsp'
	</script>
        <%
    } finally {
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
    }
            

    

    try {
        String sql = "INSERT INTO sales (customer, date, code, name, count, price, supply, vat, payment, account) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, customer);
        pstmt.setString(2, date);
        pstmt.setInt(3, item_code);
        pstmt.setString(4, name);
        pstmt.setInt(5, count);
        pstmt.setInt(6, price);
        pstmt.setInt(7, supply);
        pstmt.setInt(8, vat);
        pstmt.setString(9, payment);
        pstmt.setString(10, account);

        int result = pstmt.executeUpdate();

        if(result > 0){
        	%>
        	<script type="text/javascript">
        	alert("거래 입력 완료");
        	location.href = 'salesManagement.jsp'
    	</script>
            <%
        	
        }else{
        	%>
        	<script type="text/javascript">
    		alert("거래 입력 실패");
    		location.href = 'salesManagement.jsp'
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
