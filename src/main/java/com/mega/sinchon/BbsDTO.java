package com.mega.sinchon;

import java.sql.Timestamp;

public class BbsDTO {

	int bbsNum;
	String storeNum;
	String content;
	String writer;
	String score;
	Timestamp time;
	public int getBbsNum() {
		return bbsNum;
	}
	public void setBbsNum(int bbsNum) {
		this.bbsNum = bbsNum;
	}
	public String getStoreNum() {
		return storeNum;
	}
	public void setStoreNum(String storeNum) {
		this.storeNum = storeNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
}
