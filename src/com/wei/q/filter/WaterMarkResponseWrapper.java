package com.wei.q.filter;

import com.wei.q.util.ImageUtil;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;

public class WaterMarkResponseWrapper extends HttpServletResponseWrapper {
    private String waterMarkFilePath;
    private HttpServletResponse response;
    private WaterMarkOutputStream waterMarkOutputStream = new WaterMarkOutputStream();

    public WaterMarkResponseWrapper(HttpServletResponse response, String waterMarkFilePath) {
        super(response);
        this.response = response;
        this.waterMarkFilePath = waterMarkFilePath;
    }

    @Override
    public ServletOutputStream getOutputStream() throws IOException {
        return waterMarkOutputStream;
    }

    public void flushBuffer() throws IOException {
        waterMarkOutputStream.flush();
    }

    public void finishResponse() throws IOException {
        byte[] imageData = waterMarkOutputStream.getByteArrayOutputStream().toByteArray();
        System.out.println(imageData.length);
        byte[] image = ImageUtil.waterMark(imageData, waterMarkFilePath);
        response.setContentLength(image.length);
        response.getOutputStream().write(image);
        waterMarkOutputStream.close();

    }


}
