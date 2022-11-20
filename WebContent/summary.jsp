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
<table>
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>고객등급</th>
<th>매출</th>
<th>매출평균</th>
</tr>
<%
	sql= "select mem.custno, custname, grade, summary_sum, summary_avg from member_tbl_02 mem, (select custno, sum(price) summary_sum, avg(price) summary_avg from money_tbl_02 group by custno)money where mem.custno = money.custno and summary_sum > 0 order by summary_sum DESC";
	ResultSet rs = con.prepareStatement(sql).executeQuery();
	
	while(rs.next()){
		int custno = rs.getInt("custno");
		String custname = rs.getString("custname");
		String grade = "";
		if(rs.getString("grade").equals("A"))
			grade = "VIP";
		if(rs.getString("grade").equals("B"))
			grade = "일반";
		if(rs.getString("grade").equals("C"))
			grade = "직원";
		int summary_sum = rs.getInt("summary_sum");
		int summary_arg = Math.round(rs.getInt("summary_avg"));
%>
<tr>
<td><%=custno %></td>
<td><%=custname %></td>
<td><%=grade %></td>
<td><%=summary_sum %></td>
<td><%=summary_arg %></td>
</tr>
<%
	};
	
	rs.close();
	con.close();
%>
</table>
</body>
</html>