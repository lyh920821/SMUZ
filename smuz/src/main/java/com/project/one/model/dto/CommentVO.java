package com.project.one.model.dto;

public class CommentVO {

	private int cm_id;
	private String cm_user;
	private int cm_board_id;
	private String cm_content;
	private String cm_date;
	
	
	public int getCm_id() {
		return cm_id;
	}
	public void setCm_id(int cm_id) {
		this.cm_id = cm_id;
	}
	public String getCm_user() {
		return cm_user;
	}
	public void setCm_user(String cm_user) {
		this.cm_user = cm_user;
	}
	public int getCm_board_id() {
		return cm_board_id;
	}
	public void setCm_board_id(int cm_board_id) {
		this.cm_board_id = cm_board_id;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	} 
   
	
	
}