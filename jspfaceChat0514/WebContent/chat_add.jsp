<%@page import="dao.ChatDao"%>
<%@page import="vo.ChaVO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
	String u_id = URLDecoder.decode(request.getParameter("u_id"),"utf-8");
	String chat = URLDecoder.decode(request.getParameter("chat"),"utf-8");
	String reip = request.getRemoteAddr();
	System.out.println("Log:"+u_id);
	System.out.println("Log:"+chat);
	System.out.println("Log:"+reip);
	ChaVO v = new ChaVO();
	v.setU_id(u_id);
	v.setChat(chat);
	v.setReip(reip);
	ChatDao.getDao().insertChat(v);
	System.out.println("üũ3");
%>