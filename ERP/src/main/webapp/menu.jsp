<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* 메뉴 항목에 마우스를 올렸을 때의 스타일 */
    .navbar-nav .nav-link:hover {
        border-bottom: 5px solid #007bff; /* 파란색 막대 */
        padding-bottom: 5px; /* 막대와 텍스트 사이의 간격 */
    }
    
    /* 마우스를 올리면 하위 메뉴가 보이게 하는 스타일 */
    .navbar-nav .nav-item.dropdown:hover .dropdown-menu {
        display: block;
    }
    
    /* Menu 항목 주변 간격 조정 */
    .nav-item.mx-auto .navbar-nav {
        margin-top: 20px !important; /* 위쪽 간격 */
        margin-bottom: 20px !important; /* 아래쪽 간격 */
    }
    
    .nav-mainmenu {
    margin-left: 200px !important;
    margin-right: 200px !important;
   }
   
   /* 메뉴 글자 크기 조정 */
    .navbar-nav .nav-link {
        font-size: 20px; /* 원하는 글자 크기로 조정 */
    }
    
    /* 메뉴 항목 간의 간격 조정 */
        .navbar-nav .nav-item {
            margin-right: 20px; /* 원하는 간격으로 조정 */
        }

        /* 마지막 메뉴 항목의 오른쪽 간격 제거 */
        .navbar-nav .nav-item:last-child {
            margin-right: 0;
        }
       
    .navbar-brand {
       font-size: 30px; /* 원하는 글자 크기로 조정 */
       color: white !important;
    }
    
    /* 메뉴 바의 배경색을 파란색으로 설정 */
.navbar {
    background-color: #0099ff !important; /* Bootstrap의 파란색 */
}
/* 메뉴 항목의 글자색을 밝은 색으로 변경 */
.navbar-light .navbar-nav .nav-link {
    color: white !important;
}
    
    /* 드롭다운 메뉴의  글자 조정 */
    .navbar-light .navbar-nav .nav-item.dropdown .dropdown-menu .dropdown-item {
    font-size: 18px; /* 원하는 글자 크기로 조정 */
}

/* 로그인 사용자 박스 스타일 */
    .user-box {
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 5px 15px;
        background-color: #f8f9fa;
        color: #007bff;
        margin-top: 5px;
        margin-bottom: 5px;
        font-size: 19px; /* 원하는 글자 크기로 조정 */
        color: black;
    }
    
    .nav-item-custom-margin {
    margin-left: 100px; /* 오른쪽에 원하는 마진 값을 설정 */
}

</style>
<script>
function checkAccess(d_num, required_d_num, required_p_num) {
    if (d_num !== required_d_num || required_p_num>2) {
        alert("접근 권한이 없습니다.");
        return false; // 링크를 따라가지 않도록 false 반환
    }
    return true; // 링크를 따라가도록 true 반환
}
</script>
</head>
<body>
<%
   // 로그인 세션
   String user_id = (String)session.getAttribute("id");
   Integer d_num = (Integer)session.getAttribute("d_num"); // Integer로 직접 캐스팅
   Integer p_num = (Integer)session.getAttribute("p_num");
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
            <ul class="navbar-nav nav-item-custom-margin">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="productionDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        생산
                    </a>
                    <div class="dropdown-menu" aria-labelledby="productionDropdown">
                        <a class="dropdown-item" href="./productManagement.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 4, <%=p_num%>);">생산 입력</a>
                        <a class="dropdown-item" href="./productStatus.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 4, <%=p_num%>);">생산물품 관리</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="logisticsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        물류
                    </a>
                    <div class="dropdown-menu" aria-labelledby="logisticsDropdown">
                        <a class="dropdown-item" href="./stuffManagement.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 3, <%=p_num%>);">물류 입력</a>
                        <a class="dropdown-item" href="./stuffStatus.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 3, <%=p_num%>);">물류 관리</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="personnelDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        인사
                    </a>
                    <div class="dropdown-menu" aria-labelledby="personnelDropdown">
                        <a class="dropdown-item" href="./personnelManagement.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 1, <%=p_num%>);">인사 등록</a>
                        <a class="dropdown-item" href="attendance.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 1, <%=p_num%>);">근태 등록</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="salesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        영업
                    </a>
                    <div class="dropdown-menu" aria-labelledby="salesDropdown">
                        <a class="dropdown-item" href='./salesManagement.jsp' onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 2, <%=p_num%>);">거래 관리</a>
                        <a class="dropdown-item" href="./salesStatus.jsp" onclick="return checkAccess(<%= d_num != null ? d_num : -1 %>, 2, <%=p_num%>);">영업 현황</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav mx-auto">
                <!-- 메뉴를 여기로 옮깁니다 -->
                <li class="nav-item mx-auto nav-mainmenu">
                    <a class="navbar-brand" href='./index.jsp'>AAA Company</a>
                </li>
                <!-- /메뉴를 여기로 옮깁니다 -->
            </ul>
            <ul class="navbar-nav mr-auto">
                
                <%
               if(user_id != null) { // 로그인
            %>
               <li class="nav-item user-box">
               <%= user_id %> 님
               </li>
               <li class="nav-item">
                       <a class="nav-link" href='index.jsp?logout=1'>로그아웃</a>
                   </li>
            <%
               } else {
               // center에 값이 존재하는 경우에만 로그인 버튼을 띄움.
               // 처리를 안해주고 로그인 버튼을 누를시 LoginForm.jsp로 넘어가면 Top.jsp에 있는 로그인 버튼이 그대로 나옴.
            %>
               <li class="nav-item">
                       <a class="nav-link" href='./Login.jsp'>로그인</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link" href='./signUp.jsp'>회원가입</a>
                   </li>
            <% 
   }
   %>
            </ul>
        </div>
    </nav>
    <!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>