<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Vector"%>
<%@page import="JDBC.DbManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "select * from lecturer_tbl order by(idx) asc";
	Connection con =DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
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
	<%
		DbManager db = new DbManager();
	
		Vector<Vector<String>> data = db.getDb(sql);
		System.out.println(data.size()); %>
		
		총 <%= data.size() %>명의 강사가 있습니다.
		<table width="1250px">
			<tr>
				<th>번호</th>
				<th>강사명</th>
				<th>전공</th>
				<th>세부전공</th>
				<th>관리</th>
			</tr>

			<%while(rs.next()){ %>
				<tr>
					<td><%= rs.getString(1) %></td>
					<td><%= rs.getString(2) %></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4) %></td>
					<td><input type="button" value="삭제" onclick = "deletelecturer(<%= rs.getString(1)%>)"></td>
				</tr>
			<% } %>
		</table>
	</section>
	<script type="text/javascript">
		function deletelecturer(idx) {
			if(confirm("정말로 삭제하시겠습니끼?")){
				location.href = "deletelecturer.jsp?idx=" + idx;
			}
		}
	</script>
</body>
</html>