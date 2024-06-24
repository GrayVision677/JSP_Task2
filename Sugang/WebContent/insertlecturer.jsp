<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JDBC.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql = "select Max(idx) from lecturer_tbl";
	Connection con = DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
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
		<div align="center">
			<h2>강사 추가</h2>
			<form name="data" action="insertlecturer2.jsp" method="post">
				<table width="500px">
					<tr>
						<th>번호</th>
						<td><input type="text" name="idx" value="<%= Integer.parseInt(rs.getString(1)) + 1%>" readonly></td>
					</tr>
					
					<tr>
						<th>강사명</th>
						<td><input type="text" name="name"></td>
					</tr>
					
					<tr>
						<th>전공</th>
						<td><input type="text" name="major"></td>
					</tr>
					
					<tr>
						<th>세부전공</th>
						<td><input type="text" name="field"></td>
					</tr>
				</table>
				<input type="button" value="목록" onclick="location.href='listlecturer.jsp'">
			<input type="reset" value="취소">
			<input type="button" value="완료" onclick="checkValue()" >
			</form>
		</div>
	</section>
	
	<script type="text/javascript">
		function checkValue() {
			if(!data.idx.value){
				alert("번호를 입력하시오.");
				data.idx.focus();
			}else if(!data.name.value){
				alert("강사명를 입력하시오.");
				data.name.focus();
			}else if(!data.major.value){
				alert("전공를 입력하시오.");
				data.major.focus();
			}else if(!data.field.value){
				alert("세부전공를 입력하시오.");
				data.field.focus();
			}else{
				data.submit();
			}
		}
			
	</script>
</body>
</html>