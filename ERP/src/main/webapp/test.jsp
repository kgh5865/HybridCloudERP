<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sales Chart Example</title>
    <script src="resources/vendor/chart.js/Chart.min.js"></script>
</head>
<body>
    <!-- 메뉴 부분을 menu.jsp로 부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>

    <!-- 차트를 그릴 canvas 요소 -->
    <div id="chartContainer" style="width: 500px; height: 400px;">
        <canvas id="myChart" width="300" height="200"></canvas>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        // 데이터베이스에서 가져온 데이터를 JavaScript 변수로 전달
        var customerLabels = [];
        var supplyData = [];

        <% 
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                
                // SQL 쿼리 실행
                String sql = "SELECT customer, SUM(supply) as totalSupply FROM sales GROUP BY customer";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                // 결과를 JavaScript 배열에 추가
                while (rs.next()) {
                    String customer = rs.getString("customer");
                    int totalSupply = rs.getInt("totalSupply");
        %>
                    customerLabels.push('<%= customer %>');
                    supplyData.push(<%= totalSupply %>);
        <% 
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>

        // 차트 데이터
        var data = {
            labels: customerLabels,
            datasets: [{
                label: 'Total Supply per Customer',
                data: supplyData,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        };

        // 차트 옵션
        var options = {
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
    <%@ include file="footer.jsp" %>
</body>
</html>
