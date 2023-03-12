package com.ninja.book.root.dto.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ninja.book.root.dto.Book;

@Service
public class FileUploadService {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BookService bookService;
	
	public String upload(InputStream inputStream) {
		var list = readLines(inputStream);
		
		for(var book : list) {
			bookService.save(book);
		}
		
		return "Upload OK!";
	}
	
	public List<Book> readLines(InputStream inputStream) {
		List<Book> list = new ArrayList<Book>();
		
		try(var reader = new BufferedReader(new InputStreamReader(inputStream))) {
			
			String line = null;
			
			while(line != (line = reader.readLine())) {
				var book = readBook(line);
				list.add(book);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		return list;
	}
	
	// map from line to book
	private Book readBook(String line) {
		//System.out.println(line);
		var array = line.split("\t");
		
		if (array.length < 4 && array.length > 5) {
			return null;
		}
		
		var book = new Book();
		book.setTitle(array[0].trim());
		book.setAuthor(array[1].trim());
		book.setCategory(categoryService.getCategory(array[2].trim()));
		book.setPrice(Integer.parseInt(array[3].trim()));
		book.setRemark(array[4].trim());
		
		return book;
	}
	
	

}
