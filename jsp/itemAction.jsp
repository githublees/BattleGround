<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
try{
	String DB_URL = "jdbc:mysql://localhost:3306/battleground?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	String DB_USER = "root";
	String DB_PASSWORD= "1234";
	 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	PreparedStatement pstmt=null;
	pstmt = con.prepareStatement("delete from item where id=?");
	pstmt.setString(1,id);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
	response.sendRedirect("play.jsp?re=HG");      
}
catch(Exception e){
	System.out.println(e);
}
%>