<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JDBC.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String sql = "select Max(id) from course_tbl";
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
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<jsp:include page="layout/footer.jsp"></jsp:include>
	
	<section>
		<div align="center">
			<h2>교과목 추가</h2>
			<form name="data" action="inserCourse2.jsp" method="post">
				<table width = "850px">
					<tr>
						<th>교과목 코드</th>
						<td><input type="text" name = "id" value="<%= Integer.parseInt(rs.getString(1)) + 1 %>" readonly></td>
					</tr>
					
					<tr>
						<th>과목명</th>
						<td><input type="text" name = "name"></td>
					</tr>
					
					<tr>
						<th>담당강사</th>
						<td>
							<select name = "lecturer" >
								<option label="담당강사선택"></option>
								<option value="1">김교수</option>
								<option value="2">이교수</option>
								<option value="3">박교수</option>
								<option value="4">우교수</option>
								<option value="5">최교수</option>
								<option value="6">강교수</option>
								<option value="7">황교수</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>학점</th>
						<td><input type="text" name = "credit"></td>
					</tr>
					
					<tr>
						
						<th>요일</th>
						<td>
							<input type="radio" name = "week" value="1">월
							<input type="radio" name = "week" value="2">화
							<input type="radio" name = "week" value="3">수
							<input type="radio" name = "week" value="4">목
							<input type="radio" name = "week" value="5">금
							<input type="radio" name = "week" value="6">토
						</td>
					</tr>
					
					<tr>
						<th>시작</th>
						<td><input type="text" name = "start_hour"></td>
					</tr>
					
					<tr>
						<th>종료</th>
						<td><input type="text" name = "endhour_end"></td>
					</tr>
				</table>
			<input type="button" value="목록" onclick="location.href='listCourse.jsp'">
			<input type="reset" value="취소">
			<input type="button" value="완료" onclick="checkValue()" >
			</form>
		</div>
	</section>
	
	<script type="text/javascript">
		function checkValue() {
			if(!data.id.value){
				alert("과목코드를 입력하시오.");
				data.id.focus();
			}else if(!data.name.value){
				alert("과목명를 입력하시오.");
				data.name.focus();
			}else if(!data.lecturer.value){
				alert("담당강사를 입력하시오.");
				data.lecturer.focus();
			}else if(!data.credit.value){
				alert("학점를 입력하시오.");
				data.credit.focus();
			}else if(!data.week.value){
				alert("과목명를 입력하시오.");
				data.week.focus();
			}else if(!data.start_hour.value){
				alert("과목명를 입력하시오.");
				data.start_hour.focus();
			}else if(!data.endhour_end.value){
				alert("과목명를 입력하시오.");
				data.endhour_end.focus();
			}else{
				data.submit();
			}
		}
			
	</script>
</body>
</html>