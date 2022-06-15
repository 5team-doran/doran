DROP TABLE "MEMBER";

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_ID"	VARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	VARCHAR2(100)		NOT NULL,
	"MEMBER_NM"	VARCHAR2(20)		NOT NULL,
	"MEMBER_GENDER"	CHAR(1)		NOT NULL,
	"MEMBER_BIRTH"	DATE		NOT NULL,
	"MEMBER_PHONE"	VARCHAR2(20)		NOT NULL,
	"MEMBER_NICK"	VARCHAR2(20)		NOT NULL,
	"SECESSION_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"PROFILE_IMG"	VARCHAR2(500)		NULL,
	"MEMBER_LIVE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호(시퀀스)';

COMMENT ON COLUMN "MEMBER"."MEMBER_ID" IS '회원 이메일(아이디)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NM" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_GENDER" IS '회원 성별';

COMMENT ON COLUMN "MEMBER"."MEMBER_BIRTH" IS '회원 생년월일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PHONE" IS '회원 휴대폰번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICK" IS '회원 닉네임';

COMMENT ON COLUMN "MEMBER"."SECESSION_FL" IS '탈퇴여부(Y:탈퇴, N:미탈퇴)';

COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '회원 프로필 이미지';

COMMENT ON COLUMN "MEMBER"."MEMBER_LIVE" IS '회원 지역';

DROP TABLE "BOARD";

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(150)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"BOARD_CD"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"COMMUNITY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."CREATE_DT" IS '작성일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_ST" IS '게시글 상태(정상N, 삭제Y)';

COMMENT ON COLUMN "BOARD"."BOARD_CD" IS '게시판 코드';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '게시글 작성자';

COMMENT ON COLUMN "BOARD"."COMMUNITY_NO" IS '모임 번호';

DROP TABLE "COMMUNITY";

