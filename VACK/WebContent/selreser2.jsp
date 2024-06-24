<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.DbManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "select va.RESVNO ,ju.NAME ,decode(substr(ju.JUMIN,8,1),'1','남','2','여'),"
			+ " ho.HOSPNAME, to_char(va.RESVDATE,'yyyy')||'년'||to_char(va.RESVDATE,'MM')||'월'||to_char(va.RESVDATE,'dd')||'일'"
			+ " , substr(to_char(va.RESVTIME,'0000'),1,3) || ':' || substr(to_char(va.RESVTIME,'0000'),4,2)"
			+ " , decode(va.VCODE,'V001','A백신','V002','B백신','V003','C백신','V004','D백신')"
			+ " , decode(ho.HOSPADDR,'10','서울','20','대전','30','대구','40','광주')"
			+ " from TBL_VACCRESV_202109 va join TBL_JUMIN_202109 ju "
			+ " on va.JUMIN = ju.JUMIN"
			+ " join TBL_HOSP_202109 ho"
			+ " on ho.HOSPCODE = va.HSOPCODE"
			+ " where va.RESVNO="+request.getParameter("RESVNO")+"" ;
	Connection con = DbManager.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	DbManager db = new DbManager();
	
	Vector<Vector<String>> data = db.getDb(sql);
%>
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
	
	
	<%if(data.size() == 0){ %>
		<h2>예약번호<%=request.getParameter("RESVNO")%>로 조회된 결과가 없습니다.</h2>
		<div align="center">v
			<input type="button" value="홈으로" onclick="location.href='index.jsp'">
		</div>
	<%}else{ %>
	<section>
		<h2>예약번호<%=request.getParameter("RESVNO")%>님의 예약 조회</h2>
		<div align="center">
			<table>
				<tr>
					<th>예약번호</th>
					<th>성명</th>
					<th>성별</th>
					<th>병원이름</th>
					<th>예약날짜</th>
					<th>예약시간</th>
					<th>백신코드</th>
					<th>병원지역</th>
				</tr>
				
				<%while(rs.next()){ %>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
						<td><%=rs.getString(8) %></td>
					</tr>
				<%} %>
			</table>
			<input type="button" value="돌아가기" onclick="location.href='selreser.jsp'">
		</div>
	</section>
	<%} %>
</body>
</html>