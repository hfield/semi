<%@page import="dao.ChatDao"%>
<%@page import="vo.ChaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	ArrayList<ChaVO> list = new ArrayList<ChaVO>();
	list =ChatDao.getDao().getList();
	for(ChaVO e : list){
		%><div style="width:80%; background:olive; color:#ddd; margin:10px; padding:5px; font-weight:bold;">
		[<%=e.getReip() %>/<%=e.getU_id() %> : <%=e.getChat() %>
		[date : <%=e.getCdate() %>]
	</div>
<%} %>
