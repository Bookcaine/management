<%@page import="com.bookcaine.web.entity.Review"%>
<%@page import="com.bookcaine.web.service.ReviewService"%>
<%@page import="com.bookcaine.web.entity.Book"%>
<%@page import="com.bookcaine.web.service.BookService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id_ = request.getParameter("id");
	int id = Integer.parseInt(id_);

	BookService bookService = new BookService();
	Book book = bookService.get(id);
	
	ReviewService reviewService = new ReviewService();
	List<Review> list = reviewService.getList(id);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookDetail</title>
    <link rel="stylesheet" href="../css/detail.css">
    <link rel="stylesheet" href="../header/header.css">
</head>

<body>
    <header id="header">
        <div class="float-content">
            <h1 class="logo"><a href="../index.jsp"><div class="logo-1">책에 중독되는 순간</div> Bookcaine</a></h1>
            <section>
                <h1 class="d-none">헤더</h1>
                <!-- <nav id="user">
                    <ul>
                        <li><a href="sign_up/Main_Sign_Up.html"><input class="button" type="button" value="회원가입"></a></li>
                        <li><a href="login/login.html"><input class="button" type="button" value="로그인"></a></li>
                    </ul>
                </nav> -->

                <section class="book-search-form">
                    <h1 class="d-none">도서검색폼</h1>
                    <form action="">
                        <legend class="d-none">도서 검색 필드</legend>
                        <input class="form-input" type="text" name="search" placeholder="제목,저자,출판사 검색">
                        <input class="button" type="submit" value="검색">
                    </form>
                </section>
    
                <nav class="quick-menu">
                    <h1 class="d-none">퀵메뉴</h1>
                    <ul>
                        <li><a href="../index.jsp">홈</a></li>
                        <li><a href="">도전방</a></li>
                        <li><a href="../profile/profile.html">프로필</a></li>
                    </ul>
                </nav>
            </section>
        </div>
    </header>
    
    <main>
        <section id="book-image">
            <h1 class="d-none">book-image</h1>
            <img src="../images/book<%=id %>.jpg" alt="">
        </section>
        <hr class="temp-hr">

        <section id="book-description">
            <h1 class="d-none">책 설명</h1>
            <div id="book-name"><%=book.getTitle() %></div>
            <div id="writer"><%=book.getAuthor() %></div>
        </section>
        <hr class="temp-hr">

        <div id="wish" class="btn">
            <input type="button" value="+ 읽고 싶어요">
        </div>
        
        <div id="write" class="btn">
            <a href="reviewReg.jsp?id=<%=request.getParameter("id")%>"><input type="button" value="리뷰를 남겨보세요!"></a>
        </div>

        <br>

        <section id="review">
        	<article>
            <h1>리뷰</h1>
            	<%for(int i=0; i<list.size(); i++){ %>
            	<div class=review>
	            	<article>
	                    <div class="reviewer"><%=list.get(i).getNickname() %></div>
	                    	<p><%=list.get(i).getContent() %></p>
	                        <div class="review-attr">
	                        	<span>좋아요 0</span>
	                        	<span>댓글 0</span>
	                        </div>
	                <hr>
	                <div class="review-btn-group">
	                	<input id="like-button" type="button" value="좋아요">
	                	<a href="#">댓글</a>
	                </div>
	                </article>
                </div>
                <%} %>
                </article>
                
        </section>

        <section id="friends">
            <h1>친구의 서평</h1>
            <ul>
                <li>
                    <div class="reviewer">김민수</div>
                    <article>너무 재밌어요~</article>
                </li>
            </ul>
        </section>

        <div id="for-bottom-btn">
        </div>

        <section id="challenge">
            <div>
                <input type="button" value="도전하기">
            </div>
        </section>
    </main>
</body>

</html>