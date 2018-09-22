package com.wei.q.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Upload2Action extends ActionSupport {
    private String title;
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private String savePath;
    private String allowTypes;

    public String getAllowTypes() {
        return allowTypes;
    }

    public void setAllowTypes(String allowTypes) {
        this.allowTypes = allowTypes;
    }

    @Override
    public void validate() {
        String filterResult = filterTypes(getAllowTypes().split(","));
        if(filterResult!=null){
            addFieldError("upload","您要上传的文件类型不正确");
        }
    }

    public String filterTypes(String[] types) {
        String fileType = getUploadContentType();
        for(String type: types){
            if(fileType.equals(type)){
                return null;
            }
        }
        return ERROR;
    }

    @Override
    public String execute() throws Exception {
        System.out.println("upload title="+title);
        System.out.println("uploadContentType="+uploadContentType);
        System.out.println("file length="+upload.length());
        ServletContext context = ServletActionContext.getServletContext();
        String realPath = context.getRealPath(getSavePath()+"\\"+getUploadFileName());
        File outFile = new File(realPath);
        if(!outFile.exists()){
            outFile.createNewFile();
        }
        FileOutputStream fos = new FileOutputStream(outFile);
        FileInputStream fis = new FileInputStream(upload);
        byte[] buffer = new byte[1024];
        int len=0;
        while((len=fis.read(buffer))>-1){
            fos.write(buffer,0,len);
        }
        return SUCCESS;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }
}
