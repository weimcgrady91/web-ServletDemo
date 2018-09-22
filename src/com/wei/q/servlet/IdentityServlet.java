package com.wei.q.servlet;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class IdentityServlet extends HttpServlet {

    public static final char[] CHARS = {'2', '3', 'A', 'B', 'D', '4', 'O'};
    public static Random random = new Random();

    public String getRandomString() {
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            stringBuilder.append(CHARS[random.nextInt(CHARS.length)]);
        }
        return stringBuilder.toString();
    }

    public static Color getRandomColor() {
        return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
    }

    public static Color getReverseColor(Color color) {
        return new Color(255 - color.getRed(), 255 - color.getGreen(), 255 - color.getBlue());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        String randomString = getRandomString();
        req.getSession(true).setAttribute("randomString", randomString);

        int width = 100;
        int height = 30;
        Color color = getRandomColor();
        Color reverseColor = getReverseColor(color);
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = bi.createGraphics();
        g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
        g.setColor(color);
        g.fillRect(0, 0, width, height);
        g.setColor(reverseColor);
        g.drawString(randomString, 19, 20);
        for (int i = 0, n = random.nextInt(100); i < n; i++) {
            g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
        }
        ServletOutputStream out = resp.getOutputStream();
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        encoder.encode(bi);
        out.flush();
    }
}
