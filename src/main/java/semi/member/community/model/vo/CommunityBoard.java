package semi.member.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CommunityBoard {
	
	private int boardNo;
	private int communityNo;
	private String communityName;
	private String boardName;
	private String boardTitle;
	private String boardContent;
	private String memberNo; 
	private String memberNickname;
	private String profileImage;
	private String createDate;
	private int readCount;
	private String image0;
	private String image1;
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getCommunityName() {
		return communityName;
	}
	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	
}
