<%@page import="run.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "insert into TBL_VOTE_202005 values(?,?,?,?,?,?)";
	Connection con = DBManager.getCon();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("V_JUMIN"));
	pstmt.setString(2, request.getParameter("V_NAME"));
	pstmt.setString(3, request.getParameter("M_NO"));
	pstmt.setString(4, request.getParameter("V_TIME"));
	pstmt.setString(5, request.getParameter("V_AREA"));
	pstmt.setString(6, request.getParameter("V_CONFIRM"));
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