<%@ page language="java" import="java.util.*,com.sakila.utlis.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String lrc = MusicUtil.getLrc(request);
	out.print(lrc);
%>

