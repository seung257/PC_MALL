<%@ page language="java" import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%
     if( session.getAttribute("pid") == null) {
		response.sendRedirect("../main/index.jsp");
	 } else
		{	
%>

<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>

<SCRIPT language=JavaScript src="../common/u3.js"></SCRIPT>
     <link href="../common/u3.css" type=text/css rel=stylesheet>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- ====================================================================== -->
<%
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");//인자값 ora8

Statement stmt=null;
Statement stmt1=null;
ResultSet rs=null;
ResultSet rs3=null;

try {
	
		String pid =(String)session.getAttribute("pid");

		String productnum = request.getParameter("productnum");
		String membernum = request.getParameter("memebernum");
		if(membernum==null){membernum="888";}
		String name,company_id,expression,photo,category;
		int id,price,qty;
		int number=1;

		String sql3="select count(id) from basket";
		String sql5="select a.id,a.name,a.price,a.company_id,a.expression,a.photo,a.category,b.qty from product  a,basket  b where a.id=b.product_id and  b.temp2='C' and b.user_id='"+pid+"'";

		stmt=con.createStatement();
		stmt1=con.createStatement();
		rs3=stmt.executeQuery(sql3);
		int count=777;

		if(rs3.next()) {
			count=rs3.getInt(1);
			if(count==0){
				count=count+1;
			} else {
				rs3.close();
				count=count+1;    
				}
		} else {
			count=7777;   
		}
		rs=stmt1.executeQuery(sql5);
%>

<br><br>
<table border="0" cellpadding='0' cellspacing='0' width='620' align="center">
     <tr bgcolor=#7aaad5>
            <td align=middle bgcolor=#7aaad5><font color=#ffffff><b><%=pid%>님의 공동구매하는 목록입니다.</b></font></td>
	</tr>
</table>

<table border="0" cellpadding='0' cellspacing='3' width='620'  align="center">
	<tr> 
		<th bgcolor="#CC3300"><font color="#FFFFFF" size="2">상품명</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF"  size=2>수량</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>판매가(원)</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>합계</font></th>
	    <th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>취소</font></th>
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
			qty=rs.getInt(8);

%>

<form method="post" action="cart_modify.jsp?productnum=<%= id %>&<%=number%>&tag=on"> 
    <td  bgcolor="#E2EDFA" align="center"><a href="product.jsp?i=<%= id %>"><font size="2"><%=name%></font></a>
	</td>
	<td bgcolor="#E2EDFA" width="84" >
		<input type=text name=number value=<%=qty%> size="4">
		<input type=submit value="수정">
    </td>
</form>
	 
	<td  bgcolor="#E2EDFA" align="right" width="70">
		 <font size="2"><%= price %>원</font>
	</td>
    <td bgcolor="#E2EDFA" width="70" align="right">
		<font size="2"><%= price*qty %> 원</font>
	</td>

<form method="post" action="cart_delete.jsp?productnum=<%=id%>">
    <td width="1" bgcolor="#E2EDFA">
      <input type=hidden name="id" value="<%=id%>">
       <input type=hidden name="tag" value="on">
      <input type=submit value="삭제">
    </td>
</form>

</tr>

<%
	}

	rs3.close();
	rs.close();

	} catch (Exception e) {
	  out.println(e);
	} finally {
	if (stmt != null) stmt.close();
	if (stmt1 != null) stmt1.close();
	if (con != null) {
        pool.freeConnection("ora8", con); //연결 끊기
	}
}%>


</table>

<table width=620 cellspacing=0 cellpadding=0>
        <tr bgcolor=#7aaad5><td align=middle></td></tr>
</table>

<br>

<table align="center" border="0" width="200">
<tr >
	<td><a href="order_view_coo.jsp"><img src="../img/basket_approval.gif" border=0></a></td>
    <td><a href="cart_delete.jsp?productnum=deleteall&tag=on"><img src="../img/basket_del.gif" border=0></a></td>
	<td><a href="../main/index.jsp"><img src="../img/basket_shopping.gif" border=0></a></td>
</tr>
</table>
<!-- ======================================================================== -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>

<%}%>