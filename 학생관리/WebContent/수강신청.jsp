<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql1="select C_NO,C_NAME from TBL_MEMBER_202201";
	String sql2="select * from TBL_TEACHER_202201";

	Connection con = DBconnect.getConnetion();
	PreparedStatement pstmt1 = con.prepareStatement(sql1);
	ResultSet rs1 = pstmt1.executeQuery();
	
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	ResultSet rs2 = pstmt2.executeQuery();
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
			<h2>수강신청</h2>
			<form name ="data" action="수강신청2.jsp" method="post">
				<table width="500px">
					<tr>
						<th>수강월</th>
						<td><input type="text" name="REGIST_MONTH">예)2022년03월->202203</td>
					</tr>
					
					<tr>
						<th>회원명</th>
						<td>
							<select name="C_NAME" onchange="setNo(this.value)" >
								<option label="회원성명"></option>
								<% while(rs1.next()){%>
								<option value="<%=rs1.getString("C_NO")%>">
											<%=rs1.getString("C_NAME")%></option>
								<%} %>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="C_NO" readonly>예)10001</td>

					</tr>
					
					<tr>
						<th>강의장소</th>
						<td><input type="text" name="CLASS_AREA"></td>
					</tr>
					<tr>
						<th>강의명</th>
						<td>
							<select name="CLASS_NAME">
								<option label="강의신청"></option>
								<%while(rs2.next()){ %>
								<option><%=rs2.getString("CLASS_NAME")%></option>
								<%} %>
							</select>
						</td>
					</tr>
					<tr>
						<th>수강료</th>
						<td><input type="text" name="CLASS_PRICE">원</td>
					</tr>
					<tr>
						<td colspan="2"> 
							<input type="button" value="수강신청" onclick="checkValue()">
							<input type="reset" value="다시쓰기" onclick="RESET()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script type="text/javascript">
		function setNo(C_NO) {
			data.C_NO.value=C_NO;
		}
		function checkValue() {
			if(!data.REGIST_MONTH.value){
				alert("수강월을 입력하지 않았습니다.");
				data.REGIST_MONTH.focus();
			}else if(!data.C_NAME.value){
				alert("회원명을 입력하지 않았습니다.");
				data.C_NAME.focus();
			}else if(!data.CLASS_AREA.value){
				alert("강의장소를 입력하지 않았습니다.");
				data.CLASS_AREA.focus();
			}else if(!data.CLASS_NAME.value){
				alert("강의명을 입력하지 않았습니다.");
				data.CLASS_NAME.focus();
			}else{
				data.submit();
			}
			
		}
		function RESET() {
			alert("모든 정보를 지우고 처음부터 다시 입력합니다!");
			data.REGIST_MONTH.focus();
		}
	</script>
</body>
</html>