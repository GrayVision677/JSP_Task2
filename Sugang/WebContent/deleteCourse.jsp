<%@page import="JDBC.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "delete from course_tbl where id = " + request.getParameter("id");
	Connection con = DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
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