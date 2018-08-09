<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*,oracle.dbpool.*"   %>

<HTML>
	<HEAD><TITLE>컴퓨터전문쇼핑몰</TITLE>
	<script language=JavaScript src="../common/u3.js"></script>
	<link href="../common/u3.css" type=text/css rel=stylesheet>
</HEAD>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
        <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	
<!--  공지내용보기  -->	
	<center><br>
	  <table border=1 width=450 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=0063ce><font size=2 color=white><b>공 지 사 항</b></td>
		</tr>
	  </table> <br>
<%
	try {
		 String title,body,cdate;
		 int idnum,hits;
		String bid=request.getParameter("bid"); 

		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

		Statement stmt = con.createStatement();
		String sql="select idnum,title,body,to_char(cdate,'yy-mm-dd'),hits from notice where idnum="+bid; 
		ResultSet rs = stmt.executeQuery(sql);  
		if(rs.next()) {   
			idnum=rs.getInt(1);
			title=rs.getString(2);
			body=rs.getString(3);
			cdate=rs.getString(4);
			hits=rs.getInt(5);
%>
	<table border=1 cellpadding="1" cellspacing="2" width=450>
		<tr>
			<th align="center" bgcolor="#c0c0c0"><p><font size="2">제목</font></th>
			<th align="center" colspan=3><p><font size="2"><b><%=title%></b></font></th>
		</tr>
		<tr>
			<th align="center" bgcolor="#c0c0c0"><p><font size="2">등록일</font></th>
			<th align="center"><font size="2"><b><%=cdate%></b></font></th>
			<th align="center" bgcolor="#c0c0c0"><p><font size="2">조회</font></th>
			<th align="center"><font size="2"><b>&nbsp;<%=hits%>&nbsp;</b></font></th>
		</tr>
		<tr>
			<td colspan="4" bgcolor="#fafafa">
			<table border=0 cellpadding=0 cellspacing=0>
				<tr><p>&nbsp;</p>
					<td><font size="2">&nbsp;&nbsp;<%=body%></font><p>&nbsp;</p></td>                       
				</tr>
			</table>
		</tr>
	</table>
	<p align=center><font size=2><a href="gongi.jsp">목록으로</a></font></p>
<%
	}
	rs.close(); 
	stmt.executeUpdate("update notice set hits=hits+1 where idnum="+bid+""); 
	stmt.close();
	pool.freeConnection("ora8", con); 
	} catch (Exception e) {
		out.println(e);
		}
%>
	</center>
<!--  공지 내용 보기 끝 -->	  
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>
