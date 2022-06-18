package com.jamesluty.bookclub.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jamesluty.bookclub.models.Book;

@Repository
public interface BookRepo extends CrudRepository<Book, Long> {

	List<Book> findAll();
}
