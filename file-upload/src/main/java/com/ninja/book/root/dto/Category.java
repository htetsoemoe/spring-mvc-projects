package com.ninja.book.root.dto;

import lombok.Data;

@Data
public class Category {
	
	private int id;
	private String name;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}
	
	public Category(String name) {
		super();
		this.name = name;
	}

	public Category(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}	
}
