<%@ page contentType="text/html;charset=UTF-8"  
            import="java.sql.*,oracle.dbpool.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	DBConnectionManager pool=DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	String rr="Yes";
	String user_id=(String)session.getAttribute("pid");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("tel");
	String mess = request.getParameter("message");

	String sql = " update basket set  gubun='"+rr+"' ,message='"+mess+"' where user_id ='"+user_id+"'";
	String sql1 = "update member set mem_email=?, mem_address=?, mem_phone=? ";
			 sql1 = sql1 + " where mem_uid ='"+user_id+"'";
	try{
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);

		PreparedStatement pstmt1 = con.prepareStatement(sql1);
		pstmt1.setString(1, email);
		pstmt1.setString(2, addr);
		pstmt1.setString(3, phone);
		pstmt1.executeUpdate();

		stmt.close();
   		pstmt1.close();
		con.commit();
		pool.freeConnection("ora8", con); 
	} catch (SQLException e){ }
%>

<HTML>
	<HEAD><TITLE>컴퓨터전문쇼핑몰</TITLE>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>
<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<jsp:include page="../common/basic_screen.jsp" flush="true"/>
	<br><br>
	<table cellpadding=0 cellspacing=0 border=1 width=330>
		<tr bgcolor=#0033FF>
			<td height=30 align=center><font color="#ffffff"><b>주문 처리 완료</b></font></td>
		</tr>
		<tr height=60 align=center bgcolor=#ffff33>
			<td><font size=3>입금기간 : 주문일로부터 3일이내<br>배송기간 : 결제 확인후 2일이내</font><br></td>
		</tr><br>
		<tr> 
			<td align=center><img src="../img/thanks.gif" width="150" height="150"></td>
		</tr>
		<tr bgcolor="#ffffff">
			<td align="center"><%= user_id %>님<br>저희 사이트를 이용해 주셔서 감사합니다.<br></td>
		</tr>
		<tr  bgcolor="#00ff33"><td height=30 align=center>
				<a href="../main/index.jsp"><font size=3><b>[계속 쇼핑하기]</b></a>
			</td>
		</tr>
</table>
   <jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>
