package com.wei.q.domain;

import java.util.Date;

public class Book {
    private String name;
    private String author;
    private Date publishedDate;

    public Book() {}
    public Book(String name, String author) {
        this.name = name;
        this.author = author;
        this.publishedDate = new Date();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }

    @Override
    public String toString() {
        return "Book{" +
                "name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", publishedDate=" + publishedDate +
                '}';
    }
}
