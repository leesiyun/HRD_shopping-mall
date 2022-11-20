<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="dbConnection.jsp" %>
    <%
    int custno = Integer.parseInt(request.getParameter("custno")); 
    
    sql = "delete from member_tbl_02 where custno=" + custno;
    
    PreparedStatement pstmt = con.prepareStatement(sql);
    
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
<script>
alert("회원정보가 삭제되었습니다!");
location.href="list.jsp";
</script>
</body>
</html>