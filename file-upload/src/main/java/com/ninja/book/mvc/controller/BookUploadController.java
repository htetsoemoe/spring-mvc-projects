package com.ninja.book.mvc.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ninja.book.root.dto.service.FileUploadService;

@Controller
@RequestMapping("upload")
public class BookUploadController {
	
	@Autowired
	private FileUploadService service;
	
	@PostMapping
	String upload(@RequestParam("uploadFile") MultipartFile partFile, 
				  RedirectAttributes redirectAttribute) throws IOException {
		
		if (null != partFile && !partFile.isEmpty()) {
			var message = service.upload(partFile.getInputStream());
			redirectAttribute.addFlashAttribute("uploadMessage", message);
			return "redirect:/home";
		}
		
		return "home";
	}

}
