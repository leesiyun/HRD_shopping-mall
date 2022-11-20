<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConnection.jsp" %>
    <%
    sql = "select max(custno) from member_tbl_02";
    ResultSet rs = con.prepareStatement(sql).executeQuery();
    
	int maxno = 0;
	
    if(rs.next())
    	maxno = rs.getInt("max(custno)") + 1;
    
    Date date = new Date(System.currentTimeMillis());
    
    String today = date.toString();
    today = today.replace("-", "");
    
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
<input type="text" readonly="readonly" value="<%=maxno %>" class="js-custno"/>
</td>
</tr>
<tr>
<td>회원성명</td>
<td><input type="text" class="js-custname"/></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type="text" class="js-phone"/></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type="text" class="js-address"/></td>
</tr>
<tr>
<td>가입일자</td>
<td><input type="text" value="<%=today %>" class="js-joindate"/></td>
</tr>
<tr>
<td>고객등급</td>
<td>
<input type="radio" name="grade" value="A"/>VIP
<input type="radio" name="grade" value="B"/>일반
<input type="radio" name="grade" value="C"/>직원
</td>
</tr>
<tr>
<td>도시코드</td>
<td>
<select class="js-city">
<option value="">===</option>
<option value="01">서울</option>
<option value="30">울릉</option>
<option value="60">제주</option>
</select>
</td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="등록" class="js-registerBtn"/>
<input type="button" value="조회" class="js-listBtn"/>
</td>
</tr>
</table>
<script>
const registerBtn = document.querySelector(".js-registerBtn");
const listBtn = document.querySelector(".js-listBtn");

const handleRegisterBtn = () => {
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
	if(!joindate.value.trim()){
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
	let url = "insert.jsp?"
	  	url += "custno=" + custno.value;
		url += "&custname=" + custname.value;
		url += "&phone=" + phone.value;
		url += "&address=" + address.value;
		url += "&joindate=" + joindate.value;
		url += "&grade=" + grade.value;
		url += "&city=" + city.value;
		
		request.open('GET', encodeURI(url));
		request.send();
	
	request.onreadystatechange = () => {
		if(request.readyState === 4){
			alert("회원등록이 완료 되었습니다!");
			location.href="register.jsp"
		};
	};
};

const handleListBtn = () => location.href="list.jsp";

registerBtn.addEventListener("click", handleRegisterBtn);
listBtn.addEventListener("click", handleListBtn);
</script>
</body>
</html>