<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "insert into TBL_VACCRESV_202109 values(?,?,?,?,?,?)";
	Connection con = DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(request.getParameter("RESVNO")));
	pstmt.setString(2, request.getParameter("JUMIN"));
	pstmt.setString(3, request.getParameter("HSOPCODE"));
	pstmt.setString(4, request.getParameter("RESVDATE"));
	pstmt.setString(5, request.getParameter("RESVTIME"));
	pstmt.setString(6, request.getParameter("VCODE"));
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>