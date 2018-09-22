package com.wei.q.filter;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

public class GZipResponseWrapper extends HttpServletResponseWrapper {
    private HttpServletResponse response;
    private GZipOutputStream gZipOutputStream;
    private PrintWriter printWriter;

    public GZipResponseWrapper(HttpServletResponse response) {
        super(response);
        this.response = response;
    }

    @Override
    public PrintWriter getWriter() throws IOException {
        if (printWriter == null) {
            printWriter = new PrintWriter(new OutputStreamWriter(new GZipOutputStream(response), "utf-8"));
        }
        return printWriter;
    }

    @Override
    public ServletOutputStream getOutputStream() throws IOException {
        if (gZipOutputStream == null) {
            gZipOutputStream = new GZipOutputStream(response);
        }
        return gZipOutputStream;
    }

    @Override
    public void setContentLength(int len) {

    }

    @Override
    public void flushBuffer() throws IOException {
        gZipOutputStream.flush();
    }

    public void finishResponse() throws IOException {
        if (gZipOutputStream != null) {
            gZipOutputStream.close();
        }
        if (printWriter != null) {
            printWriter.close();
        }
    }
}
