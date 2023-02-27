package com.ninja.book.mvc.controller.advice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ninja.book.root.dto.Category;
import com.ninja.book.root.dto.service.CategoryService;

@ControllerAdvice
public class CategoryControllerAdvice {
	
	@Autowired
	private CategoryService service;
	
	@ModelAttribute("categories")
	public List<Category> categories() {
		return service.findAll();
	}

}
