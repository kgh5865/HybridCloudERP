<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>

<div class="container pt-4">
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
			<h1 class="display-5 fw-bold">도서목록</h1>
			<p class="col-md-8 fs-4">BookList<br> 2019225104 고민수</p>
			<a href="./index.jsp" class="col-md-8 btn-link">홈페이지</a>
   			<a href="./addBook.jsp" class="col-md-8 btn-link"> 도서등록</a>
		</div>
	</div>
	<%
    	BookRepository dao=BookRepository.getInstance();
    	ArrayList<Book> listOfBooks=dao.getAllBooks();
 	%>
	
	<div class="row align-items-md-stretch text-center">
		<%
			for(int i=0; i<listOfBooks.size(); i++){
				Book book=listOfBooks.get(i);
		%>
		<div class="col-md-4">
			<div class="h-100 p-2">
				<h5><b><%=book.getName() %></b></h5>
				<p><%=book.getAuthor() %>
				<br><%=book.getPublisher() %> | <%=book.getUnitPrice() %>원
				<p><%=book.getDescription().substring(0,60) %>...
				<p><%=book.getUnitPrice() %>원
				<p> <a href="./book.jsp?id=<%=book.getBookId() %>"
				class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>				
			</div>
		</div>
		<%
			}
		%>
	</div>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>