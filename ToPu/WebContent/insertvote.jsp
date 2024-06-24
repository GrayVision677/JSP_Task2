<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h2>투표하기</h2>
		<div align="center">
			<form action="insertvote2.jsp" name="data" method="post">
					<table>
						<tr>
							<th>주민번호</th>
							<td><input type="text" name="V_JUMIN">예)991011000001</td>
						</tr>
						
						<tr>
							<th>성명</th>
							<td><input type="text" name="V_NAME"></td>
						</tr>
						
						<tr>
							<th>후보번호</th>
							<td><select name ="M_NO">
								<option value="0">후보선택</option>
								<option value="1">[1]김후보</option>
								<option value="2">[2]이후보</option>
								<option value="3">[3]박후보</option>
								<option value="4">[4]조후보</option>
								<option value="5">[5]최후보</option>
							</select></td>
						</tr>
						
						<tr>
							<th>투표시간</th>
							<td><input type="text" name="V_TIME"></td>
						</tr>
						
						<tr>
							<th>투표장소</th>
							<td><input type="text" name="V_AREA"></td>
						</tr>
						
						<tr>
							<th>유권자확인</th>
							<td><input type="radio" name="V_CONFIRM" value="Y">확인
							<input type="radio" name="V_CONFIRM" value="N">미확인</td>
						</tr>
						
						<tr>
							<td colspan="2">
							<input type="button" value="투표하기" onclick="Chack()">
							<input type="reset" value="다시쓰기" onclick="del()">
							</td>
						</tr>
					</table>
			</form>
		</div>
	</section>
</body>
	<script type="text/javascript">
		function Chack() {
			if(!data.V_JUMIN.value){
				alert("주민번호가 입력되지 않았습니다!");
				data.V_JUMIN.focus();
			}else if(!data.V_NAME.value){
				alert("성명이 입력되지 않았습니다!");
				data.V_NAME.focus();
			}else if(data.M_NO.value == 0){
				alert("후보번호가 선택되지 않았습니다.!");
				data.M_NO.focus();
			}else if(!data.V_TIME.value){
				alert("투표시간이 입력되지 않았습니다!");
				data.V_TIME.focus();
			}else if(!data.V_AREA.value){
				alert("투표장소가 입력되지 않았습니다!");
				data.V_AREA.focus();
			}else if(!data.V_CONFIRM.value){
				alert("유권자확인이 선택되지 않았습니다.");
				data.V_CONFIRM.focus();
			}else{
				data.submit();
			}
		}
		
		function del() {
			alert("정보르 지우고 처음부터 다시 입력 합니다!");
			data.V_JUMIN.focus();
		}
	</script>

</html>