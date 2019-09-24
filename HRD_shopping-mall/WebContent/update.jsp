<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    String custno = request.getParameter("custno");
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
    int year = Integer.parseInt(joindate.substring(0,4));
    int month = Integer.parseInt(joindate.substring(5,6));
    int day = Integer.parseInt(joindate.substring(7));
    
    java.sql.Date updateDate = new Date(year-1900, month-1, day);
    
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection(
    		"jdbc:oracle:thin:@localhost:1521/xe", "system", "oracle");
    PreparedStatement pstmt = con.prepareStatement(
    		"update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?");
    pstmt.setString(1, custname);
    pstmt.setString(2, phone);
    pstmt.setString(3, address);
    pstmt.setString(4, joindate);
    pstmt.setString(5, grade);
    pstmt.setString(6, city);
    pstmt.setInt(7, Integer.parseInt(custno));
    
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