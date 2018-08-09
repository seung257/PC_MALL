<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*,oracle.dbpool.*,java.util.*" %>

<HTML>
	<HEAD>
		<TITLE>카테고리 전제 항목 보기</TITLE>
		<script language=javascript src="../common/u3.js"></script>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 >
	<jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 상품 분류 --> 
<%
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

	try {
		String newnum = request.getParameter("c");
		String newnum2="4";

		int intnum = Integer.parseInt(newnum);

		switch(intnum){
			case 1  : newnum="1" ; newnum2="18"; break;
			case 19 : newnum="19"; newnum2="22"; break;
			case 23 : newnum="23"; newnum2="25"; break;
			case 26 : newnum="26"; newnum2="29"; break;
			case 34 : newnum="34"; newnum2="36"; break;
			case 37 : newnum="37"; newnum2="39"; break;
			default : newnum="30"; newnum2="33"; break;
		}
	
		String name,photo,c_name="";
		int id,price;

		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id, name, price, photo, cname from product_view where category  between "+ newnum + " and " + newnum2 );
%>
		<table width=550 border=0  cellpadding=0 cellspacing=0 bordercolor="#ffffff" align=center>
			<tr>
				<td valign="top"></td><br>
			<tr bgcolor=#7aaad5 height=30>
				<td colspan=3 align=center bgcolor=#0000ff><font color=#ffffff><b>상품 검색 결과</b> </font></td>
			</tr>
			<tr><td height=10></td>
			</tr>
			<tr>
				<td colspan=3>
					<table border=0 cellpadding=0 cellspacing=1 width=550 bgcolor=#7aaad5>
						<tr bgcolor=#ffcccc align=center> 
							<td height=25 width=80 align=center>상품이미지</td>
							<td height=25  align=center>상품명</td>
							<td height=25 align=center>가격</td>
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
<!-- 상품 분류 끝 -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>