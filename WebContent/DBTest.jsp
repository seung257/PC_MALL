<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORACLE 데이터베이스 연결 테스트</title>
</head>
<body>
<%
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url, "antman", "12345");
	
	if(conn != null) {
		out.println("oracle 데이버베이스로 연결 했습니다. <br/>");
		conn.close();
		out.println("oracle 데이버베이스로 연결 끊었습니다.. <br/>");
		
	}
	else {
		out.println("oracle 데이버베이스로 연결 할 수 없습니다. <br/>");
	}


%>
</body>
</html>