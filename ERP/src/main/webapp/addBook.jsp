<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/
bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
<div class="container py-4">
    <%@ include file="menu.jsp" %>
    <a href="./index.jsp" class="d-fles align-items-center text-dark
   text-decoration-none">
<svg  width="32" height="32" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
   <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
   <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
   </svg>
      <span class="fs-4">Home</span>
   </a>
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
       <div class="container-fluid py-5">
          <h1 class="display-5 fw-bold">도서 등록</h1>
          <p class="col-md-8 fs-4">Book Addition</p>
       </div>
    </div>
    
    <div class="row align-items-md-stretch">
       <form name="newBook" action="./processAddBook.jsp" method="post">
          <div class="mb-3 row">
             <label class="col-sm-2">도서코드</label>
             <div class="col-sm-3">
                <input type="text" id="bookId" class="form-control">
             </div>
          </div>
          <div class="mb-3 row">
             <label class="col-sm-2">도서명</label>
             <div class="col-sm-3">
                <input type="text" id="name" class="form-control">
             </div>
          </div>
          <div class="mb-3 row">
             <label class="col-sm-2">가격</label>
             <div class="col-sm-3">
                <input type="text" id="unitPrice" class="form-control">
             </div>
          </div>
          <div class="mb-3 row">
             <label class="col-sm-2">저자</label>
             <div class="col-sm-3">
                <input type="text" name="author" class="form-control">
             </div>
          </div>
          <div class="mb-3 row">
                <label class="col-sm-2">출판사</label>
                <div class="col-sm-3">
                   <input type="text" name="publisher" class="form-control">
                </div>
          </div> 
          <div class="mb-3 row">
             <label class="col-sm-2">출판일</label>
             <div class="col-sm-3">
                <input type="text" name="releaseDate" class="form-control">
             </div>
          </div>
          
          <div class="mb-3 row">
             <label class="col-sm-2">상세정보</label>
             <div class="col-sm-5">
                <textarea name="description" id="description" cols="50" rows="2"
                class="form-control" placeholder="100자 이상 적어주세요"></textarea>
             </div>
          </div>
          <div class="mb-3 row">
             <label class="col-sm-2">분류</label>
             <div class="col-sm-3">
                <input type="text" name="category" class="form-control">
             </div>
          </div>
          <div class="mb-3 row">
             <label class="col-sm-2">재고수</label>
             <div class="col-sm-3">
                <input type="text" id="unitsInStock" class="form-control">
             </div>
          </div>
          <div class="mb-3 row">
             <label class="col-sm-2">상태</label>
             <div class="col-sm-5">
                <input type="radio" name="condition" value="New"> 신규도서
                <input type="radio" name="condition" value="Old"> 중고도서
                <input type="radio" name="condition" value="EBook"> E-Book
             </div>
          </div>
          <div class="mb-3 row">
             <div class="col-sm-offset-2 col-sm-10">
                <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddBook()">
             </div>
          </div>      
       </form>
    </div>
    <div class="row align-items-md-stretch">
    	<div class="text-end">
    	<a herf="?language=ko">Korean</a>|<a herf="?language=en">English</a>
    		<a href="logout.jsp" class="btn btn-success pull right">logout</a>
    	</div>
    	<form name="newBook" action="./processAddBook.jsp" method="post" enctype="multipart/form-data"></form>
    </div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>