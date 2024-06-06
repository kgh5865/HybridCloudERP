<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>근태</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>

    <div class="container-fluid" style="margin: 0 auto; width: 80%;">
    <div class="card shadow mb-1">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary">근태 관리</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div class="container">
                    <form method="post" action="attendance.jsp" id="attendanceForm">
                        <table class="table table-bordered" id="dataTable">
                            <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Search</th>
                                    <th>Position</th>
                                    <th>Work Day</th>
                                    <th>Work Time (Hours)</th>
                                    <th>Pay</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" name="code" size="20" value="<%= request.getParameter("code") != null ? request.getParameter("code") : "" %>" id="code" oninput="getTimePay()"></td>
                                    <td><input type="submit" value="사원검색" id="searchEmployee"></td>
                                    <td>
                                    <% 
                                    String p_name = "직책명";
                                    int timepay = 0;
                                    String code = request.getParameter("code");
                                    if(code != null && !code.trim().isEmpty()) {
                                        try {
                                            String query = "SELECT (SELECT p_name FROM position WHERE position.p_num = personnel.p_num) AS p_name, (SELECT timepay FROM position WHERE position.p_num = personnel.p_num) AS timepay FROM personnel WHERE personnel.code = ?;";
                                            PreparedStatement pstmt = conn.prepareStatement(query);
                                            pstmt.setInt(1, Integer.parseInt(code));
                                            ResultSet rs = pstmt.executeQuery();
                                            if(rs.next()) {
                                                p_name = rs.getString("p_name");
                                                timepay = rs.getInt("timepay");
                                            } else {
                                                out.println("<p>해당 코드의 직원 정보를 찾을 수 없습니다.</p>");
                                            }
                                            rs.close();
                                            pstmt.close();
                                        } catch(Exception e) {
                                            e.printStackTrace();
                                        }
                                    }
                                    %>
                                    <%= p_name %>
                                    <input type="hidden" id="timepay" value="<%= timepay %>">
                                </td>
                                    <td>
                                        <select name="work_day" id="work_day">
                                            <% for (int i = 1; i <= 31; i++) { %>
                                                <option value="<%= i %>"><%= i %></option>
                                            <% } %>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="work_time" id="work_time">
                                            <% for (int i = 1; i <= 12; i++) { %>
                                                <option value="<%= i %>"><%= i %>시간</option>
                                            <% } %>
                                        </select>
                                    </td>
                                    <td><input type="text" name="pay" size="20" id="pay" readonly></td>
                                    <td><input type="submit" value="Register" name="register"></td>
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
            <h4 class="m-0 font-weight-bold text-primary">근태목록</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div class="container">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Index</th>
                                <th>사원번호</th>
                                <th>근무 일수</th>
                                <th>근무 시간</th>
                                <th>급여</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            ResultSet rs = null;
                            PreparedStatement pstmt = null;

                            try {
                                // 폼 데이터 처리
                                if (request.getParameter("register") != null) {
                                    int code3 = Integer.parseInt(request.getParameter("code"));
                                    int workDay = Integer.parseInt(request.getParameter("work_day"));
                                    int worktime = Integer.parseInt(request.getParameter("work_time").replace("시간", ""));
                                    int pay = Integer.parseInt(request.getParameter("pay"));

                                    String insertSql = "INSERT INTO attendance (code, work_day, work_time, pay) VALUES (?, ?, ?, ?)";
                                    pstmt = conn.prepareStatement(insertSql);
                                    pstmt.setInt(1, code3);
                                    pstmt.setInt(2, workDay);
                                    pstmt.setInt(3, worktime);
                                    pstmt.setInt(4, pay);
                                    pstmt.executeUpdate();
                                    pstmt.close();
                                }

                                // 데이터 조회
                                String sql = "SELECT * FROM attendance";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                                while (rs.next()) {
                                    int index = rs.getInt("index");
                                    int code2 = rs.getInt("code");
                                    int workDay = rs.getInt("work_day");
                                    int worktime = rs.getInt("work_time");
                                    int pay = rs.getInt("pay");
                            %>
                            <tr>
                                <td><%= index %></td>
                                <td><%= code2 %></td>
                                <td><%= workDay %></td>
                                <td><%= worktime %>시간</td>
                                <td><%= pay %></td>
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

<script>
document.addEventListener('DOMContentLoaded', function() {
    const workDaySelect = document.getElementById('work_day');
    const workTimeSelect = document.getElementById('work_time');
    const payInput = document.getElementById('pay');
    const timepayInput = document.getElementById('timepay');

    function calculatePay() {
        const workDay = parseInt(workDaySelect.value, 10);
        const workTime = parseInt(workTimeSelect.value, 10);
        const timepay = parseInt(timepayInput.value, 10);
        
        if (!isNaN(workDay) && !isNaN(workTime) && !isNaN(timepay)) {
            const pay = workDay * workTime * timepay;
            payInput.value = pay;
        } else {
            payInput.value = '';
        }
    }

    workDaySelect.addEventListener('change', calculatePay);
    workTimeSelect.addEventListener('change', calculatePay);
});

function getTimePay() {
    var code = parseInt(document.getElementById('code').value);
    
    if (!isNaN(code)) {
        // AJAX를 통해 서버로 code 값을 전송하여 timepay를 가져옴
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    // 받은 response를 hidden input 필드에 설정하고 calculatePay 호출
                    document.getElementById('timepay').value = xhr.responseText;
                    calculatePay();
                } else {
                    console.error('Request failed:', xhr.statusText);
                }
            }
        };
        xhr.open('GET', 'get_timepay.jsp?code=' + code, true);
        xhr.send();
    }
}
</script>

<%@ include file="footer.jsp" %>
<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>