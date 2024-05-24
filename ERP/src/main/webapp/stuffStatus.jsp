<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>재고 및 수입품 목록</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>

<div class="container-fluid">

    <div class="row">

        <!-- 수입품 목록 -->
        <div class="col-md-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary">수입품 목록</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable">
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
                                ResultSet rs = null;
                                PreparedStatement pstmt = null;

                                try {
                                    // SQL 쿼리 실행
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
                                <% } 
                                } catch (SQLException ex) {
                                    out.println("수입품 테이블 호출이 실패.<br>");
                                    out.println("SQLException: " + ex.getMessage());
                                } finally {
                                    if (rs != null)
                                        rs.close();
                                    if (pstmt != null)
                                        pstmt.close();
                                    // 연결은 닫지 않음
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 재고 목록과 그래프 -->
        <div class="col-md-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h4 class="m-0 font-weight-bold text-primary">재고 목록</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="inventoryTable1">
                            <tbody>
                             <% 
                                ResultSet rs1 = null;
                                PreparedStatement pstmt1 = null;

                                try {
                                    // SQL 쿼리 실행
                                    String sql1 = "SELECT * FROM stuff ORDER BY code ASC";
                                    pstmt1 = conn.prepareStatement(sql1);
                                    rs1 = pstmt1.executeQuery();        

                                    // 결과 출력
                                    while (rs1.next()) {
                                        int code1 = rs1.getInt("code");
                                        String name1 = rs1.getString("name");
                                        int count1 = rs1.getInt("count");} 
                            } catch (SQLException ex) {
                                out.println("재고 테이블 호출이 실패.<br>");
                                out.println("SQLException: " + ex.getMessage());
                            } finally {
                                if (rs1 != null)
                                    rs1.close();
                                if (pstmt1 != null)
                                    pstmt1.close();
                                // 연결은 닫지 않음
                            }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-body">
                    <!-- 그래프를 그릴 canvas 요소 -->
                    <canvas id="inventoryChart" width="400" height="400"></canvas>
                    <script>
                        // 재고 목록 데이터
                        var inventoryData = {
                            labels: [
                                <% 
                                    ResultSet rs2 = null;
                                    PreparedStatement pstmt2 = null;
                                    try {
                                        String sql = "SELECT name FROM stuff ORDER BY code ASC";
                                        pstmt2 = conn.prepareStatement(sql);
                                        rs2 = pstmt2.executeQuery();
                                        while (rs2.next()) {
                                            String name2 = rs2.getString("name");
                                %>
                                '<%= name2 %>',
                                <% }
                                    } catch (SQLException ex) {
                                        out.println("재고 테이블 호출이 실패.<br>");
                                        out.println("SQLException: " + ex.getMessage());
                                    } finally {
                                        if (rs2 != null)
                                            rs2.close();
                                        if (pstmt2 != null)
                                            pstmt2.close();
                                        // 연결은 닫지 않음
                                    }
                                %>
                            ],
                            datasets: [{
                                label: '재고 수량',
                                data: [
                                    <% 
                                        ResultSet rs3 = null;
                                        PreparedStatement pstmt3 = null;
                                        try {
                                            String sql3 = "SELECT count FROM stuff ORDER BY code ASC";
                                            pstmt3 = conn.prepareStatement(sql3);
                                            rs3 = pstmt3.executeQuery();
                                            while (rs3.next()) {
                                                int count3 = rs3.getInt("count");
                                    %>
                                    <%= count3 %>,
                                    <% }
                                        } catch (SQLException ex) {
                                            out.println("재고 테이블 호출이 실패.<br>");
                                            out.println("SQLException: " + ex.getMessage());
                                        } finally {
                                            if (rs3 != null)
                                                rs3.close();
                                            if (pstmt3 != null)
                                                pstmt3.close();
                                            // 연결은 닫지 않음
                                        }
                                    %>
                                ],
                                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 1
                            }]
                        };

                        // 차트 옵션
                        var inventoryOptions = {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        };

                        // 재고 목록 그래프 그리기
                        var inventoryCtx = document.getElementById('inventoryChart').getContext('2d');
                        var inventoryChart = new Chart(inventoryCtx, {
                            type: 'bar',
                            data: inventoryData,
                            options: inventoryOptions
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>