<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*,oracle.dbpool.*,java.util.*" %>

<HTML>
	<HEAD>
		<TITLE>카테고리별 상품목록 보기</TITLE>
	<script language=JavaScript src="../common/u3.js"></script>
	<link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 >
	<jsp:include page="../common/basic_screen.jsp" flush="true"/>
<%
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
	try {
		String newnum = request.getParameter("c");
		String name,photo,c_name="";
		int id,price;
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id, name, price, photo, cname from product_view where category  = "+ newnum );
%>
<!-- 카테고리별 상품목록 --> 
<table width=630 border=0  cellpadding=0 cellspacing=0 bgcolor="#ffffff">
	<tr bgcolor=ffffff>
		<td valign="top">
			<table border=0 cellpadding=0 cellspacing=0 width=550 align=center bgcolor=ffffff>
			<br>
				<tr bgcolor=#7aaad5 height=25>
					<td colspan=3 align=center bgcolor=#0000ff><font color=#ffffff><b>카테고리 분류</b></font></td>
				</tr>
				<tr><td height=10></td></tr>
				 <tr>
					<td colspan=3>
						<table border=0 cellpadding=0 cellspacing=1 width=550 bgcolor=#7aaad5>
							<tr bgcolor=#ffcccc align=center> 
								<td height=25 width=80>&nbsp;상품이미지</td>
								<td height=25>&nbsp;상품명</td>
								<td height=25>&nbsp;가격</td>
							</tr>
<%
						while(rs.next()) {
							id = rs.getInt(1);
							name = rs.getString(2);
							price = rs.getInt(3);
							photo = rs.getString(4);
							c_name = rs.getString(5);
%>
						<tr bgcolor="#eff4f8"> 
							<td align=center><img border=0 name=PicMedium height=30 width=30 src="image/<%=photo%>"></td>
							<td  height=30>&nbsp;<a href="product.jsp?i=<%= id %>">[<%= c_name %>]&nbsp;<%= name %></font></a></td>
							<td  height=30>&nbsp;<%= price %>원</font></td>
						</tr>
<%	
		}
		rs.close();
		stmt.close();
	} catch (Exception e) {
		out.println(e);
	} finally{
		pool.freeConnection("ora8", con);
	}
%>
						</table>
					</td>
				</tr>
			</table><br>
		</td>
	</tr>
</table>
<!-- 카테고리별 상품목록 끝 -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>
