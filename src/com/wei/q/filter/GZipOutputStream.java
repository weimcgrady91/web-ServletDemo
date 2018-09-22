package com.wei.q.filter;

import javax.servlet.ServletOutputStream;
import javax.servlet.WriteListener;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

public class GZipOutputStream extends ServletOutputStream {
    private GZIPOutputStream gzipOutputStream;
    private ByteArrayOutputStream byteArrayOutputStream;
    private HttpServletResponse response;

    public GZipOutputStream(HttpServletResponse response) throws IOException {
        this.response = response;
        byteArrayOutputStream = new ByteArrayOutputStream();
        gzipOutputStream = new GZIPOutputStream(byteArrayOutputStream);
    }

    public void close() throws IOException{
        gzipOutputStream.finish();
        byte[] content = byteArrayOutputStream.toByteArray();
        response.addHeader("Content-Encoding","gzip");
        response.addHeader("Content-Length",Integer.toString(content.length));
        ServletOutputStream out = response.getOutputStream();
        out.write(content);
        out.close();
    }

    public void flush() throws IOException{
        gzipOutputStream.flush();
    }


    public void write(byte[] b,int off,int len) throws IOException{
        gzipOutputStream.write(b,off,len);
    }
    @Override
    public void write(int b) throws IOException {
        gzipOutputStream.write(b);
    }

    @Override
    public boolean isReady() {
        return false;
    }

    @Override
    public void setWriteListener(WriteListener writeListener) {

    }
}
