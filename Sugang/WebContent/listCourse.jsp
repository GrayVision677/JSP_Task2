<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="JDBC.DbManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Connection con = DbManager.getConnection();
 	String sql = "select c.id, c.name, c.credit, l.name, "
 			+ "decode(c.week, 1,'월',2,'화',3,'수',4,'목',5,'금',6,'토','일'),"
 			+ " to_char(start_hour, '0000'),"
 			+ " to_char(endhour_end, '0000')"
 			+ " from course_tbl c, lecturer_tbl l"
 			+ " where c.lecturer = l.idx"
 			+ " order by(c.id) asc";
;
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
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
		
		총 <%= data.size() %>개의 교과목이 있습니다.
		<table width="1250px">
			<tr>
				<th>과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>담당강사</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
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
					<td><input type="button" value="수정" onclick = "location.href='updateCourse.jsp?id=<%= rs.getString(1) %>'">
						<input type="button" value="삭제" onclick = "deleteCourse(<%= rs.getString(1)%>)"></td>
				</tr>
			<% } %>
		</table>
	</section>
	
	<script type="text/javascript">
		function deleteCourse(id) {
			if(confirm("정말로 삭제하시겠습니끼?")){
				location.href = "deleteCourse.jsp?id=" + id;
			}
			
		}
	</script>
</body>
</html>