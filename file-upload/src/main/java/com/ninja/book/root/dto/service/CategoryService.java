package com.ninja.book.root.dto.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import com.ninja.book.root.dto.Category;

@Service
public class CategoryService {
	
	@Autowired
	private NamedParameterJdbcTemplate template;
	@Autowired
	private SimpleJdbcInsert insert;
	
	private RowMapper<Category> rowMapper;
	
	@PostConstruct
	public void init() {
		insert.setCatalogName("books_db");
		insert.setTableName("category");
		insert.setGeneratedKeyName("id");
	}
	
	public CategoryService() {
		rowMapper =  new BeanPropertyRowMapper<>(Category.class);
	}

	public List<Category> findAll() {
		return template.query("select * from category order by name", rowMapper);
	}
	
	public Optional<Category> findById(int id) {
		return template.queryForStream("select * from category where id = :id", Map.of("id", id), rowMapper).findFirst();
	}

	public Category getCategory(String name) {
		var searchResult = template.queryForStream("select * from category where name = :name", Map.of("name", name), rowMapper)
								.findFirst();
		
		// If there is no category, insert as new category
		return searchResult.orElseGet(() -> {
			var id = insert.executeAndReturnKey(Map.of("name", name)).intValue();
			return new Category(id, name);
		});
	}

}
