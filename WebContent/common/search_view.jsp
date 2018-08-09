<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*,oracle.dbpool.*"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<HTML>
	<HEAD>
		<TITLE>컴퓨터 전문쇼핑몰</TITLE>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 검색 시작 -->
<%
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

	Statement stmt=con.createStatement();
	Statement stmt1=con.createStatement();
	String s_word=new String(request.getParameter("srch_word").getBytes("8859_1"),"UTF-8");

	try {
		String name,company_id,expression,photo,category;
		int id,price,count;
		ResultSet rs=stmt.executeQuery("select id,name,price,company_id,expression,photo,category from product where name like UPPER('%"+s_word+"%') ");
		ResultSet rs1=stmt1.executeQuery("select count(*) from product where name like UPPER('%"+s_word+"%')");
		/* 쿼리에 UPPER을 주면서 대소문자 구분. */
		while(rs1.next()) {
		count=rs1.getInt(1);
%>   
		<%-- <center> --%>
		<font color=red><%= s_word %></font> 에 대한 
		<font color=red><%= count %></font> 개의 제품 검색결과 입니다!<br>
<%
		}
%>
		<table width=550 border=0 cellpadding=0 cellspacing=0 bgcolor=ffffff>
			<tr>
				<td align=center bgcolor=#0000ff height=25><font color=#ffffff><b>제품 카테고리</b></font></td>
			</tr>
			<tr><td height=5></td></tr>
		</table>
		<table border=0 cellpadding=0 cellspacing=1 width=550 bgcolor=#7aaad5>
			<tr bgcolor=#eff4f8 align=center> 
				<td height=30 width=100 bgcolor=#ffccff>&nbsp;상품이미지</td>
				<td height=30 bgcolor=#ffccff>&nbsp;상품명</td>
				<td height=30 bgcolor=#ffccff>&nbsp;가격</td>
			</tr>
<%
			while(rs.next()) {
				id=rs.getInt(1);
				name=rs.getString(2);
				price=rs.getInt(3);
				company_id=rs.getString(4);
				expression=rs.getString(5);
				photo=rs.getString(6);
				category=rs.getString(7);
%>
			<tr bgcolor="edf5fe"> 
				<td align=center><img border=0 name=PicMedium height=30 width=30 src="../product/image/<%=photo%>"></td>
				<td  height=30>&nbsp;&nbsp;&nbsp;&nbsp;<a href="../product/product.jsp?i=<%= id%>"> <%=name%></a></td>
				<td  height=30>
					   <c:set var="fmtPrice" value="<%=price%>"/> 
					   <font color=black>&nbsp;<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원</font>
				</td>	
			</tr>
<%	
			}
			rs.close();
			rs1.close();
			stmt.close();
			stmt1.close();
	} catch (Exception e) {
		out.println(e);
	} finally{
		pool.freeConnection("ora8", con);
	}
%>
		</table>
		<%-- </center> --%>
		<!--  검색 끝 -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>