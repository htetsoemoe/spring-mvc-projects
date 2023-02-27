package com.ninja.book.root.dto.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ninja.book.root.dto.Book;

@Service
public class BookService {

	public List<Book> search(Integer category, String keyword) {
		return null;
	}
	
	
	public Optional<Book> findById(Integer id) {
		return null;
	}


	public int save(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}

}
