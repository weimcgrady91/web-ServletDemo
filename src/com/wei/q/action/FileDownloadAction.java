package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class FileDownloadAction extends ActionSupport {
    private String inputPath;

    public String getInputPath() {
        return inputPath;
    }

    public void setInputPath(String inputPath) {
        this.inputPath = inputPath;
    }

    public InputStream getWho() throws Exception{
        String filePath =ServletActionContext.getServletContext().getRealPath(inputPath);
        System.out.println("download filePath="+filePath);
        return ServletActionContext.getServletContext().getResourceAsStream(inputPath);

//        File file =new File(filePath);
//        FileInputStream fis = new FileInputStream(file);
//        return fis;
    }
}
