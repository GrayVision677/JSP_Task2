<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/css.css">
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<section>
		<div align="center">
			<h2>백신예약조회</h2>
			<form action="selreser2.jsp" name="data" method="post">
				<table>
					<tr>
						<th>예약번호</th>
						<td><input type="text" name="RESVNO"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="조회하기" onclick="checkval()">
							<input type="button" value="홈으로" onclick="location.href='selreser.jsp'">
						</td>
					</tr>
					
				</table>
			</form>
		</div>
	</section>
</body>

<script type="text/javascript">
	function checkval() {
		if(!data.RESVNO.value){
			alert("예약번호를 입력하세요!");
		}else{
			data.submit();
		}
	}
</script>
</html>