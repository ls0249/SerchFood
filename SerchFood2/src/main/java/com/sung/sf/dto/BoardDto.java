package com.sung.sf.dto;

public class BoardDto {
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getDate_auto() {
		return date_auto;
	}
	public void setDate_auto(String date_auto) {
		this.date_auto = date_auto;
	}
	public String getUser_auto() {
		return user_auto;
	}
	public void setUser_auto(String user_auto) {
		this.user_auto = user_auto;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	private int seq;
	private String date_auto;
	private String user_auto;
	private String title;
	private String contents;
	
}
