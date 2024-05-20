<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>최신 현황</title>
    <style>
    </style>
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
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>코드</th>
                                    <th>부서 이름</th>
                                    <th>재직일수</th>
                                    <th>총 급여</th>
                                    <th>직책 이름</th>
                                    <th>입사일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Connection con = null;
                                ResultSet rs = null;
                                PreparedStatement pstmt = null;

                                try {
                                   
                                    // 데이터 조회
                                    String sql = "SELECT p.code, d.d_name, p.date, p.total, pos.p_name, p.startdate FROM personnel p JOIN department d ON p.d_num = d.d_num JOIN position pos ON p.p_num = pos.p_num";
                                    pstmt = conn.prepareStatement(sql);
                                    rs = pstmt.executeQuery();
                                    
                                    while (rs.next()) {
                                        int code = rs.getInt("code");
                                        String d_name = rs.getString("d_name");
                                        Date date = rs.getDate("date");
                                        int total = rs.getInt("total");
                                        String p_name = rs.getString("p_name");
                                        Date startdate = rs.getDate("startdate");
                                %>
                                <tr>
                                    <td><%= code %></td>
                                    <td><%= d_name %></td>
                                    <td><%= date %></td>
                                    <td><%= total %></td>
                                    <td><%= p_name %></td>
                                    <td><%= startdate %></td>
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

    <%@ include file="footer.jsp" %>
    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
