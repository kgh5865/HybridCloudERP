<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Menu Example</title>
    <style>

</style>
    
</head>
<body>
    <!-- 메뉴 부분을 menu.jsp로 부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>
    
    
    &ensp;&ensp;&ensp;&ensp;
    
    <div class="container-fluid" style="margin: 0 auto;  width: 80%;">
						<div class="card shadow mb-1">
							<div class="card-header py-3">
								<h4 class="m-0 font-weight-bold text-primary">거래 입력</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div class="container-fluid">
									<table class="table table-bordered" id="dataTable">
										<thead>
											<tr>
												<th>거래처명</th>
												<th>일자</th>
												<th>상품명</th>
												<th>수량</th>
												<th>단가</th>
												<th>공급가액</th>
												<th>부가세</th>
												<th>결제수단</th>
												<th>입금계좌</th>
											</tr>
										</thead>
										<tbody>
										<tr>
											<form method="post" action="sales_insert.jsp">
												
												<td><input type="text" name="label_customer" size="10"></td>
												<td><input type="date" name="label_date" size="6"></td>
												<td><input type="text" name="label_name" size="8"></td>
												<td><input type="text" name="label_count" size="6" oninput="calculateSupply()"></td>
												<td><input type="text" name="label_price" size="6" oninput="calculateSupply()"></td>
												<td><input type="text" name="label_supply" size="6" readonly></td>
												<td><input type="text" name="label_vat" size="6" readonly></td>
												<td><select name="label_payment">
													<option value="신용카드" size="8">신용카드</option>
													<option value="현금" size="8">현금</option>
												</select></td>
												<td><input type="text" name="label_account" size="10"></td>
												<td><input type="submit" value="등록"></td>
											</form>
											</tr>
										</tbody>
									</table>
									</div>
								</div>
							</div>
						</div>
					</div>

	
	&ensp;&ensp;&ensp;&ensp;
	<div class="container" style="margin: 0 auto;">
						<div class="card shadow mb-1">
							<div class="card-header py-3">
								<h4 class="m-0 font-weight-bold text-primary">최신 현황</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div class="container">
										<table class="table table-bordered" id="dataTable" width="10%"
											cellspacing="0">
										<thead>
											<tr>
												<th>거래처명</th>
												<th>일자</th>
												<th>상품명</th>
												<th>수량</th>
												<th>단가</th>
												<th>공급가액</th>
												<th>부가세</th>
												<th>결제수단</th>
												<th>입금계좌</th>
											</tr>
										</thead>
										<tbody>
										<%
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    
    try {
        String sql = "SELECT * FROM sales ORDER BY `index` ASC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
            String customer = rs.getString("customer");
            Date date = rs.getDate("date");
            String name = rs.getString("name");
            int count = rs.getInt("count");
            int price = rs.getInt("price");
            int supply = rs.getInt("supply");
            int vat = rs.getInt("vat");
            String payment = rs.getString("payment");
            String account = rs.getString("account");
%>
            <tr>
                <td><%= customer %></td>
                <td><%= date %></td>
                <td><%= name %></td>
                <td><%= count %></td>
                <td><%= price %></td>
                <td><%= supply %></td>
                <td><%= vat %></td>
                <td><%= payment %></td>
                <td><%= account %></td>
            </tr>
<%
        }
    } catch (SQLException ex) {
        out.println("sales 테이블 호출이 실패.<br>");
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (rs != null)
            rs.close();
        if (pstmt != null)
            pstmt.close();
        if (conn != null)
            conn.close();
    }
%>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
				</div>
	
	&ensp;&ensp;&ensp;&ensp;
	
	
	<%@ include file="footer.jsp" %>
	
	<script>
	function calculateSupply() {
    var count = document.getElementsByName('label_count')[0].value;
    var price = document.getElementsByName('label_price')[0].value;
    var supplyField = document.getElementsByName('label_supply')[0];
    var vatField = document.getElementsByName('label_vat')[0];

    if (count && price) {
        var supplyAmount = count * price;
        supplyField.value = supplyAmount;
        vatField.value = supplyAmount/10;
    } else {
        supplyField.value = '';
        vatField.value = '';
    }
}
</script>
	
    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
