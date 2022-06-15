<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${comm.communityName}</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member-community.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board-signup.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/board-list.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    
</head>
<body>

    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <div class="board-container">
        
            <form class="community-head">
                <div class="head-left">
                    <!-- 이미지가 없을때 기본이미지로 추가하기 -->
                    <img src="${contextPath}${comm.communityImage}">
                </div>
                <div class="head-right">
                    <div class="head-title">
                        <div class="community-name">
                            <span>${comm.communityName}</span>
                            <c:if test="${comm.communityAdmin eq 'Y'}">
                                <a href="/src/main/webapp/WEB-INF/views/community/meeting-admin.jsp"><span class="btn-edit">edit</span></a>
                            </c:if>
                        </div>
                        <div><button class="btn-report">신고</button></div>
                    </div>

                    <div class="head-info">
                        <p>${comm.communityInfo}</p>
                    </div>

                    <div class="head-user">
                        <div>
                            <c:if test="${empty comm.profileImage}">
                                <img src="${contextPath}/resources/images/user.png" id="user">
                            </c:if>
                            
                            <c:if test="${!empty comm.profileImage}">
                                <img src="${contextPath}${comm.profileImage}" id="user">
                            </c:if>
                        </div>
                        
                        <div>${comm.memberNickname}</div>

                    </div>

                    <div class="head-join">
                        <div onclick="pick()">
                            <img src="${contextPath}/resources/images/pick1.png" id="pick" >
                        </div>
                        <div class="btn-join" id="btn-join">모임 가입하기</div>
                    </div>
                    <div id="btn-leave">모임 탈퇴하기</div>
                </div>
            </form>

            <div class="community-nav">
                <ul>
                    <li><a href="#board-detail">공지사항</a></li>
                    <span>|</span>
                    <li><a href="#board-signup">가입인사</a></li>
                    <span>|</span>
                    <li><a href="#board-community">자유게시판</a></li>
                    <span>|</span>
                    <li><a href="#board-review">정모후기</a></li>
                </ul>
            </div>
            
            <section class="community-content">
            
                <!-- 모임 상세정보(모임장 작성) -->
                <div class="board board-detail" id="board-detail">
                    <h3>공지사항
                 
                    <%--
                    <c:if test="${comm.communityAdmin eq 'Y'}">
                        <a href="#" id="detail-Popup">edit</a>
                    </c:if>
                    --%>

                    <!-- 공지사항으로 테이블명 수정 필요함 -->
                    <div class="board-detail-txt">
                        ${comm.communityNotice}
                    </div>

                </div>

                <!-- 가입인사 -->
                <div class="board board-signup" id="board-signup">
                    <h3>가입인사
                        <a href="${contextPath}/community/signup/list?cn=${param.cn}" target="_blank"><span class="board-all">전체 가입인사 보기 &gt;</span></a>
                    </h3>

                    <!-- 가입인사 연결 -->
                    <jsp:include page="/WEB-INF/views/community/commu-signup.jsp"/>
                    
                </div>


                <!-- 자유게시판 -->
                <div class="board board-list" id="board-list">
                    <h3>자유게시판
                        <a href="${contextPath}/community/board/list?cn=${param.cn}&type=1" target="_blank"><span class="board-all">전체 게시글 보기 &gt;</span></a>
                    </h3>
                    <!-- 자유게시판 연결 -->
                    <jsp:include page="/WEB-INF/views/community/commu-board.jsp"/>
                </div>



                <!-- 모임 후기 -->
                <div class="board board-review" id="board-review">
                    <h3>모임후기
                        <a href="${contextPath}/community/board/review?cn=${param.cn}&type=2" target="_blank"><span class="board-all">전체 후기 보기 &gt;</span></a>
                    </h3>  

                    <!-- 모임게시판 연결 -->
                    <jsp:include page="/WEB-INF/views/community/commu-review.jsp"/>
                    
                </div>

                <!-- 공지 수정 팝업 -->
                <div class="detail_popup_layer" id="detail_popup_layer" style="display: none;">
                    <div class="detail_popup_box">
                        <div style="height: 10px; width: 375px; float: top;">
                            <!-- <a href="closePop();" class="popUp-close" width="30px" height="30px"></a> -->
                        </div>

                        <div class="detail_popup_cont">
                            <h4>모임 공지사항 수정하기</h4>
                            </div>
                            <textarea type="text" id="detailUpdate" name="detailUpdate" placeholder="수정할 내용을 입력해주세요."></textarea>
                            <div class="detail_popup_button">
                                <a href="#" id="detail-cancelBtn">취소</a>
                                <a href="#" id="detail-updateBtn">수정</a>
                            </div>
                        </div>                    
                    </div>

                <!-- 정모 수정 팝업 -->
                <div class="event_popup_layer" id="event_popup_layer" style="display: none;">
                    <div class="event_popup_box">
                        <div style="height: 10px; width: 375px; float: top;">
                            <!-- <a href="closePop();" class="popUp-close" width="30px" height="30px"></a> -->
                        </div>

                        <div class="event_popup_cont">
                            <h4>정모 일시 및 장소 등록하기</h4>
                        </div>
                        <div class="schedule-input-area">
                            <img src="../resources/images/clock_icon.png" id="clock">
                            <input type="date" id="groupTime-1" name="groupTime">
                            <input type="time" name="time" id="time-1"></input> <br>
                        </div>
        
                        <div class="schedule-input-area">
                            <input type="date" id="groupTime-2" name="groupTime">
                            <input type="time" name="time" id="time-2"></input> <br>
                        </div>
        
                        <div class="schedule-input-area">
                            <span class="schedule-message confirm">일정 : ${cgt.communityDate}</span>
                        </div>
        
                        <div class="schedule-input-area">
                            <img src="../resources/images/map_icon.png" id="map"> <br>
                            <input type="text" id="groupArea" placeholder="위치를 입력해주세요">
                        </div>
        
                        <div class="schedule-input-area">
                            <span>위치 : 서울특별시 중구 남대문로1가 19</span>
                        </div>
        
                        <div class="schedule-input-area">
                            <label for="limitedPeople">제한인원 : </label>
                            <input type="text" id="limitedPeople" name="limitedPeople" placeholder="인원 수를 입력해주세요">
                        </div>
        
                        <div class="schedule-input-area-exp">
                            <label for="scheduleExp">일정설명 : </label>
                            <textarea type="text" id="scheduleExp" name="scheduleExp" placeholder="내용을 입력해주세요." ></textarea>
                        </div>
                        <div class="event_popup_button">
                            <a href="#" id="detail-cancelBtn">취소</a>
                            <a href="#" id="detail-updateBtn">수정</a>
                        </div>
                    </div>                    
                </div>
            </section>
        </div>
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="${contextPath}/resources/js/community/member-community.js"></script>
    
</body>
</html>