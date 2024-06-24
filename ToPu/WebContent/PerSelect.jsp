<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="run.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "select m.M_NO, m.M_NAME, p.P_NAME,"
			+ " decode(P_SCHOOL,'1','고졸','2','학사','3','석사','4','박사'),"
			+ " substr(m.M_JUMIN,1,6)|| '-' || substr(m.M_JUMIN,7,7), m.M_CITY,"
			+ " substr(p.P_TEL1,1,2) || '-' || substr(p.P_TEL2,1,4) || '-' || substr(p.P_TEL3,1,4)"
			+ " FROM TBL_MEMBER_202005 m join TBL_PARTY_202005 p on m.P_CODE = p.P_CODE";
	Connection con = DBManager.getCon();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css.css">
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<jsp:include page="/layout/nav.jsp"></jsp:include>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	
	<section>
		<h2>후보조회</h2>
		<div align="center">
			<table width = "1250px">
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				</tr>
				
				<%while(rs.next()){ %>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><%= rs.getString(5) %></td>
					<td><%= rs.getString(6) %></td>
					<td><%= rs.getString(7) %></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>
</body>
</html>