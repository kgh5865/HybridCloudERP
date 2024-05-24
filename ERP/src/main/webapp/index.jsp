<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Menu Example</title>
    <script src="resources/vendor/chart.js/Chart.min.js"></script>
</head>
<body>

	<%
	response.setCharacterEncoding("UTF-8");
	String logout = request.getParameter("logout");
	if(logout!=null){
		//id값에 null 값을 넣음
		session.setAttribute("id", null);
		//세션시간 0. 로그아웃 처리
		session.setMaxInactiveInterval(0);
	}
	%>

    <!-- 메뉴 부분을 menu.jsp로 부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>
    
    
    <!-- 차트를 그릴 canvas 요소 -->
    <div id="chartContainer" style="width: 500px; height: 400px;"> <!-- 조절하고자 하는 크기로 설정 -->
        <!-- 차트를 그릴 canvas 요소 -->
        <canvas id="myChart" width="300" height="200"></canvas>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        // 차트 데이터
        var data = {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: 'Example Dataset',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
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
