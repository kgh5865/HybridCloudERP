<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 추가된 폰트 스타일 -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: gray; /* 배경색을 다크그레이로 설정 */
            color: white; /* 텍스트 색상을 흰색으로 설정 */
        }

        .container {
            font-family: 'Montserrat', sans-serif;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Pacifico', cursive;
        }

        /* 네트워크 장비 폰트 스타일 */
        .offcanvas-title,
        .network-title {
            font-family: 'Roboto', sans-serif;
            font-weight: bold;
            font-size: 24px;
            color: #212529;
        }

        /* 이미지를 가운데 정렬하기 위한 스타일 */
        .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면의 높이에 따라 조정 가능 */
        }

        .image-block {
            width: 250px; /* 이미지의 너비를 설정합니다. */
            height: 350px; /* 이미지의 높이를 설정합니다. */
            cursor: pointer; /* 클릭 가능함을 나타내는 커서를 지정합니다. */
        }
    </style>
</head>
<body>
<div class="container py-4">
    <!-- 네비게이션 바 -->
    <header class="pb-3 mb-4 border-bottom text-center">
        <a href="./index.jsp" class="d-flex align-items-center text-dark text-decoration-none justify-content-center">
            <h1 class="fs-4 text-center">
                <span class="bi bi-laptop fs-4 me-1"></span>
                <span class="network-title">ERP</span> <!-- 네트워크 제품 제목 -->
                
            </h1>
        </a>

        <div class="d-flex align-items-center justify-content-between">
            <!-- 목록 버튼 -->
            <div>
                <button class="btn btn-outline-dark me-3" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                    <span class="bi bi-router fs-4 me-1"></span> <!-- 네트워크 장비 아이콘 -->
                    목록
                </button>
            </div>
            <div class="me-auto">
                <span class="fs-4"></span>                
            </div>
            <div>
                <button class="btn btn-dark" type="button" onclick="window.location.href = './Login.jsp'">Login</button>
                <button class="btn btn-dark" type="button" onclick="window.location.href = './signUp.jsp'">Sign up</button>
            </div>
        </div>
    </header>

    <!-- Offcanvas 목록 -->
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">목록</h5>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="list-group">
                <li class="list-group-item"><a href="books.jsp" class="text-decoration-none">인사</a></li>
                <li class="list-group-item"><a href="books.jsp" class="text-decoration-none">물류/생산</a></li>
                <li class="list-group-item"><a href="books.jsp" class="text-decoration-none">영업</a></li>
            </ul>
        </div>
    </div>

    <!-- 메인 컨텐츠 -->
    
    <%! String greeting="ERP";
        String tagline="";
    %>
    <div class="p-5 mb-4 bg-body-tertiary rounded-3 text-dark">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold"><%=greeting %></h1>
            <p class="col-md-8 fs-4"></p>
            
        </div>
    </div>

    <div class="row align-items-md-stretch  text-center">
        <div class="col-md-12">
            <div class="h-100 p-5">
                <h3 class="text-dark"><%=tagline %></h3>
            </div>
        </div>
    </div>

    <!-- 푸터 -->
   <footer class="pt-3 mt-4 text-body-secondary border-top">
			<P>

		</footer>
		
</div>

<!-- 부트스트랩 자바스크립트 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
