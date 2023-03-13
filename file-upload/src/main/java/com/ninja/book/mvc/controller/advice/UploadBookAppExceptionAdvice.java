package com.ninja.book.mvc.controller.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.ninja.book.root.dto.service.FileUploadAppException;

@ControllerAdvice
public class UploadBookAppExceptionAdvice {
	
	@ExceptionHandler
	public ModelAndView handler(FileUploadAppException e) {
		var model = new ModelAndView("home");
		model.getModel().put("uploadMessage", "Unsuccessful File Upload : %s".formatted(e.getMessage()));
		return model;
	}

}
