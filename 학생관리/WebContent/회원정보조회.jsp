<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Vector"%>
<%@page import="jdbc.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

	String sql = "select substr(REGIST_MONTH,1,4)||'년'||substr(REGIST_MONTH,5,2)||'월'||substr(REGIST_MONTH,7,2)||'일'"
			+ " ,c.C_NO, m.c_name,t.CLASS_NAME"
			+ " ,CLASS_AREA,'￦'||substr(TUITION,1,3)||','||substr(TUITION,4,3),m.GRADE"
			+ " from TBL_CLASS_202201 c, TBL_MEMBER_202201 m,TBL_TEACHER_202201 t"
			+ " where c.c_no=m.c_no and c.TEACHER_CODE = t.TEACHER_CODE";

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
			<h2>회원정보조회</h2>
			<table width="500px">
				<tr>
					<th>수강월</th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
				</tr>
				
				<%while(rs.next()){ %>
				<tr>
					<td><%= rs.getString(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3)%></td>
					<td><%= rs.getString(4)%></td>
					<td><%= rs.getString(5)%></td>
					<td><%= rs.getString(6)%></td>
					<td><%= rs.getString(7)%></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>

</body>
</html>