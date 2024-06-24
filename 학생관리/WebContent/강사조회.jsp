<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Vector"%>
<%@page import="jdbc.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

	String sql = "select TEACHER_CODE,TEACHER_NAME,CLASS_NAME,'￦'||substr(CLASS_PRICE,1,3)||','||substr(CLASS_PRICE,4,3),"
			+ " substr(TEACHER_REGIST_DATE,1,4)||'년'||substr(TEACHER_REGIST_DATE,5,2)||'월'||substr(TEACHER_REGIST_DATE,7,2)||'일'"
			+ " from TBL_TEACHER_202201";
	Connection con = DBconnect.getConnetion();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<jsp:include page="layout/footer.jsp"></jsp:include>
	

	<section>
		<div align="center">
			<h2>강사조회</h2>
			<table width="500px">
				<tr>
					<th>강사코드</th>
					<th>강사명</th>
					<th>강의명</th>
					<th>수강료</th>
					<th>강사자격취득일</th>
				</tr>
				
				<%while(rs.next()){ %>
				<tr>
					<td><%= rs.getString(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3)%></td>
					<td><%= rs.getString(4)%></td>
					<td><%= rs.getString(5)%></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>

</body>
</html>