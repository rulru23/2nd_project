<%@page import="petDAO.PetLikesDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

int bId = Integer.parseInt(request.getParameter("bId"));
String user = (String) session.getAttribute("user"); 

if (user == null){
	user = "";
	response.sendRedirect("error.jsp");
}
PetLikesDAO lDao = new PetLikesDAO();

int result = lDao.insertLike(bId, user);


%>

<%if (result == 1) {%>
	<br>
	<h3>���ƿ�!</h3>
	<br>
<% }else{ %>
	<br>
	<h3>�̹� ��õ �ϼ̽��ϴ�..!</h3>
	<br>
	
<%} %>