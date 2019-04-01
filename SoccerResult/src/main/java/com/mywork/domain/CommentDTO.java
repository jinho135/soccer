package com.mywork.domain;

public class CommentDTO {
	private int cnum;
	private String name;
	private String created;
	private String msg;
	private int bnum;

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

}
