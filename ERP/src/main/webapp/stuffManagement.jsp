<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                <h4 class="m-0 font-weight-bold text-primary">물류 입력</h4>
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
                           Connection con = null;
                           ResultSet rs = null;
                           PreparedStatement pstmt = null;
                           try {
                           con = conn; // connection.jsp에서 conn 객체를 가져옴
                           if (con == null) {
                           throw new Exception("데이터베이스 연결 실패!");
                           }
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
                           
                            String checkSql = "SELECT * FROM stuff WHERE code=? AND date=? AND life=?";
                            PreparedStatement checkStmt = con.prepareStatement(checkSql);
                            checkStmt.setInt(1, code);
                            checkStmt.setDate(2, Date.valueOf(date));
                            checkStmt.setDate(3, Date.valueOf(life));
                            ResultSet checkRs = checkStmt.executeQuery();

                            if (checkRs.next()) {
                                // 이미 있는 제품인 경우
                                // 수량만 업데이트
                                String updateSqlStuff = "UPDATE stuff SET count=count+? WHERE code=? AND date=? AND life=?";
                                PreparedStatement updateStmtStuff = con.prepareStatement(updateSqlStuff);
                                updateStmtStuff.setInt(1, count);
                                updateStmtStuff.setInt(2, code);
                                updateStmtStuff.setDate(3, Date.valueOf(date));
                                updateStmtStuff.setDate(4, Date.valueOf(life));
                                updateStmtStuff.executeUpdate();
                                updateStmtStuff.close(); // PreparedStatement 닫기
                            } else {
                                // 새로운 제품으로 추가
                                String insertSqlStuff = "INSERT INTO stuff (code, name, company, date, life, standard, cost, count, origin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                                PreparedStatement insertStmtStuff = con.prepareStatement(insertSqlStuff);
                                insertStmtStuff.setInt(1, code);
                                insertStmtStuff.setString(2, name);
                                insertStmtStuff.setString(3, company);
                                insertStmtStuff.setDate(4, Date.valueOf(date));
                                insertStmtStuff.setDate(5, Date.valueOf(life));
                                insertStmtStuff.setString(6, standard);
                                insertStmtStuff.setInt(7, cost);
                                insertStmtStuff.setInt(8, count);
                                insertStmtStuff.setString(9, origin);
                                insertStmtStuff.executeUpdate();
                                insertStmtStuff.close(); // PreparedStatement 닫기
                            }

                            checkRs.close(); // ResultSet 닫기
                            checkStmt.close(); // PreparedStatement 닫기


                                    
                                    // 동일 제품 코드 확인 (sinventory)
                                    String checkSqlSinventory = "SELECT code FROM sinventory WHERE code=?";
                                    PreparedStatement checkStmtSinventory = con.prepareStatement(checkSqlSinventory);
                                    checkStmtSinventory.setInt(1, code);
                                    ResultSet checkRsSinventory = checkStmtSinventory.executeQuery();
                                    if (checkRsSinventory.next()) {
                                        // 이미 있는 제품이면 수량만 업데이트
                                        String updateSqlSinventory = "UPDATE sinventory SET count=count+? WHERE code=?";
                                        PreparedStatement updateStmtSinventory = con.prepareStatement(updateSqlSinventory);
                                        updateStmtSinventory.setInt(1, count);
                                        updateStmtSinventory.setInt(2, code);
                                        updateStmtSinventory.executeUpdate();
                                    } else {
                                        // 새로운 제품 등록
                                        String insertSqlSinventory = "INSERT INTO sinventory (code, name, cost) VALUES (?, ?, ?)";
                                        PreparedStatement pstmtSinventory = con.prepareStatement(insertSqlSinventory);
                                        pstmtSinventory.setInt(1, code);
                                        pstmtSinventory.setString(2, name);
                                        pstmtSinventory.setInt(3, cost);
                                        pstmtSinventory.executeUpdate();
                                    }
                                    checkRsSinventory.close();
                                    checkStmtSinventory.close();

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
                                } // while 루프 닫기
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
                                </div>
                                </div>
                                </body>
                                </html>
