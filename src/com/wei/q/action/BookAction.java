package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;
import com.wei.q.domain.Book;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.List;

public class BookAction extends ActionSupport {
    public static List<Book> books = new ArrayList<>();
    static {
        books.add(new Book("w1","w1"));
        books.add(new Book("w1","w2"));
        books.add(new Book("w1","w3"));
        books.add(new Book("w1","w4"));
    }
    private String title;
    private Book book;

    private int age = 20;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    public String initAdd() {
        return "initAdd";
    }

    public String add() {
        books.add(book);
        title = "<br/><br/>添加书籍成功<br/><br/>";
        return "success";
    }

    public String list() {
        title = "<br/><br/>书籍列表<br/><br/>";
        ServletActionContext.getRequest().setAttribute("bookList",getBooks());
        return "list";
    }

    public String clear() {
        books.clear();
        title = "<br/><br/>清空书籍列表成功<br/><br/>";
        return "clear";
    }

    public static List<Book> getBooks() {
        return books;
    }

    public static void setBooks(List<Book> books) {
        BookAction.books = books;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}
