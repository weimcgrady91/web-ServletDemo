package com.wei.q.test;

import java.io.*;
import java.text.NumberFormat;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class Driver {
    public static void main(String[] args) throws Exception {
        File file = new File("E:/index.jsp");
//        if(file.exists()){
//            System.out.println("aaa");
//        } else{
//            System.out.println("bbb");
//        }

//        FileOutputStream fileOutputStream = new FileOutputStream();
//        GZIPOutputStream gzipOutputStream = new GZIPOutputStream();
//        FileInputStream fileInputStream =new FileInputStream(file);
//        System.out.println(file.length());

        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        GZIPOutputStream gzipOutputStream = new GZIPOutputStream(byteArrayOutputStream);

        FileInputStream fileInputStream = new FileInputStream(file);
        long total = 0;
        byte[] buff = new byte[1024];
        int len = 0;
        while ((len = fileInputStream.read(buff)) > 1) {
            total += len;
            gzipOutputStream.write(buff, 0, len);
        }

        System.out.println("原始长度:" + total);
        byteArrayOutputStream.close();
        gzipOutputStream.finish();
        byte[] newLen = byteArrayOutputStream.toByteArray();
        System.out.println("新的长度:" + newLen.length);
        System.out.println("压缩比率:" + NumberFormat.getPercentInstance().format(new Double(newLen.length) / total));

        ByteArrayInputStream inputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        ByteArrayOutputStream byteArrayOutputStream1 = new ByteArrayOutputStream();
        GZIPInputStream gzipInputStream = new GZIPInputStream(inputStream);
        len=0;
        while((len=gzipInputStream.read(buff)) >1) {
            byteArrayOutputStream1.write(buff,0,len);
        }
        byteArrayOutputStream1.flush();
        byteArrayOutputStream1.close();

        System.out.println("还原:" + byteArrayOutputStream1.toByteArray().length);


    }
}
