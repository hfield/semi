<%@page import="dao.ChatDao"%>
<%@page import="vo.ChaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	response.setHeader("cache-control", "no-cache");
	response.setContentType("text/event-stream");
	ArrayList<ChaVO> list = ChatDao.getDao().getList();
	StringBuffer outs = new StringBuffer();
	//outs.append("retry:2000\n");
	outs.append("data:");
	for(ChaVO e : list){
		outs.append("<p style='color:black; border:1px dotted white'>");
		outs.append(e.getU_id());
		outs.append("/");
		outs.append(e.getChat());
		outs.append("</p>");
	}
	outs.append("\n\n");
	System.out.println("체크2");
	%><%=outs%>