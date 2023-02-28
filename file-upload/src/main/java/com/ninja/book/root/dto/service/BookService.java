package com.ninja.book.root.dto.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.ninja.book.root.dto.Book;

@Service
public class BookService {
	
	@Autowired
	private SimpleJdbcInsert bookInsert;
	
	@Autowired
	private SimpleJdbcInsert categoryInsert;
	
	@Autowired
	private NamedParameterJdbcTemplate template;
	
	private RowMapper<Book> rowMapper;
	
	public static final String SELECT = """
			select b.id, b.title, b.author, b.price, b.remark,
			c.id categoryId, c.name categoryName from book b
			join category c on c.id = b.category_id 
			where 1 = 1
			""";

	public List<Book> search(Integer category, String keyword) {
		StringBuffer sb = new StringBuffer(SELECT);
		Map<String, Object> params = new HashMap<String, Object>();
		
		if (null != category) {
			sb.append(" and c.id = :categoryId");
			params.put("categoryId", category);
		}
		
		if (StringUtils.hasLength(keyword)) {
			sb.append("""
					 and (
					 	lower(b.title) like :keyword
					 	or lower(b.author) like :keyword
					 	or lower(c.name) like :keyword
					 )""");
			params.put("keyword", keyword.toLowerCase().concat("%"));
		}
		
		return template.query(sb.toString(), params, rowMapper);
	}
	
	
	public Optional<Book> findById(Integer id) {
		return template.queryForStream(SELECT.concat(" and b.id = :id"), 
				Map.of("id", id), 
				rowMapper).findFirst();
	}


	public int save(Book book) {
		// TODO Auto-generated method stub
		return 0;
	}

}
