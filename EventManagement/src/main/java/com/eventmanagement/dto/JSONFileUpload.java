package com.eventmanagement.dto;

import java.io.Serializable;

public class JSONFileUpload implements Serializable{
	private String path;

	public JSONFileUpload(String path) {
		super();
		this.path = path;
	}

	public JSONFileUpload() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
}
