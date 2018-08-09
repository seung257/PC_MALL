<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*,oracle.dbpool.*"  %>

<%
     if( session.getAttribute("pid") == null) {
%>
	 <script language="Javascript">
		 alert("로그인을 하세요")
		location.href="../member/login.jsp";
     </script>
<%
	 } else {
%>

<HTML>
	<HEAD>
		<TITLE>컴퓨터전문쇼핑몰</TITLE>
      <link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
        <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 장바구니목록 표시-->
<%
		String pid =(String)session.getAttribute("pid");
		String productnum = request.getParameter("productnum");
		String membernum = request.getParameter("memebernum");
		if(membernum==null){membernum="888";}
		String name,company_id,expression,photo,category;
		int id,price,qty;
		int number=1;

		String sql3="select count(id) from basket";
		String sql5="select id,name,price,qty from basket_view where user_id='"+pid+"'";
try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");

		Statement stmt=con.createStatement();
		Statement stmt1=con.createStatement();

		ResultSet  rs3=stmt.executeQuery(sql3);
		int count=77;

		if(rs3.next()) {
			count=rs3.getInt(1);
			if(count==0) {
				count=count+1;
			} else {
				count=count+1;    
				}
		} else {
			count=777;   
		}
		ResultSet rs=stmt1.executeQuery(sql5);
%>

<br>
<table border=1 cellpadding=0 cellspacing=0 width=550 align=center>
	<tr bgcolor=#7aaad5>
		<td height=30 align=middle bgcolor=#ccffff><font size=3 color=#000000><b>[<%=pid%>]님의 장바구니입니다.</b></font></td>
	</tr>
</table>

<table border=1 cellpadding=0 cellspacing=3 width=620  align=center>
	<tr height=23> 
		<th bgcolor="#0066ff"><font color="#ffffff" >상품명</font></th>
		<th  bgcolor="#0066ff"><font color="#ffffff">수량</font></th>
		<th  bgcolor="#0066ff"><font color="#ffffff">판매가</font></th>
		<th  bgcolor="#0066ff"><font color="#ffffff"> 합계금액</font></th>
		<th  bgcolor="#0066ff"><font color="#ffffff">취소</font></th>
	</tr>
<%
	while(rs.next()) {
		id=rs.getInt(1);
		name=rs.getString(2);
		price=rs.getInt(3);
		qty=rs.getInt(4);
%>
	<tr>   
	<form method="post" action="basket_modify.jsp?productnum=<%= id %>&<%=number%>"> 
		<td  bgcolor="#ffffcc" align=center><a href="product.jsp?i=<%= id %>"><%=name%></a></td>
		<td bgcolor="#e2edfa" width=84 >
			<input type=text name=number value=<%=qty%> size=4>
			<input type=submit value="수정">
		</td>
	</form>
		<td  bgcolor="#e2edfa" align=right width=70><%= price %>원</font></td>
		<td bgcolor="#e2edfa" width=70 align=right><%= price*qty %> 원</font></td>
	<form method=post action="basket_delete.jsp?productnum=<%=id%>">
		<td width=1 bgcolor="#e2edfa">
		<input type=hidden name="id" value="<%=id%>">
		<input type=submit value="삭제">
		</td>
	</form>
	</tr>
<%	}	%>
</table><br>
<%
	rs3.close();
	rs.close();
	stmt.close();
	stmt1.close();
		pool.freeConnection("ora8", con); 
	} catch (Exception e) {
	  out.println(e);
		} 
%>
<table align=center border=0 width=200>
<tr >
	<td><a href="order_view.jsp"><img src="../img/basket_approval.gif" border=0></a></td>
    <td><a href="basket_delete.jsp?productnum=deleteall"><img src="../img/basket_del.gif" border=0></a></td>
	<td><a href="../main/index.jsp"><img src="../img/basket_shopping.gif" border=0></a></td>
</tr>
</table>

<!-- 장바구니목록 표시 끝 -->
   <jsp:include page="../common/basic_copyright.jsp" flush="true"/>

<% } %>
</BODY>
</HTML>
