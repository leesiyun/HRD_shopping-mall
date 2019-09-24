<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    int custno = Integer.parseInt(request.getParameter("custno"));
   	Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection(
    		"jdbc:oracle:thin:@localhost:1521/xe", "system", "oracle");
    PreparedStatement pstmt = con.prepareStatement("select * from member_tbl_02 where custno = ?");
    pstmt.setInt(1, custno);
    
    ResultSet rs = pstmt.executeQuery();
    
    rs.next();
    String custname = rs.getString("custname");
    String phone = rs.getString("phone");
    String address = rs.getString("address");
    Date joindate = rs.getDate("joindate");
    String grade = rs.getString("grade");
    String city = rs.getString("city");
    
    rs.close();
    pstmt.close();
    con.close();

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
<h3>홈쇼핑 회원 등록</h3>
<table>
<tr>
<td>회원번호(자동발생)</td>
<td><input type="text" readonly="readonly" value="<%=custno%>" class="js-custno"></td>
</tr>
<tr>
<td>회원성명</td>
<td><input type="text" value="<%=custname%>" class="js-custname"></td>
</tr>
<tr>
<td>회원전화</td>
<td><input type="text" value="<%=phone%>" class="js-phone"></td>
</tr>
<tr>
<td>회원주소</td>
<td><input type="text" value="<%=address%>" class="js-address"></td>
</tr>
<tr>
<td>가입일자</td>
<td><input type="text" value="<%=joindate%>" class="js-joindate"></td>
</tr>
<tr>
<td>고객등급(A:VIP,B:일반,C:직원)</td>
<td><input type="text" value="<%=grade%>" class="js-grade"></td>
</tr>
<tr>
<td>도시코드</td>
<td><input type="text" value="<%=city%>" class="js-city"></td>
</tr>
<tr>
<td colspan="2">
<input type="button" value="수정" class="js-updateBtn">
<input type="button" value="조회" class="js-inquiryBtn">
</td>
</tr>
</table>
<script>
const updateBtn = document.querySelector(".js-updateBtn");
const inquiryBtn = document.querySelector(".js-inquiryBtn");

const updateBtnHandler  = function() {
	const custname = document.querySelector(".js-custname");
	if(!custname.value.trim()){
		alert("회원성명이 입력되지 않았습니다.");
		custname.focus();
		return;
	};
	const phone = document.querySelector(".js-phone");
	if(!phone.value.trim()){
		alert("회원전화가 입력되지 않았습니다.");
		phone.focus();
		return;
	};
	const address = document.querySelector(".js-address");
	if(!address.value.trim()){
		alert("회원주소가 입력되지 않았습니다.");
		address.focus();
		return;
	};
	const joindate = document.querySelector(".js-joindate");
	if(!joindate.value.trim()){
		alert("가입일자가 입력되지 않았습니다.");
		joindate.focus();
		return;
	};
	const grade = document.querySelector(".js-grade");
	if(!grade.value.trim()){
		alert("고객등급이 입력되지 않았습니다.");
		grade.focus();
		return;
	};
	const city = document.querySelector(".js-city");
	if(!city.value.trim()){
		alert("도시코드가 입력되지 않았습니다.");
		city.focus();
		return;
	};
	
	const request = new XMLHttpRequest();
	const custno = document.querySelector(".js-custno");
	let url = "update.jsp?";
		url+= "custno=" + custno.value;
		url+= "&custname=" + custname.value;
		url+= "&phone=" + phone.value;
		url+= "&address=" + address.value;
		url+= "&joindate=" + joindate.value;
		url+= "&grade=" + grade.value;
		url+= "&city=" + city.value;
		
		request.open('GET', encodeURI(url));
		request.send('');
		
		request.onreadystatechange = function() {
			if(request.readyState == 4){
				alert("회원정보 수정이 완료 되었습니다!");
			};
		};
};

	const inquiryBtnHandler = function() {
		location.href = "list.jsp";
	};

updateBtn.addEventListener("click", updateBtnHandler);
inquiryBtn.addEventListener("click", inquiryBtnHandler);
</script>
</body>
</html>