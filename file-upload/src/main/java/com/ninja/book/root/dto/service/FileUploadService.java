package com.ninja.book.root.dto.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.ninja.book.root.dto.Book;
import com.ninja.book.root.dto.Category;

@Service
public class FileUploadService {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BookService bookService;
	@Autowired
	private Validator validator;
	
	@Transactional
	public String upload(MultipartFile file) {
		var uploadBooks = readLines(file);
		
		var categoryBooksMap = uploadBooks.stream()
				.collect(Collectors.groupingBy(a -> a.getCategory().getName()));
		
		for(var entry : categoryBooksMap.entrySet()) {
			var category = categoryService.getCategory(entry.getKey());
			
			for(var book : entry.getValue()) {
				book.setCategory(category);
				
				// validation for book fields
				var result = new BeanPropertyBindingResult(book, "target");
				validator.validate(book, result);
				
				if (result.hasErrors()) { // there is error in book validation, throw FileUploadAppException
					var message = result.getAllErrors().stream()
							.map(a -> a.getDefaultMessage()).findAny().get();
					throw new FileUploadAppException(message);
				}
				
				bookService.save(book);
			}
		}
		
		return "%d books have been uploaded!".formatted(uploadBooks.size());
	}
	
	public List<Book> readLines(MultipartFile file) {
		List<Book> list = new ArrayList<Book>();
		
		try(var reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
			
			String line = null;
			
			while(null != (line = reader.readLine())) {
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
		book.setCategory(new Category(array[2].trim()));
		book.setPrice(Integer.parseInt(array[3].trim()));
		
		if (array.length > 4) {
			book.setRemark(array[4].trim());
		}
		
		return book;
	}
	
	

}
