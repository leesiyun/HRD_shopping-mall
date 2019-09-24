<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원매출조회</h2>
<table>
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>고객등급</th>
<th>매출</th>
</tr>
<%
Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521/xe", "system", "oracle");
		PreparedStatement pstmt = con.prepareStatement(
				"select mem.custno, custname, grade, summary from member_tbl_02 mem, (select custno, sum(price) summary from money_tbl_02 group by custno) money where mem.custno = money.custno and summary > 0 order by summary desc");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+ rs.getInt("custno")+"</td>");
			out.println("<td>"+ rs.getString("custname")+"</td>");
			out.println("<td>"+ rs.getString("grade")+"</td>");
			out.println("<td>"+ rs.getInt("summary")+"</td>");
			out.println("</tr>");
		};
		rs.close();
		pstmt.close();
		con.close();
		%>
</table>
</body>
</html>
