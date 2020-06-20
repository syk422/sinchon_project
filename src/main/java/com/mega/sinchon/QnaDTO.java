package com.mega.sinchon;

public class QnaDTO {
	private int qnaNum, storeNum;
	private String content, writer, date;

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public int getStoreNum() {
		return storeNum;
	}

	public void setStoreNum(int storeNum) {
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "QnaDTO [qnaNum=" + qnaNum + ", storeNum=" + storeNum + ", content=" + content + ", writer=" + writer
				+ ", date=" + date + "]";
	}
}