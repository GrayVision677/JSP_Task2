<%@page import="java.sql.PreparedStatement"%>
<%@page import="JDBC.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("UTF-8");
	String sql = "INSERT INTO course_tbl values(?,?,?,?,?,?,?)";
	
	Connection con =DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("credit"));
	pstmt.setString(4, request.getParameter("lecturer"));
	pstmt.setString(5, request.getParameter("week"));
	pstmt.setString(6, request.getParameter("start_hour"));
	pstmt.setString(7, request.getParameter("endhour_end"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="listCourse.jsp"></jsp:forward>
</body>
</html>