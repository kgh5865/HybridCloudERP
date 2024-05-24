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
    <title>영업 현황</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        #chartContainer {
            width: 100%;
            height: 100%;
        }

        #myChart {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>

	&ensp;&ensp;&ensp;&ensp;
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <!-- 수입품 목록 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">영업 목록</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered" id="dataTable">
                            <thead>
                                <tr>
                                    <th>거래처명</th>
                                    <th>일자</th>
                                    <th>상품코드</th>
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
                                    // SQL 쿼리 실행
                                    String sql = "SELECT * FROM sales ORDER BY `index` ASC";
                                    pstmt = conn.prepareStatement(sql);
                                    rs = pstmt.executeQuery();        

                                    // 결과 출력
                                    while (rs.next()) {
                                        String customer = rs.getString("customer");
                                        Date date = rs.getDate("date");
                                        int code = rs.getInt("code");
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
                                    <td><%= code %></td>
                                    <td><%= name %></td>
                                    <td><%= count %></td>
                                    <td><%= price %></td>
                                    <td><%= supply %></td>
                                    <td><%= vat %></td>
                                    <td><%= payment %></td>
                                    <td><%= account %></td>
                                </tr>
                                <% } 
                                } catch (SQLException ex) {
                                    out.println("영업 테이블 호출이 실패.<br>");
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
            <div class="col-md-6">
                <!-- 영업 그래프 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h4 class="m-0 font-weight-bold text-primary">영업 그래프</h4>
                    </div>
                    <div class="card-body" style="display: flex; justify-content: center; align-items: center;">
                        <!-- 차트를 그릴 canvas 요소 -->
                        <div id="chartContainer">
                            <canvas id="myChart"></canvas>
                        </div>
                        <script>
                            // 데이터베이스에서 가져온 데이터를 JavaScript 변수로 전달
                            var customerLabels = [];
                            var supplyData = [];

                            <% 
                                PreparedStatement pstmt2 = null;
                                ResultSet rs2 = null;

                                try {
                                    
                                    // SQL 쿼리 실행
                                    String sql = "SELECT customer, SUM(supply) as totalSupply FROM sales GROUP BY customer";
                                    pstmt2 = conn.prepareStatement(sql);
                                    rs2 = pstmt2.executeQuery();

                                    // 결과를 JavaScript 배열에 추가
                                    while (rs2.next()) {
                                        String customer = rs2.getString("customer");
                                        int totalSupply = rs2.getInt("totalSupply");
                            %>
                                        customerLabels.push('<%= customer %>');
                                        supplyData.push(<%= totalSupply %>);
                            <% 
                                    }
                                } catch (SQLException ex) {
                                    ex.printStackTrace();
                                } finally {
                                    if (rs2 != null) try { rs2.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    if (pstmt2 != null) try { pstmt2.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                                }
                            %>

                            // 차트 데이터
                            var data = {
                                labels: customerLabels,
                                datasets: [{
                                    label: '거래처별 공급가액',
                                    data: supplyData,
                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                    borderColor: 'rgba(54, 162, 235, 1)',
                                    borderWidth: 1
                                }]
                            };

                            // 차트 옵션
                            var options = {
                                responsive: true,
                                scales: {
                                    yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                                }
                            };

                            // 막대 그래프 그리기
                            var ctx = document.getElementById('myChart').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: data,
                                options: options
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
