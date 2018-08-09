<%@ page contentType="text/html;charset=UTF-8"
	import="java.sql.*,oracle.dbpool.*"%>
<%
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement dbStmt;
	dbStmt = con.createStatement();

	String sql = "create table Re_Board ( ";
	sql = sql + "b_id		NUMBER(5)		PRIMARY KEY, ";
	sql = sql + "Pwd		VARCHAR2(20)	NOT NULL, ";
	sql = sql + "b_name	VARCHAR2(20)	NOT NULL, ";
	sql = sql + "b_email	VARCHAR2(20)	NOT NULL, ";
	sql = sql + "b_title		VARCHAR2(80)	NOT NULL, ";
	sql = sql + "b_content	VARCHAR2(2000)	NOT NULL, ";
	sql = sql + "b_date	DATE			default SYSDATE, ";
	sql = sql + "b_hit		NUMBER(5)       NULL, ";
	sql = sql + "b_ip		VARCHAR2(15)	NULL, ";
	sql = sql + "ref			NUMBER(5)		NULL, ";
	sql = sql + "step		NUMBER(5)		NULL, ";
	sql = sql + "anslevel	NUMBER(5)		NULL )";

	dbStmt.executeUpdate(sql);
	dbStmt.close();
	con.close();
	pool.freeConnection("ora8", con); 
%>

<HTML>
<HEAD>
<TITLE>게시판 테이블 생성</TITLE>
</HEAD>

<BODY>게시판 테이블이 생성되었어요.
</BODY>
</HTML>