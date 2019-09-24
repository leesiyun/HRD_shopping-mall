<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>회원목록조회/수정</h4>
	<table>
	<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>가입일자</td>
	<td>고객등급</td>
	<td>거주지역</td>
	</tr>
	<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection(
			"jdbc:oracle:thin:@localhost:1521/xe", "system", "oracle");
	PreparedStatement pstmt = con.prepareStatement("select * from member_tbl_02 order by custno");
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()){
		out.println("<tr>");
		out.println("<td><a href='detail.jsp?custno=" + rs.getInt("custno") + "'/>" + rs.getInt("custno") + "</a></td>");
		out.println("<td>" + rs.getString("custname") + "</td>");
		out.println("<td>" + rs.getString("phone") + "</td>");
		out.println("<td>" + rs.getString("address") + "</td>");
		String joindate = rs.getString("joindate");
        if(joindate.length() > 10) joindate = joindate.substring(0,10);
		out.println("<td>" + joindate + "</td>");
		String grade = "";
		if(rs.getString("grade").equals("A"))
			grade = "VIP";
		else if(rs.getString("grade").equals("B"))
			grade = "일반";
		else if(rs.getString("grade").equals("C"))
			grade = "직원";
		out.println("<td>" + grade + "</td>");
		out.println("<td>" + rs.getString("city") + "</td>");
		out.println("</tr>");
	};
	
	rs.close();
	pstmt.close();
	con.close();
	%>
	</table>
</body>
</html>