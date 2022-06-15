<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:if test="${param.mode == 'insert'}">
            <h2>게시글 작성</h2>
        </c:if>
        <c:if test="${param.mode == 'update'}">
            <h2>게시글 수정</h2>
        </c:if>
    </title>
    <link rel="stylesheet" href="${contextPath}/resources/css/board-write.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <form action="write" enctype="multipart/form-data" method="post" class="board-write" onsubmit="return writeValidate()">

            <div class="board-write">
                <div>
                    <c:if test="${param.mode == 'insert'}">
                        <h2>게시글 작성</h2>
                    </c:if>
                    <c:if test="${param.mode == 'update'}">
                        <h2>게시글 수정</h2>
                    </c:if>
                </div>
                
                <div class="content">
                    <div class="board-title">
                        <h3>제목 : <input type="text" name="boardTitle" placeholder="제목을 입력해주세요." value="${detail.noticeTitle}"></h3> 
                    </div>
                    <div class="board-category">
                        <h3>카테고리 : 
                            <select name="boardCategory" id="boardCategory">
                                <option value="0" selected disabled>카테고리 선택</option>
                                <option value="1">공지사항</option>
                                <option value="2">이벤트</option>
                                <option value="3">당첨자 발표</option>
                            </select>
                        </h3>
                    </div>

                    <!-- 이미지 레벨 변수 생성 -->
                    <c:forEach items="${detail.imageList}" var="noticeImage">
                        <c:choose>
                            <c:when test="${noticeImage.imageLevel == 0}">
                                <c:set var="img0" value="${contextPath}${noticeImage.imageName}" />
                            </c:when>
                            <c:when test="${noticeImage.imageLevel == 1}">
                                <c:set var="img1" value="${contextPath}${noticeImage.imageName}" />
                            </c:when>
                        </c:choose>
                    </c:forEach>

                    <div class="img-input">
                        <h3>첨부파일1 : <input type="file" class="inputImage" id="img0" name="0" accept="image/*"></h3>
                        <h3>첨부파일2 : <input type="file" class="inputImage" id="img1" name="1" accept="image/*"></h3>
                    </div>
                    
                    <div class="img-box">
                        <div class="boardImg thumbnail">
                            <label for="img0">
                                <img class="preview" src="${img0}">
                            </label>
                            <span class="delete-image">&times;</span>
                        </div>
                        <div class="boardImg">
                            <label for="img1">
                                <img class="preview" src="${img1}">
                            </label>
                            <span class="delete-image">&times;</span>
                        </div>
                    </div>

                    <div class="write-area">
                        <textarea maxlength="100" placeholder="내용을 입력해주세요." id="boardContent" name="boardContent">${detail.noticeContent}</textarea>
                    </div>

                    <div class="btn-area">
                        <button type="submit" id="insertBtn">등록</button>

                        <!-- insert 모드 -->
                        <c:if test="${param.mode == 'insert'}">
                            <button type="button" class="goToListBtn" id="goToListBtn" onclick="location.href='${header.referer}'">작성 취소</button>
                        </c:if>
                        
                        <!-- update 모드 -->
                        <c:if test="${param.mode == 'update'}">
                            <button type="button" class="goToListBtn" id="goToListBtn" onclick="location.href='${header.referer}'">수정 취소</button>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- hidden -->
            <input type="hidden" name="mode" value="${param.mode}">
            <input type="hidden" name="type" value="${param.type}">
            <input type="hidden" name="no" value="${param.no}">
            <input type="hidden" name="cp" value="${param.cp}">
            <input type="hidden" name="deleteList" id="deleteList" value="">

        </form>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="${contextPath}/resources/js/admin-page/notice.js"></script>
    <script src="${contextPath}/resources/js/admin-page/notice-write.js"></script>
    
</body>
</html>