CREATE TABLE "COMMUNITY" (
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"COMMUNITY_NM"	VARCHAR2(50)		NOT NULL,
	"COMMUNITY_IMG"	VARCHAR2(500)		NULL,
	"COMMUNITY_INFO"	VARCHAR2(1000)		NOT NULL,
	"COMMUNITY_AREA"	VARCHAR2(200)		NOT NULL,
	"COMMUNITY_ADMIN"	NUMBER		NOT NULL,
	"COMMUNITY_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"COMMUNITY_NOTICE"	VARCHAR2(4000)		NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_NO" IS '모임 번호';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_NM" IS '모임명';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_IMG" IS '모임 이미지';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_INFO" IS '모임소개';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_AREA" IS '모임 지역';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_ADMIN" IS '회원 번호(시퀀스)';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_FL" IS '모임 상태(Y:모임삭제, N:모임유지)';

COMMENT ON COLUMN "COMMUNITY"."COMMUNITY_NOTICE" IS '모임 내 공지사항';

COMMENT ON COLUMN "COMMUNITY"."CATEGORY_NO" IS '카테고리 번호';

DROP TABLE "BOARD_TYPE";

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CD"	NUMBER		NOT NULL,
	"BOARD_NM"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CD" IS '게시판 코드';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NM" IS '게시판 이름';

DROP TABLE "BOARD_IMG";

CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_LEVEL"	NUMBER		NOT NULL,
	"IMG_NM"	VARCHAR2(500)		NOT NULL,
	"IMG_ORIGINAL"	VARCHAR2(500)		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "BOARD_IMG"."IMG_LEVEL" IS '이미지 위치';

COMMENT ON COLUMN "BOARD_IMG"."IMG_NM" IS '이미지 이름';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL" IS '이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글 번호';

DROP TABLE "REPLY";

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"REPLY_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "REPLY"."REPLY_ST" IS '댓글 상태(정상N, 삭제Y)';

COMMENT ON COLUMN "REPLY"."CREATE_DT" IS '댓글 작성일';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "REPLY"."MEMBER_NO" IS '댓글 작성자';

DROP TABLE "REPORT";


CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REPORT_TITLE"	VARCHAR2(100)		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_NO2"	NUMBER		NULL,
	"COMMUNITY_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';

COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고일';

COMMENT ON COLUMN "REPORT"."REPORT_TITLE" IS '신고사유';

COMMENT ON COLUMN "REPORT"."MEMBER_NO" IS '신고한 회원번호';

COMMENT ON COLUMN "REPORT"."MEMBER_NO2" IS '신고받은 회원번호';

COMMENT ON COLUMN "REPORT"."COMMUNITY_NO" IS '신고받은 모임번호';

DROP TABLE "NOTICE";

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_CD"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(150)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"NOTICE_ST"	CHAR(1)	DEFAULT N	NOT NULL,
	"MEMBER_NO"	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항 번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_CD" IS '공지사항 코드';

COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '공지사항 제목';

COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '공지사항 내용';

COMMENT ON COLUMN "NOTICE"."CREATE_DT" IS '작성일';

COMMENT ON COLUMN "NOTICE"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "NOTICE"."NOTICE_ST" IS '공지사항 상태(정상N, 삭제Y)';

COMMENT ON COLUMN "NOTICE"."MEMBER_NO" IS '관리자(0)';

DROP TABLE "PICK";

CREATE TABLE "PICK" (
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PICK"."COMMUNITY_NO" IS '모임 번호';

COMMENT ON COLUMN "PICK"."MEMBER_NO" IS '회원 번호(시퀀스)';

DROP TABLE "NOTICE_TYPE";

CREATE TABLE "NOTICE_TYPE" (
	"NOTICE_CD"	NUMBER		NOT NULL,
	"NOTICE_NM"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "NOTICE_TYPE"."NOTICE_CD" IS '공지사항 코드';

COMMENT ON COLUMN "NOTICE_TYPE"."NOTICE_NM" IS '공지사항 이름';

DROP TABLE "NOTICE_IMG";

CREATE TABLE "NOTICE_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_LEVEL"	NUMBER		NOT NULL,
	"IMG_NM"	VARCHAR2(500)		NOT NULL,
	"IMG_ORIGINAL"	VARCHAR2(500)		NOT NULL,
	"NOTICE_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "NOTICE_IMG"."IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "NOTICE_IMG"."IMG_LEVEL" IS '이미지 위치';

COMMENT ON COLUMN "NOTICE_IMG"."IMG_NM" IS '이미지 이름';

COMMENT ON COLUMN "NOTICE_IMG"."IMG_ORIGINAL" IS '이미지 원본명';

COMMENT ON COLUMN "NOTICE_IMG"."NOTICE_NO" IS '공지사항 번호';

DROP TABLE "COMMUNITY_MEMBER";

CREATE TABLE "COMMUNITY_MEMBER" (
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "COMMUNITY_MEMBER"."COMMUNITY_NO" IS '모임 번호';

COMMENT ON COLUMN "COMMUNITY_MEMBER"."MEMBER_NO" IS '회원 번호(시퀀스)';

COMMENT ON COLUMN "COMMUNITY_MEMBER"."MEMBER_FL" IS '모임 탈퇴여부((Y:탈퇴, N:미탈퇴)';

DROP TABLE "PICK_CATEGORY";

CREATE TABLE "PICK_CATEGORY" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PICK_CATEGORY"."MEMBER_NO" IS '회원 번호(시퀀스)';

COMMENT ON COLUMN "PICK_CATEGORY"."CATEGORY_NO" IS '카테고리 번호';

DROP TABLE "CATEGORY";

CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_NM"	VARCHAR2(50)		NOT NULL,
	"CATEGORY_IMG"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '카테고리 번호';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NM" IS '카테고리명';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_IMG" IS '카테고리 이미지';

DROP TABLE "SIGNUP";

CREATE TABLE "SIGNUP" (
	"SIGNUP_NO"	NUMBER		NOT NULL,
	"COMMUNITY_NO"	NUMBER		NOT NULL,
	"SIGNUP_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"SIGNUP_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SIGNUP"."SIGNUP_NO" IS '글 번호';

COMMENT ON COLUMN "SIGNUP"."COMMUNITY_NO" IS '모임 번호';

COMMENT ON COLUMN "SIGNUP"."SIGNUP_CONTENT" IS '글 내용';

COMMENT ON COLUMN "SIGNUP"."SIGNUP_ST" IS '글 상태(정상N, 삭제Y)';

COMMENT ON COLUMN "SIGNUP"."CREATE_DT" IS '글 작성일';

COMMENT ON COLUMN "SIGNUP"."MEMBER_NO" IS '회원 번호(시퀀스)';

DROP TABLE "APPLY";

CREATE TABLE "APPLY" (
	"APPLY_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"APPLY_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"COMMUNITY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "APPLY"."APPLY_NO" IS '모임신청번호';

COMMENT ON COLUMN "APPLY"."MEMBER_NO" IS '회원 번호(시퀀스)';

COMMENT ON COLUMN "APPLY"."APPLY_FL" IS '승인여부(Y:거절, N:승인)';

COMMENT ON COLUMN "APPLY"."COMMUNITY_NO" IS '모임 번호';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "COMMUNITY" ADD CONSTRAINT "PK_COMMUNITY" PRIMARY KEY (
	"COMMUNITY_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_CD"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
	"IMG_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "NOTICE_TYPE" ADD CONSTRAINT "PK_NOTICE_TYPE" PRIMARY KEY (
	"NOTICE_CD"
);

ALTER TABLE "NOTICE_IMG" ADD CONSTRAINT "PK_NOTICE_IMG" PRIMARY KEY (
	"IMG_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "SIGNUP" ADD CONSTRAINT "PK_SIGNUP" PRIMARY KEY (
	"SIGNUP_NO"
);

ALTER TABLE "APPLY" ADD CONSTRAINT "PK_APPLY" PRIMARY KEY (
	"APPLY_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_BOARD_TYPE_TO_BOARD_1" FOREIGN KEY (
	"BOARD_CD"
)
REFERENCES "BOARD_TYPE" (
	"BOARD_CD"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_COMMUNITY_TO_BOARD_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "COMMUNITY" ADD CONSTRAINT "FK_MEMBER_TO_COMMUNITY_1" FOREIGN KEY (
	"COMMUNITY_ADMIN"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "COMMUNITY" ADD CONSTRAINT "FK_CATEGORY_TO_COMMUNITY_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARD_TO_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_2" FOREIGN KEY (
	"MEMBER_NO2"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_COMMUNITY_TO_REPORT_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_NOTICE_TYPE_TO_NOTICE_1" FOREIGN KEY (
	"NOTICE_CD"
)
REFERENCES "NOTICE_TYPE" (
	"NOTICE_CD"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_MEMBER_TO_NOTICE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "PICK" ADD CONSTRAINT "FK_COMMUNITY_TO_PICK_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "PICK" ADD CONSTRAINT "FK_MEMBER_TO_PICK_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "NOTICE_IMG" ADD CONSTRAINT "FK_NOTICE_TO_NOTICE_IMG_1" FOREIGN KEY (
	"NOTICE_NO"
)
REFERENCES "NOTICE" (
	"NOTICE_NO"
);

ALTER TABLE "COMMUNITY_MEMBER" ADD CONSTRAINT "FK_COMMUNITY_TO_COMMUNITY_MEMBER_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "COMMUNITY_MEMBER" ADD CONSTRAINT "FK_MEMBER_TO_COMMUNITY_MEMBER_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "PICK_CATEGORY" ADD CONSTRAINT "FK_MEMBER_TO_PICK_CATEGORY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "PICK_CATEGORY" ADD CONSTRAINT "FK_CATEGORY_TO_PICK_CATEGORY_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "SIGNUP" ADD CONSTRAINT "FK_COMMUNITY_TO_SIGNUP_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "COMMUNITY" (
	"COMMUNITY_NO"
);

ALTER TABLE "SIGNUP" ADD CONSTRAINT "FK_MEMBER_TO_SIGNUP_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "APPLY" ADD CONSTRAINT "FK_MEMBER_TO_APPLY_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "APPLY" ADD CONSTRAINT "FK_COMMUNITY_TO_APPLY_1" FOREIGN KEY (
	"COMMUNITY_NO"
)
REFERENCES "COMMUNITY" (
	"COMMUNITY_NO"
);

