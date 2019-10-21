<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원목록조회/수정</h2>
<table>
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
</tr>
<%
	sql = "select * from member_tbl_02 order by custno";
	ResultSet rs = con.prepareStatement(sql).executeQuery();
	
	while(rs.next()){
		int custno = rs.getInt("custno");
		String custname = rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		Date joindate = rs.getDate("joindate");
		String grade = "";
		if(rs.getString("grade").equals("A"))
			grade="VIP";
		if(rs.getString("grade").equals("B"))
			grade="일반";
		if(rs.getString("grade").equals("C"))
			grade="직원";
		String city = rs.getString("city");
%>
<tr>
<td><a href="detail.jsp?custno=<%=custno %>"><%=custno %></a></td>
<td><%=custname %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><%=joindate %></td>
<td><%=grade %></td>
<td><%=city %></td>
</tr>
<%
	}
	rs.close();
	con.close();
%>
</table>
</body>
</html>