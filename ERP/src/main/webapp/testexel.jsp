<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
    List<Map<String, Object>> transactionList = new ArrayList<Map<String, Object>>();
    Map<String, Object> transaction = new HashMap<String, Object>();
    transaction.put("번호", 1);
    transaction.put("거래처명", "설빙");
    transaction.put("일자", "2024-05-04");
    transaction.put("상품명", "망고 빙수");
    transaction.put("수량", 100);
    transaction.put("단가", 11000);
    transaction.put("공급가액", 1100000);
    transaction.put("부가세", 110000);
    transaction.put("결제수단", "현금");
    transaction.put("입금계좌", "123-456-7890");
    transactionList.add(transaction);
    
    response.setHeader("Content-Disposition", "attachment; filename=sales_list.xls;");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래 내역</title>
</head>
<body>
<h1>거래 내역</h1>
<table border="1">
    <thead>
    <tr>
        <% if(!transactionList.isEmpty()) { %>
            <% Map<String, Object> firstTransaction = transactionList.get(0); %>
            <% for(String key : firstTransaction.keySet()) { %>
                <th><%= key %></th>
            <% } %>
        <% } %>
    </tr>
	</thead>

    <tbody>
        <% for(Map<String, Object> item : transactionList) { %>
        <tr>
            <% for(String key : item.keySet()) { %>
            <td><%= item.get(key) %></td>
            <% } %>
        </tr>
        <% } %>
    </tbody>
</table>
</body>
</html>
