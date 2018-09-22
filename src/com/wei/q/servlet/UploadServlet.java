package com.wei.q.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = "";
        PrintWriter out = resp.getWriter();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");

        List<FileItem> itemList = null;
        try {
            itemList = upload.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        for (FileItem fileItem : itemList) {
            if (fileItem.isFormField()) {
                if (fileItem.getFieldName().equals("description")) {
                    description = fileItem.getString("utf-8");
                    out.println("文件描述:" + description);
                }
            } else {
//                if ("file".equals(item.getFieldName())) {
//                    File remoteFile = new File(item.getName());
//                    out.println("便利到file1...<br/>");
//                    out.println("客户端文件位置:" + remoteFile.getAbsolutePath() + "<br/>");
//                }
                String fileName = fileItem.getFieldName();
                String name = fileItem.getName();
                String contentType = fileItem.getContentType();
                System.out.println("--------------上传信息 start-----------");
                System.out.println("fileName=" + fileName);
                System.out.println("name=" + name);
                System.out.println("contentType=" + contentType);
                System.out.println("--------------上传信息 end-------------");
                File remoteFile = new File(name);
                System.out.println("客户端文件位置:" + remoteFile.getAbsolutePath() + "<br/>");
                File newFile = new File(getServletContext().getRealPath("attachment"), name);
                newFile.getParentFile().mkdirs();
                try {
                    newFile.createNewFile();
                    byte[] buffer = new byte[1024];
                    InputStream inputStream = fileItem.getInputStream();
                    FileOutputStream outputStream = new FileOutputStream(newFile);
                    int len = 0;
                    while ((len = inputStream.read(buffer)) > -1) {
                        outputStream.write(buffer, 0, len);
                    }
                    outputStream.flush();
                    outputStream.close();
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                System.out.println("文件已经保存+" + newFile.getAbsolutePath());
            }
        }
    }
}
