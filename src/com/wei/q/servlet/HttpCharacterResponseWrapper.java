package com.wei.q.servlet;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class HttpCharacterResponseWrapper extends HttpServletResponseWrapper {
    private CharArrayWriter charArrayWriter = new CharArrayWriter();

    public HttpCharacterResponseWrapper(HttpServletResponse response) {
        super(response);
    }

    public CharArrayWriter getCharArrayWriter() {
        return charArrayWriter;
    }

    @Override
    public PrintWriter getWriter() throws IOException {
        return new PrintWriter(charArrayWriter);
    }
}
