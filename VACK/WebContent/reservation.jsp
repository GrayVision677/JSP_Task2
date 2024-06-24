<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String sql = "select Max(RESVNO) from TBL_VACCRESV_202109";
	Connection con = DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	System.out.print(rs.getInt(1));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/css.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<jsp:include page="layout/footer.jsp"></jsp:include>
	
	<section>
		<div align="center">
			<h2>백신예약</h2>
			<form action="reservation2.jsp" name="data" method="post">
				<table>
					<tr>
						<th>예약번호</th>
						<td><input type="text" name="RESVNO" value=<%= rs.getInt(1) + 1 %>></td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td><input type="text" name="JUMIN">ex)790101-1111111</td>
					</tr>
					<tr>
						<th>백신코드</th>
						<td><select name="VCODE">
							<option value="V001">A백신</option>
							<option value="V002">B백신</option>
							<option value="V003">C백신</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>병원코드</th>
						<td>
							<input type="radio" name="HSOPCODE" value="H001">가_병원
							<input type="radio" name="HSOPCODE" value="H002">나_병원
							<input type="radio" name="HSOPCODE" value="H003">다_병원
							<input type="radio" name="HSOPCODE" value="H004">라_병원
						</td>
					</tr>
					<tr>
						<th>예약날짜</th>
						<td><input type="text" name="RESVDATE">ex)20210101</td>
					</tr>
					<tr>
						<th>예약시간</th>
						<td><input type="text" name="RESVTIME">ex)0930, 1130</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="등록" onclick="ChkVal()">
							<input type="reset" value="취소" onclick="res()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<script type="text/javascript">
		function ChkVal() {
			if(!data.RESVNO.value){
				alert("예약번호를 입력해주세요");
				data.RESVNO.focus();
			}else if(!data.JUMIN.value){
				alert("주민번호를 입력해주세요");
				data.JUMIN.focus();
			}else if(!data.VCODE.value){
				alert("백신코드를 선택해주세요");
				data.VCODE.focus();
			}else if(!data.HSOPCODE.value){
				alert("병원코드를 선택해주세요");
				data.HSOPCODE.focus();
			}else if(!data.RESVDATE.value){
				alert("예약날짜를 입력해주세요");
				data.RESVDATE.focus();
			}else if(!data.RESVTIME.value){
				alert("예약시간를 입력해주세요");
				data.RESVTIME.focus();
			}else{
				alert("백신예약이 정상적으로 완료되었습니다!");
				data.submit();
			}
		}
		
		function res() {
			alert("모든 정보를 지우고 처음부터 다시 입력합니다!");
		}
	</script>
</body>
</html>