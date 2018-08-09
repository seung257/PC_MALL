<%@ page  contentType="text/html;charset=euc-kr" import="java.sql.*,oracle.dbpool.*" %> 

<HTML>
	<HEAD>
		<TITLE>컴퓨터전문쇼핑몰</TITLE>
		<script language=JavaScript src="../common/u3.js"></script>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	
<!--  신상품 화면    -->
	<!-- <center> --><br>
	<table border=1 width=500 height=30>
		<tr>
			<td align=center bgcolor=0063ce><font size=2 color=white><b>신 상 품</b></td>
		</tr>
	</table><br>
	<table width="500" border=0 cellpadding=1 cellspacing=1>
<%
	try {
		String name,company_id,expression,photo;
		int id,price;
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id,name,price,company_id,expression,photo from product order by cdate desc, id desc");
		
		int flag=0;
        int stop = 1;		
		while(rs.next())  {
			id=rs.getInt(1);
			name=rs.getString(2);
			price=rs.getInt(3);
			company_id=rs.getString(4);
			expression=rs.getString(5);
			photo=rs.getString(6);
		if(flag==0){
%>
		<tr>
			<td>
				<!-- ========= 왼쪽 테이블 ========== -->
				<table width="250" border=1 cellpadding=1 cellspacing=2 align=center bordercolor=#990000>
				<tr>
					<td colspan=2 align="center"><a href="../product/product.jsp?i=<%= id%>">
					<img src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
				</tr>
				<tr>
					<td width=60 align=right bgcolor=#7eaee9>상품명</td>
					<td bgcolor=cde6ff>&nbsp;&nbsp;<%=name%></td>
				</tr>
				<tr>
					<td width=60 align=right bgcolor=#7eaee9>가격</td>
					<td bgcolor=cde6ff>&nbsp;&nbsp;<%=price%>&nbsp;원</td>
					<td>
				<c:set var="fmtPrice" value="<%=price%>"/>
				<font color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원]</font>
				</td>
				</tr>
				<tr>
					<td width=60 align=right bgcolor=#7eaee9>제조회사</td>
					<td bgcolor=cde6ff>&nbsp;&nbsp;<%=company_id%></td>
				</tr>
				<tr>
					<td width=60 align=right><font  color=blue>제품설명</font></td>
					<td>&nbsp;&nbsp;<%=expression%></td>
				</tr>
				</table>
			    <!-- 끝 -->
<%      
		flag=1;            

		} else {
%>
		</td>
		<td>
			<!-- 오른쪽  테이블 -->
			<table width="250" border=1 cellpadding=1 cellspacing=2 align=center bordercolor=#990000>
			<tr>
				<td colspan=2 align="center"><a href="../product/product.jsp?i=<%= id%>">
				<img src="../product/image/<%=photo%>" width=100 height=100 border=0></a></td>
			</tr>
			<tr>
				<td width=60 align=right bgcolor=#7eaee9>상품명</td>
				<td bgcolor=cde6ff>&nbsp;&nbsp;<%=name%></td>
			</tr>
			<tr>
			
				<td width=60 align=right bgcolor=#7eaee9>가격</td>
				<td bgcolor=cde6ff>&nbsp;&nbsp;<%=price%>&nbsp;원</td>
				
			</tr>
			<tr>
				<td width=60 align=right bgcolor=#7eaee9>제조회사</td>
				<td bgcolor=cde6ff>&nbsp;&nbsp;<%=company_id%></td>
			</tr>
			<tr>
				<td width=60 align=right><font color=blue>제품설명</td>
				<td>&nbsp;&nbsp;<%=expression%></td>
			</tr>
			</table>
			<!--끝 -->	
		</td>
	</tr>
<%
	flag=0;

     stop = stop + 1;
	 if( stop > 2) break;
	} //while
	} //try
        rs.close(); 
        stmt.close();
	 pool.freeConnection("ora8", con);
} catch (Exception e) {
	out.println(e);
}
%>
	</table>
	<!-- </center>  --> 

<!--  화면 끝   -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>