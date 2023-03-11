package com.ninja.book.root.dto.service;

import java.io.InputStream;

import org.springframework.stereotype.Service;

@Service
public class FileUploadService {
	
	public String upload(InputStream inputStream) {
		return "Upload OK!";
	}

}
