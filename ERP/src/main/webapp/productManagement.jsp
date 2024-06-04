<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산품 등록</title>
</head>
<body>
    <!-- 메뉴 부분을 menu.jsp로부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>
<div class="container" style="margin: 0 auto;">
    <div class="card shadow mb-1">
        <div class="card-header py-3">
            <h4 class="m-0 font-weight-bold text-primary">생산품 등록</h4>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <div class="container">
                    <form method="post" action="<%= request.getRequestURI() %>">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>상품 코드</th>
                                    <th>상품명</th>
                                    <th>일자</th>
                                    <th>수량</th>
                                    <th>생산가</th>
                                    <th>유통기한</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" name="code" size="20"></td>
                                    <td><input type="text" name="name" size="20"></td>
                                    <td><input type="date" name="date" size="6"></td>
                                    <td><input type="text" name="count" size="20"></td>
                                    <td><input type="text" name="cost" size="20"></td>
                                    <td><input type="date" name="life" size="6"></td>
                                    <td><input type="submit" value="등록"></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
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
                                    <th>상품 코드</th>
                                    <th>상품명</th>
                                    <th>일자</th>                                    
                                    <th>생산가</th>
                                    <th>수량</th>
                                    <th>유통기한</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                Connection con = null;
                                ResultSet rs = null;
                                PreparedStatement pstmt = null;
                                try {
                                    con = conn;
                                    if (con == null) {
                                        throw new Exception("데이터베이스 연결 실패!");
                                    }

                                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                                        int code = Integer.parseInt(request.getParameter("code"));
                                        String name = request.getParameter("name");
                                        String date = request.getParameter("date");
                                        String life = request.getParameter("life");
                                        int count = Integer.parseInt(request.getParameter("count"));
                                        int cost = Integer.parseInt(request.getParameter("cost"));

                                        // 동일 제품 코드 확인
                                        String checkSql = "SELECT * FROM product WHERE code=? AND date=? AND life=?";
                                        PreparedStatement checkStmt = con.prepareStatement(checkSql);
                                        checkStmt.setInt(1, code);
                                        checkStmt.setDate(2, Date.valueOf(date));
                                        checkStmt.setDate(3, Date.valueOf(life));
                                        ResultSet checkRs = checkStmt.executeQuery();
                                        if (checkRs.next()) {
                                            // 이미 있는 제품이면 수량만 업데이트
                                            String updateSqlProduct = "UPDATE product SET count=count+? WHERE code=? AND date=? AND life=?";
                                            PreparedStatement updateStmtProduct = con.prepareStatement(updateSqlProduct);
                                            updateStmtProduct.setInt(1, count);
                                            updateStmtProduct.setInt(2, code);
                                            updateStmtProduct.setDate(3, Date.valueOf(date));
                                            updateStmtProduct.setDate(4, Date.valueOf(life));
                                            updateStmtProduct.executeUpdate();
                                            updateStmtProduct.close();
                                        } else {
                                            // 새로운 제품 등록
                                            String insertSqlProduct = "INSERT INTO product (code, name, date, count, cost, life) VALUES (?, ?, ?, ?, ?, ?)";
                                            PreparedStatement insertStmtProduct = con.prepareStatement(insertSqlProduct);
                                            insertStmtProduct.setInt(1, code);
                                            insertStmtProduct.setString(2, name);
                                            insertStmtProduct.setDate(3, Date.valueOf(date));
                                            insertStmtProduct.setInt(4, count);
                                            insertStmtProduct.setInt(5, cost);
                                            insertStmtProduct.setDate(6, Date.valueOf(life));
                                            insertStmtProduct.executeUpdate();
                                            insertStmtProduct.close();
                                        }

                                        checkRs.close(); // ResultSet 닫기
                                        checkStmt.close(); // PreparedStatement 닫기

                                        // 동일 제품 코드 확인 (pinventory)
                                        String checkSqlPinventory = "SELECT code FROM pinventory WHERE code=?";
                                        PreparedStatement checkStmtPinventory = con.prepareStatement(checkSqlPinventory);
                                        checkStmtPinventory.setInt(1, code);
                                        ResultSet checkRsPinventory = checkStmtPinventory.executeQuery();
                                        if (checkRsPinventory.next()) {
                                            // 이미 있는 제품이면 수량만 업데이트
                                            String updateSqlPinventory = "UPDATE pinventory SET count=count+? WHERE code=?";
                                            PreparedStatement updateStmtPinventory = con.prepareStatement(updateSqlPinventory);
                                            updateStmtPinventory.setInt(1, count);
                                            updateStmtPinventory.setInt(2, code);
                                            updateStmtPinventory.executeUpdate();
                                            updateStmtPinventory.close();
                                        } else {
                                            // 새로운 제품 등록
                                            String insertSqlPinventory = "INSERT INTO pinventory (code, name, cost) VALUES (?, ?, ?)";
                                            PreparedStatement pstmtPinventory = con.prepareStatement(insertSqlPinventory);
                                            pstmtPinventory.setInt(1, code);
                                            pstmtPinventory.setString(2, name);
                                            pstmtPinventory.setInt(3, cost);
                                            pstmtPinventory.executeUpdate();
                                            pstmtPinventory.close();
                                        }
                                        checkRsPinventory.close();
                                        checkStmtPinventory.close();

                                        // 재료 수량 업데이트
                                        String[][] ingredients = {
                                            {"딸기 빙수", "딸기", "10"},
                                            {"요거딸기 빙수", "요거트", "20"},
                                            {"요거딸기 빙수", "딸기", "10"},
                                            {"망고 빙수", "망고", "20"},
                                            {"초코 빙수", "초코시럽", "30"},
                                            {"초코 빙수", "초코칩", "20"},
                                            {"오레오 초코 빙수", "오레오 쿠키", "40"},
                                            {"오레오 초코 빙수", "초코시럽", "30"},
                                            {"민트초코 빙수", "민트 시럽", "15"},
                                            {"민트초코 빙수", "초코칩", "20"},
                                            {"그린티 빙수", "녹차 가루", "10"},
                                            {"그린티 초코 빙수", "녹차 가루", "10"},
                                            {"그린티 초코 빙수", "초코시럽", "30"},
                                            {"인절미 빙수", "인절미", "60"},
                                            {"인절미 빙수", "콩가루", "30"},
                                            {"찰떡 빙수", "찰떡", "40"},
                                            {"멜론 빙수", "멜론", "65"},
                                            {"요거멜론 빙수", "멜론", "65"},
                                            {"요거멜론 빙수", "요거트", "20"}
                                        };

                                        for (String[] ingredient : ingredients) {
                                            if (ingredient[0].equals(name)) {
                                                String updateSql = "UPDATE sinventory SET count = count - ? WHERE name = ?";
                                                PreparedStatement updateStmt = con.prepareStatement(updateSql);
                                                updateStmt.setInt(1, Integer.parseInt(ingredient[2]));
                                                updateStmt.setString(2, ingredient[1]);
                                                updateStmt.executeUpdate();
                                                updateStmt.close();
                                            }
                                        }
                                    }

                                    String sql = "SELECT * FROM product ORDER BY `index` ASC";
                                    pstmt = conn.prepareStatement(sql);
                                    rs = pstmt.executeQuery();
                                    while (rs.next()) {
                                        int productCode = rs.getInt("code");
                                        String productName = rs.getString("name");
                                        Date productDate = rs.getDate("date");
                                        int productCost = rs.getInt("cost");
                                        int productCount = rs.getInt("count");
                                        Date productLife = rs.getDate("life");
                                %>
                                <tr>
                                    <td><%= productCode %></td>
                                    <td><%= productName %></td>
                                    <td><%= productDate %></td>
                                    <td><%= productCost %></td>
                                    <td><%= productCount %></td>
                                    <td><%= productLife %></td>
                                </tr>
                                <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
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