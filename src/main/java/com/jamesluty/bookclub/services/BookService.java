package com.jamesluty.bookclub.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jamesluty.bookclub.models.Book;
import com.jamesluty.bookclub.repos.BookRepo;

@Service
public class BookService {
	
	@Autowired
	private BookRepo bookRepo;

//	Create and update
	public Book saveBook(Book book) {
		return bookRepo.save(book);
	}
	
//	Read
	public List<Book> getAllBooks(){
		return bookRepo.findAll();
	}
	
	public List<Book> getAllAvailable(){
		return bookRepo.findByBorrowTrue();
	}
	
	public List<Book> getAllBorrowed(){
		return bookRepo.findByBorrowFalse();
	}
	
	public Book getBook(Long id) {
		return bookRepo.findById(id).orElse(null);
	}
	
//	Delete
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
