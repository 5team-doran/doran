<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <c:set var="pagination" value="${map.pagination}" />
        <c:set var="boardList" value="${map.boardList}" />

        <!-- 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도란도란</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/boardList-style.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class="board">

        <section class="board-content">

            <div class="board-post">

                <ul class="post"></ul>
                <li class="list">
                    <div class="doran">
                        <div class="cover">
                            <img src="/images/category.JPG" width="110px" height="110px">
                        </div>
                        <div class="doran-block">
                            <p class="doranLocation">${board.communityArea}</p><br>
                            <a href="#" class="doranName">${board.communityName}</a><br>
                            <a href="#" class="categoryName">${board.categoryName}</a><br>
                            <span class="peopleCount">${board.communityMember}</span> <span class="likeCount">${board.Pick}</span>

                        </div>
                    </div>
                </li>



                </ul>
            </div> -->

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>모임 찾기</title>

            <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
            <link rel="stylesheet" href="${contextPath}/resources/css/boardList-style.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <section class="board">
                <div class="create"><a href="#"><i class="fas fa-plus-circle"></i> 모임 만들기</a></div>
                <section class="board-content">
                    <div class="board-post">

                        <ul class="post">

                            <c:choose>
                            <c:when test="${empty boardList}">

                                <tr>
                                    <th colspan="1">게시글이 존재하지 않습니다.</th>
                                </tr>
                            </c:when>

                            <c:otherwise>

                                <c:forEach var="board" items="${boardList}">
                                    <li class="list">
                                        <div class="doran">
                                            <div class="cover">
                                                <img src="/images/category.JPG" width="110px" height="110px">
                                            </div>
                                            <div class="doran-block">
                                                <p class="doranLocation"><i class="fal fa-map-marker-alt"></i> ${board.communityArea}</p><br>
                                                <a href="#" class="doranName">${board.communityName}</a><br>
                                                <a href="#" class="categoryName">${board.categoryName}</a><br>
                                                <span class="peopleCount"><i class="fal fa-user"></i> ${board.communityMember}</span> <span class="likeCount"><i class="fas fa-heart"></i> ${board.pick}</span>
        
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>


                        </ul>
                    </div>

                </section>

                <div class="pagination-area">
                    <c:set var="url" value="list?cp="/>

                
                <ul class="pagination">
                    <!-- 첫 페이지로 이동 -->
                    <li><a href="${url}1${sURL}">&lt;&lt;</a></li>

                    <!-- 이전 목록 마지막 번호로 이동 -->
                    <li><a href="${url}${pagination.prevPage}${sURL}">&lt;</a></li>

                    <!-- 범위가 정해진 일반 for문 사용 -->
                    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                        <c:choose>
                            <c:when test="${i == pagination.currentPage}">
                                <li><a class="current">${i}</a></li>
                            </c:when>

                            <c:otherwise>
                                <li><a href="${url}${i}${sURL}">${i}</a></li>        
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                    
                    <!-- 다음 목록 시작 번호로 이동 -->
                    <li><a href="${url}${pagination.nextPage}${sURL}">&gt;</a></li>

                    <!-- 끝 페이지로 이동 -->
                    <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

                </ul>
                </div>
            </section>

        </body>

        </html>