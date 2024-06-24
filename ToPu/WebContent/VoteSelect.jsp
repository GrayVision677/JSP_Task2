<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="run.DBManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "select V_NAME,'19'||substr(V_JUMIN,1,2)||'년'||substr(V_JUMIN,3,2)||'월'||substr(V_JUMIN,5,2)||'일생'"
			+ " ,'만'||ROUND((to_char(SYSDATE,'yyyyMMdd') - to_char(to_date(substr(V_JUMIN,1,6)+ decode(substr(V_JUMIN,1,1),'0',20000000,'1',20000000,'2',20000000,'4',19000000,'5',19000000,'6',19000000,'7',19000000,'8',19000000,'9',19000000)),'yyyyMMdd'))/10000)||'세',"
			+ " decode(substr(V_JUMIN,7,1),'1','남','2','여','3','남','4','여'),"
			+ " M_NO,V_TIME,decode(substr(V_CONFIRM,1,1),'N','미확인','Y','확인')"
			+ " FROM TBL_VOTE_202005";
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
		<h2>투표검수조회</h2>
		<div align="center">
			<table width = "1250px">
				<tr>
					<th>성명</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>후보번호</th>
					<th>투표시간</th>
					<th>유권자확인</th>
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