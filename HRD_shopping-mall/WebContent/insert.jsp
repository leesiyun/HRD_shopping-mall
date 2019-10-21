<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConnection.jsp" %>
    <%
    String custno = request.getParameter("custno"); 
    String custname = request.getParameter("custname"); 
    String phone = request.getParameter("phone"); 
    String address = request.getParameter("address"); 
    String joindate = request.getParameter("joindate"); 
    String grade = request.getParameter("grade"); 
    String city = request.getParameter("city"); 
    
    int year = Integer.parseInt(joindate.substring(0,4));
    int month = Integer.parseInt(joindate.substring(4,6));
    int day = Integer.parseInt(joindate.substring(6));
    
    Date insertdate = new Date(year -1900, month -1, day);
    
    sql = "insert into member_tbl_02(custno, custname, phone, address, joindate, grade, city) values(?,?,?,?,?,?,?)";
    
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(custno));
    pstmt.setString(2, custname);
    pstmt.setString(3, phone);
    pstmt.setString(4, address);
    pstmt.setDate(5, insertdate);
    pstmt.setString(6, grade);
    pstmt.setString(7, city);
    
    pstmt.executeUpdate();
    pstmt.close();
    con.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>