package com.swt.dto;

import java.util.Date;

public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	private int replycnt;
	private int goodcnt;
	private Date regdate;
	private String filename;
	private int filesize;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int bno, String title, String content, String writer, int viewcnt, int replycnt, int goodcnt,
			Date regdate, String filename, int filesize) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.viewcnt = viewcnt;
		this.replycnt = replycnt;
		this.goodcnt = goodcnt;
		this.regdate = regdate;
		this.filename = filename;
		this.filesize = filesize;
	}
	

	public BoardDTO(String title, String content, String writer) {
		super();
		
		this.title = title;
		this.content = content;
		this.writer = writer;
	}

	public BoardDTO(int bno, String title, String content, String writer) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	

	public BoardDTO(String title, String content, String writer, String filename, int filesize) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.filename = filename;
		this.filesize = filesize;
	}
	
	

	public BoardDTO(int bno, String title, String content, String writer, String filename, int filesize) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.filename = filename;
		this.filesize = filesize;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public int getGoodcnt() {
		return goodcnt;
	}

	public void setGoodcnt(int goodcnt) {
		this.goodcnt = goodcnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", viewcnt=" + viewcnt + ", replycnt=" + replycnt + ", goodcnt=" + goodcnt + ", regdate=" + regdate
				+ ", filename=" + filename + ", filesize=" + filesize + "]";
	}
	
	
	
}
