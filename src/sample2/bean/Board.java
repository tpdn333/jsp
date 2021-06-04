package sample2.bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Board {
	private int id;
	private String title;
	private String body;
	private String memberId;
	private Timestamp inserted;

	public String getTimeAgo() {
		long now = System.currentTimeMillis();
		long inserted = this.inserted.getTime();
		long diff = (now - inserted) / 1000;
		String msg = "";
		if(diff < 60) {
			msg = diff + "초 전";
		} else if((diff /= 60) < 60) {
			msg = diff + "분 전";
		} else if((diff /= 60) < 24) {
			msg = diff + "시간 전";
		} else if((diff /= 24) < 30) {
			msg = diff + "일 전";
		} else {
			msg = new SimpleDateFormat("yy/MM/dd").format(this.inserted);
		}
		return msg;
	}
	public String getMemberIdHidden() {
		String star = "";
		for(int i = 0; i < this.memberId.length() - 2; i ++) {
			star += "*";
		}
		return memberId.substring(0,2) + star;
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

	public Timestamp getInserted() {
		return inserted;
	}

	public void setInserted(Timestamp inserted) {
		this.inserted = inserted;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
}
