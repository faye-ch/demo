package com.faye.demo.websocket.ws;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value = "/chat")
public class EndPoint {

    /*
     * 一个ChatEndPiont 表示一个WebSocket 连接
     * 存储使用用户的webSocket  static 表示不属于任何一个对象，才能存储所有的 “用户”
     * 使用线程安全的容器
     */
    private static Map<String, EndPoint> onLineUsers = new ConcurrentHashMap<>();

    //声明一个session对象，通过该对象可以发送消息给指定用户，不能设置为静态，每个ChatEndPoint有一个session才能区分.(websocket的session)
    private Session session;

    //保存当前登录浏览器的用户
    private HttpSession httpSession;

    //建立链接时 触发
    @OnOpen
    public void onOpen(Session session, EndpointConfig config){

    }

    //服务器接受到消息 触发
    @OnMessage
    public void onMessage(String message,Session session){

    }

    //用户断开链接时 触发
    @OnClose
    public void onClose(Session session){

    }

}
