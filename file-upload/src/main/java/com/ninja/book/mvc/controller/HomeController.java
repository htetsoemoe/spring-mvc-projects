package com.ninja.book.mvc.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ninja.book.root.dto.Book;
import com.ninja.book.root.dto.service.BookService;

@Controller
@RequestMapping({
	"/home", "/book"
})
public class HomeController {
	
	@Autowired
	private BookService service;

	@GetMapping
	String index(@RequestParam(required = false) Integer category,
				@RequestParam(required = false) String keyword,
				ModelMap map ) {
		// search books with request parameters
		var list = service.search(category, keyword);
		
		// add search list to add 'ModelMap'
		map.put("list", list);
		
		return "home";
	}
	
	@GetMapping("/edit")
	String edit() {
		return "book-edit";
	}
	
	@GetMapping("/details")
	String details() {
		return "book-details";
	}
	
	@PostMapping
	String save(@Validated @ModelAttribute Book book,
				BindingResult result,
				RedirectAttributes redirect) {
		
		if (result.hasErrors()) {
			return "book-edit";
		}
		
		int id = service.save(book);
		redirect.addAttribute("id", id); // add id to redirect
		
		return "redirect:/book/details";
	}
	
	@ModelAttribute("book")
	Book book(@RequestParam Optional<Integer> id) {
		return id.flatMap(idNum -> service.findById(idNum)).orElse(new Book());
	}
}
