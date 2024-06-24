<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="run.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "select m.M_NO,m.M_NAME,count(v.M_NO) from TBL_MEMBER_202005 m join TBL_VOTE_202005 v"
			+ " on m.M_NO = v.M_NO"
			+ " where v.V_CONFIRM = 'Y'"
			+ " group by m.M_NO,m.M_NAME order by count(v.M_NO) desc";
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
					<th>총투표건수</th>
				</tr>
				
				<%while(rs.next()){ %>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>
</body>
</html>