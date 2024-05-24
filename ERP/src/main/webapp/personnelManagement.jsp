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
    <!-- 메뉴 부분을 menu.jsp로부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>

    <div class="container-fluid" style="margin: 0 auto; width: 80%;">
        <div class="card shadow mb-1">
            <div class="card-header py-3">
                <h4 class="m-0 font-weight-bold text-primary">인사 등록</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="container">
                        <form method="post" action="personnel_insert.jsp">
                            <table class="table table-bordered" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>부서이름</th>
                                        <th>총 급여</th>
                                        <th>직책이름</th>
                                        <th>입사일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="code" size="20"></td>
                                        <td>
                                            <select name="department">
                                                <option value="1">인사</option>
                                                <option value="2">영업</option>
                                                <option value="3">물류</option>
                                                <option value="4">생산</option>
                                            </select>
                                        </td>
                                        
                                        <td><input type="text" name="total" size="20"></td>
                                        <td>
                                            <select name="position">
                                                <option value="1">사장</option>
                                                <option value="2">부사장</option>
                                                <option value="3">부장</option>
                                                <option value="4">차장</option>
                                                <option value="5">과장</option>
                                                <option value="6">대리</option>
                                                <option value="7">사원</option>
                                                <option value="8">인턴</option>
                                            </select>
                                        </td>
                                        <td><input type="date" name="startdate" size="6"></td>
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
                                // 데이터베이스 연결
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
                                        int date = rs.getInt("date");
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