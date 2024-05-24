<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 메뉴 부분을 menu.jsp로부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>
<div class="container" style="margin: 0 auto;">
        <div class="card shadow mb-1">
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary">최신 현황</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <form method="post" action="<%= request.getRequestURI() %>">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                        <th>제품 코드</th>
                                        <th>제품명</th>
                                        <th>수입 업체</th>
                                        <th>수입 일자</th>
                                        <th>유통 기한</th>
                                        <th>규격</th>
                                        <th>원가</th>
                                        <th>수량</th>
                                        <th>원산지</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="code" size="20"></td>
                                        <td><input type="text" name="name" size="20"></td>
                                        <td><input type="text" name="company" size="20"></td>
                                        <td><input type="date" name="date" size="6"></td>
                                        <td><input type="date" name="life" size="6"></td>                               
                                        <td><input type="text" name="standard" size="20"></td>
                                        <td><input type="text" name="cost" size="20"></td>
                                        <td><input type="text" name="count" size="20"></td>
                                        <td><input type="text" name="origin" size="20"></td>
                                        <td><input type="submit" value="등록"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
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
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                  <th>제품 코드</th>
                                        <th>제품명</th>
                                        <th>수입 업체</th>
                                        <th>수입 일자</th>
                                        <th>유통 기한</th>
                                        <th>규격</th>
                                        <th>원가</th>
                                        <th>수량</th>
                                        <th>원산지</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                // 데이터베이스 연결
                                Connection con = null;
                                ResultSet rs = null;
                                PreparedStatement pstmt = null;
                                
                                try {
                                    // 데이터베이스 연결
                                   
                                    // 폼 데이터 처리
                                   if ("POST".equalsIgnoreCase(request.getMethod())) {
                             int code = Integer.parseInt(request.getParameter("code"));
                             String name = request.getParameter("name");
                             String company = request.getParameter("company");
                             String date = request.getParameter("date");
                             String life = request.getParameter("life");
                             String standard = request.getParameter("standard");
                             int cost = Integer.parseInt(request.getParameter("cost"));
                             int count = Integer.parseInt(request.getParameter("count"));
                             String origin = request.getParameter("origin");

        String insertSql = "INSERT INTO stuff (code, name, company, date, life, standard, cost, count, origin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                                   pstmt = conn.prepareStatement(insertSql);
                                   pstmt.setInt(1, code);
                                   pstmt.setString(2, name);
                                   pstmt.setString(3, company);
                                   pstmt.setDate(4, Date.valueOf(date));
                                   pstmt.setDate(5, Date.valueOf(life));
                                   pstmt.setString(6, standard);
                                   pstmt.setInt(7, cost);
                                   pstmt.setInt(8, count);
                                   pstmt.setString(9, origin);
                                   pstmt.executeUpdate();
    }

                                    // 데이터 조회
                                    String sql = "SELECT * FROM stuff ORDER BY `index` ASC";
                           pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();        
                           
                                // 결과 출력
                                while (rs.next()) {
                                    int code = rs.getInt("code");
                                    String name = rs.getString("name");
                                    String company = rs.getString("company");
                                    Date date = rs.getDate("date");
                                    Timestamp life = rs.getTimestamp("life");
                                    String standard = rs.getString("standard");
                                    int cost = rs.getInt("cost");
                                    int count = rs.getInt("count");
                                    String origin = rs.getString("origin");
                            %>
                            <tr>
                                <td><%= code %></td>
                                <td><%= name %></td>
                                <td><%= company %></td>
                                <td><%= date %></td>
                                <td><%= life %></td>
                                <td><%= standard %></td>
                                <td><%= cost %></td>
                                <td><%= count %></td>
                                <td><%= origin %></td>
                            </tr>
                           <%
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    out.println("데이터베이스 오류 발생: " + ex.getMessage());
                                } finally {
                                    if (rs != null) rs.close();
                                    if (pstmt != null) pstmt.close();
                                    if (conn != null) conn.close();
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>