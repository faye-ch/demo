package com.faye.demo.ex.mvc;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
@RestController
public class DownloadController {
    
    private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);
    
    @PostMapping("/download")
    public String downlaod(@RequestBody(required = false)String str,
                           HttpServletRequest request) throws Exception{
        //str：请求体流的长度短的话可以接收
        //请求体流的长度过长的话,只能通过 request InputStream 接收
        InputStream in = request.getInputStream();
        String s = IOUtils.toString(in, "UTF-8");
        System.out.println(s);
        return "ok";
    }

    public static void main(String[] args) {
//        String url = "http://test.gw.xrk.k8s:8941/order_web/cps/download/TS?managecom=I&contno=06V27405";
        String url = "http://127.0.0.1:8080/download";
        String xml = "0E5362DFA65D8A9793DB77B851AB4A71206F030C3E708C63CD97EEA31EA4AC80A8B182F6AE5E80A2022718170F6C6C72D530B7B361BA";
        String s = doPost(url, xml);

    }

    public static String doPost(String serverurl,String xml){
        StringBuilder responseBuilder = null;
        BufferedReader reader = null;
        OutputStreamWriter wr = null;
        URL url;
        try {
            url = new URL(serverurl);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(1000 * 10);
            conn.connect();
            wr = new OutputStreamWriter(conn.getOutputStream());

            wr.write(new String(xml.getBytes("UTF-8")));
            wr.flush();

            reader = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
            responseBuilder = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null) {
                responseBuilder.append(line);
            }
        } catch (IOException e) {
            logger.error("", e);
        } finally {

            if (wr != null) {
                try {
                    wr.close();
                } catch (IOException e) {
                    logger.error("close error", e);
                }
            }

            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    logger.error("close error", e);
                }
            }

        }
        if(responseBuilder!=null){
            return responseBuilder.toString();
        }
        return "";
    }
    
    
}
