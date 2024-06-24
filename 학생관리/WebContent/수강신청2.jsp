<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="insert into TBL_CLASS_202201 values(?, ?, ?, ?, ?)";

	Connection conn = DBconnect.getConnetion();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	int x = Integer.parseInt(request.getParameter("CLASS_NAME"))/1000;
		pstmt.setString(1,request.getParameter("REGIST_MONTH"));
		pstmt.setString(2,request.getParameter("C_NO"));
		pstmt.setString(3,request.getParameter("CLASS_AREA"));
		pstmt.setString(4,request.getParameter("CLASS_NAME"));
		pstmt.setString(5,x+"");
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="회원정보조회.jsp"></jsp:forward>
</body>
</html>