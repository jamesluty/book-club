package com.jamesluty.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.jamesluty.bookclub.models.Book;
import com.jamesluty.bookclub.models.User;
import com.jamesluty.bookclub.services.BookService;
import com.jamesluty.bookclub.services.UserService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
//	Display routes
	@GetMapping("/add/book")
	public String addBook(@ModelAttribute("book") Book book, HttpSession session) {
		if(session.getAttribute("uuid") == null) {
			return "redirect:/";
		}
		return "addBook.jsp";
	}
	
	@GetMapping("/book/{id}")
	public String showBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		model.addAttribute("book", bookService.getBook(id));
		if(session.getAttribute("uuid") != null) {
			model.addAttribute("loggedIn", true);
		}
		return "showBook.jsp";
	}
	
	@GetMapping("/edit/book/{id}")
	public String editBook(@PathVariable("id") Long id, Model model) {
		Book book = bookService.getBook(id);
		model.addAttribute("book", book);
		return "editBook.jsp";
	}
	
//	Action routes
	@PostMapping("/create/book")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "addBook.jsp";
		} else {
			User user = userService.getUser((Long) session.getAttribute("uuid"));
			book.setUser(user);
			bookService.saveBook(book);
			return "redirect:/dashboard";
		}
		
	}
	
	@PutMapping("/update/book")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "addBook.jsp";
		} else {
			User user = userService.getUser((Long) session.getAttribute("uuid"));
			book.setUser(user);
			bookService.saveBook(book);
			return "redirect:/book/" + book.getId();
		}
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/dashboard";
	}
	
}