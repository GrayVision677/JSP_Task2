<%@page import="java.sql.PreparedStatement"%>
<%@page import="JDBC.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "INSERT INTO lecturer_tbl values(?,?,?,?)";
	Connection con = DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("idx"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("major"));
	pstmt.setString(4, request.getParameter("field"));
	
	pstmt.executeUpdate();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="listlecturer.jsp"></jsp:forward>
</body>
</html>