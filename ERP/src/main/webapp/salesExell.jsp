<%@ page import="java.sql.*" %>
<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>견적서 엑셀 출력</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String date = request.getParameter("date");
String name = request.getParameter("name");
int count = Integer.parseInt(request.getParameter("count"));
int price = Integer.parseInt(request.getParameter("price"));
int supply = Integer.parseInt(request.getParameter("supply"));
int vat = Integer.parseInt(request.getParameter("vat"));
int total = vat + supply;

response.setContentType("application/vnd.ms-excel; charset=UTF-8");
response.setHeader("Content-Disposition", "attachment; filename=\"sales_estimate.xls\"");
%>
<table border="1">
	<tr>
		<td><%= date %></td>
	</tr>
	<tr>
		<th colspan="9" style="font-size:20px; border:none;">견적서</th>
	</tr>
	<tr></tr>
	
	<tr>
        <th colspan="6" rowspan="3" style="border:none;"></th>
        <th rowspan="3">공급자</th>
        <th>사업자 번호</th>
        <td>127-14-57510</td>
    </tr>
    <tr>
        <th>상호</th>
        <td>AAA Company</td>
    </tr>
    <tr>
        <th>대표</th>
        <td>고민수</td>
    </tr>
	
	<tr></tr>
	
	
	<tr>
        <th colspan="2">합계 금액</th>
        <td colspan="2" style="border-right: none; text-align: center;">일금</td>
        <td colspan="2" style="border-right: none; border-left: none;"></td>
        <td colspan="3" style="border-left: none; text-align: center;">원정  (\   <%= total %>) /VAT포함</td>
    </tr>
	
    <tr>
        <th colspan="3">품명</th>
        <th>수량</th>
        <th colspan="2">단가</th>
        <th colspan="2">공급가액</th>
        <th>부가세</th>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center;"><%= name %></td>
        <td><%= count %></td>
        <td colspan="2"><%= price %></td>
        <td colspan="2"><%= supply %></td>
        <td><%= vat %></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr>
        <th colspan="3">합계</th>
        <td style="border-right: none; text-align: right;">\</td>
        <td colspan="5" style="border-left: none;"><%= total %></td>
    </tr>
</table>
</body>
</html>
