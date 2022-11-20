<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    
    String sql = "";
    
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection
    		("jdbc:oracle:thin:@//localhost:1521/xe", "system", "oracle");
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