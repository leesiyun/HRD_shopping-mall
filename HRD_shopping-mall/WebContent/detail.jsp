<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConnection.jsp" %>
    <%
    int custno = Integer.parseInt(request.getParameter("custno"));
    
    sql = "select * from member_tbl_02 where custno=" + custno;
    ResultSet rs = con.prepareStatement(sql).executeQuery();
	
    if(rs.next()){
    	String custname = rs.getString("custname");
    	String phone = rs.getString("phone");
    	String address = rs.getString("address");
    	Date joindate = rs.getDate("joindate");
    	String grade = rs.getString("grade");
    	String city = rs.getString("city");
    
    rs.close();
    con.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>홈쇼핑 회원 등록</h2>
<table>
<tr>
<td>회원번호(자동발생)</td>
<td>
<input type="text" readonly="readonly" value="<%=custno %>" class="js-custno"/>
</td>
</tr>
<tr>
<td>회원성명</td>
<td><input type="text" value="<%=custname %>"class="js-custname"/></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type="text" value="<%=phone %>"class="js-phone"/></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type="text" value="<%=address %>"class="js-address"/></td>
</tr>
<tr>
<td>가입일자</td>
<td><input type="text" value="<%=joindate %>" class="js-joindate"/></td>
</tr>
<tr>
<td>고객등급</td>
<td>
<input type="radio" name="grade" value="A" <%=grade.equals("A") ? "checked" : "" %> />VIP
<input type="radio" name="grade" value="B" <%=grade.equals("B") ? "checked" : "" %>/>일반
<input type="radio" name="grade" value="C" <%=grade.equals("C") ? "checked" : "" %>/>직원
</td>
</tr>
<tr>
<td>도시코드</td>
<td>
<select class="js-city">
<option value="">===</option>
<option value="01" <%=city.equals("01") ? "selected" : "" %>>서울</option>
<option value="30" <%=city.equals("30") ? "selected" : "" %>>울릉</option>
<option value="60" <%=city.equals("60") ? "selected" : "" %>>제주</option>
</select>
</td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="수정" class="js-updateBtn"/>
<input type="button" value="삭제" class="js-cancleBtn"/>
</td>
</tr>
</table>
<script>
const updateBtn = document.querySelector(".js-updateBtn");
const cancleBtn = document.querySelector(".js-cancleBtn");

const handleUpdateBtn = () => {
	const custname = document.querySelector(".js-custname");
	if(!custname.value.trim()){
		alert("회원성명이 입력되지 않았습니다");
		custname.focus();
		return;
	};
	
	const phone = document.querySelector(".js-phone");
	if(!phone.value.trim()){
		alert("회원전화가 입력되지 않았습니다");
		phone.focus();
		return;
	};
	
	const address = document.querySelector(".js-address");
	if(!address.value.trim()){
		alert("회원주소가 입력되지 않았습니다");
		address.focus();
		return;
	};
	
	const joindate = document.querySelector(".js-joindate");
	if(!joindate.value.trim().replace(/\-/g, '')){
		alert("가입일자가 입력되지 않았습니다");
		joindate.focus();
		return;
	};
	
	const grade = document.querySelector("input[name='grade']:checked");
	if(!grade){
		alert("고객등급이 입력되지 않았습니다");
		return;
	};
	
	const city = document.querySelector(".js-city");
	if(!city.value){
		alert("도시가 입력되지 않았습니다.");
		return;
	};
	
	const request = new XMLHttpRequest();
	const custno = document.querySelector(".js-custno");
	let url = "update.jsp?"
	  	url += "custno=" + custno.value;
		url += "&custname=" + custname.value;
		url += "&phone=" + phone.value;
		url += "&address=" + address.value;
		url += "&joindate=" + joindate.value.replace(/\-/g, '');
		url += "&grade=" + grade.value;
		url += "&city=" + city.value;
		
		request.open('GET', encodeURI(url));
		request.send();
	
	request.onreadystatechange = () => {
		if(request.readyState === 4){
			alert("회원등록이 완료 되었습니다!");
			location.href="list.jsp"
		};
	};
};

const handleCancleBtn = () => location.href="delete.jsp?custno=<%=custno %>";

updateBtn.addEventListener("click", handleUpdateBtn);
cancleBtn.addEventListener("click", handleCancleBtn);
<%
    }
%>
</script>
</body>
</html>