package sample2.bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Comment {
	private int id;
	private int boardId;
	private String comment;
	private String memberId;
	private String memberName;
	private Timestamp inserted;

	public String getTimeAgo() {
		long now = System.currentTimeMillis();
		long inserted = this.inserted.getTime();
		long diff = (now - inserted) / 1000;
		String msg = "";
		if (diff < 60) {
			msg = diff + "초 전";
		} else if ((diff /= 60) < 60) {
			msg = diff + "분 전";
		} else if ((diff /= 60) < 24) {
			msg = diff + "시간 전";
		} else if ((diff /= 24) < 30) {
			msg = diff + "일 전";
		} else {
			msg = new SimpleDateFormat("yy/MM/dd").format(this.inserted);
		}
		return msg;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public Timestamp getInserted() {
		return inserted;
	}

	public void setInserted(Timestamp inserted) {
		this.inserted = inserted;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String string) {
		// TODO Auto-generated method stub

	}

}
