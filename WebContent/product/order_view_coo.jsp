<%@ page language="java" import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>


<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>
<SCRIPT language=JavaScript src="../common/u3.js"></SCRIPT>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	
<!-- ======================================================================= -->
<%!
		String name,company_id,expression,photo,category;
		int id,price,qty;
		int number=1;
		int totalprice=0;
		int totalqty=0;

		String user_name,ssn,user_id,passwd,zip,address,e_mail,job,phone;
%>

<%
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");//인자값 ora8

Statement stmt=null;
ResultSet rs1=null;
ResultSet rs2=null;

String pid =(String)session.getAttribute("pid");
try {

	String sql1="select a.id,a.name,a.price,a.company_id,a.expression,a.photo,a.category,b.qty from product a, basket b where b.temp2='C' and a.id=b.product_id and b.user_id= '"+pid+"'";
	String sql2="select mem_name,mem_ssn,mem_uid,mem_pwd,mem_zip,mem_address,mem_phone,mem_email,mem_job from member where mem_uid ='"+ pid+ "'";

	stmt=con.createStatement();
	rs1=stmt.executeQuery(sql1);// 상품 정보 뿌리기

%>

<center>
		<table>
		<tr>
            <td width=600><b><font face="aroha" >&nbsp;[<%=pid%>]회원님의 주문하실 공동구매 내역입니다. </font></b></td>
            <td align=right>&nbsp;</td>
		</tr>
		</table>
<font size=2 color="#39599c"><b><%=pid%></b></font><font size=2>님이 주문하신 상품은 아래와 같습니다</font>
</center>


<table border="0" cellpadding='0' cellspacing='0' width='620' align="center">
		<tr>
            <TD align=middle bgColor=#7aaad5><FONT color=#ffffff><B><%=pid%>님의 주문하실 내역입니다.</B> </FONT></TD>
		</TR>
</table>

<table border="0" align="center" width="620">
	<tr>
		<th bgcolor="#CC3300"><font color="#FFFFFF" size=2>상품명</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>수량</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>판매가(원)</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>합계(수량*판매가)</font></th>
	</tr>
<%
		while(rs1.next()) {
			id=rs1.getInt(1);
			name=rs1.getString(2);
			price=rs1.getInt(3);
			company_id=rs1.getString(4);
			expression=rs1.getString(5);
			photo=rs1.getString(6);
			category=rs1.getString(7);
			qty=rs1.getInt(8);

			totalprice=totalprice +  (price*qty);
			totalqty = totalqty + (qty);
%>
	<tr>
		<td  bgcolor='#FFFFCC'><font size="2"><%= name %></font></td>
		<td  bgcolor='#FFFFCC' align=right><font size="2"><%= qty %>개&nbsp;</font></td> 
		<td  bgcolor='#FFFFCC' align=right width="70"><font size="2"><%=price%>원</font></td>
		<td  bgcolor='#FFFFCC' align=right width="120"><font size="2"><%=price*qty%>원</font></td>
	</tr>
		
<%
    }
%>
</table>
<table width=620 cellspacing=0 cellpadding=0>
        <TR bgColor=#7aaad5><TD align=middle></TD></TR>
</table>

<table align=center>
	<tr>
		<td>
			<font class="aroha"><%=pid%> 회원님이 구매하실 총수량은 [<%=totalqty%>개] 이고  결제하실금액은 [<%=totalprice%>원] 입니다.</font>
		</td>
	</tr>
</table>

<%
		rs1.close();
			
		rs2=stmt.executeQuery(sql2);
		if(rs2.next()){
			user_name=rs2.getString(1);
			user_id=rs2.getString(3);
			passwd=rs2.getString(4);
			zip=rs2.getString(5);
			address=rs2.getString(6);
			phone=rs2.getString(7);
			e_mail=rs2.getString(8);
		}
%>

<form name=reg method="post" action="order_com.jsp" >

<table border="0" cellpadding='0' cellspacing='0' width='620' align="center">
       <tr bgcolor=#7aaad5>
           <td align=middle bgcolor=#7aaad5><font color=#ffffff><b><%=pid%>님의 배송지 정보입니다.</b> </font></td>
		</tr>
</table>

<table width="500" border="1" cellspacing="3" cellpadding="0" align="center" background="#FFFFFF">
	<tr>
		<th colspan=2 align="center" bgcolor="#CC0099"><font color=white size=2>발 송 인 정 보</font></th>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>회원 이름</font></td>
		<td  bgcolor=F6F8FC><font size=2><%= user_name %></font></td>
	</tr>
	<tr>
	<td  bgcolor='#e2edfa' width=100><font size=2>회원 ID </font></td>
		<td  bgcolor=F6F8FC><font size=2><%= user_id %></font></td>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>E-mail</font> </td>
		<td  bgcolor=F6F8FC><font size=2><input type=text name=email size=40 value=<%= e_mail %>></font></td>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>주소</font> </td>
		<td  bgcolor=F6F8FC><font size=2><input type=text name=addr size=40  value=<%= address %>></font></td>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>전화번호 </font></td>
		<td  bgcolor=F6F8FC><font size=2><input type=text name=tel value=<%= phone %>></td></font>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>비고<br>(주문시전할말)</font></td>
		<td  bgcolor=F6F8FC><font size=2><textarea name="message" rows=3 cols=50></textarea></font></td>
	</tr>

	<tr>
		<td   bgcolor="white" colspan=2 align=center> 
			<input type=submit name=submit value="주문하기">
			<input type=reset name=reset value="다시쓰기">
		</td>

	</tr>
</table>

<table width=620 cellspacing=0 cellpadding=0>
    <tr bgcolor=#7aaad5>
        <td align=middle></td>
	</tr>
</table>
</form>
<%
	
	rs2.close();

	} catch (Exception e) {
	  out.println(e);
	} finally {
	if (stmt != null) stmt.close();
	if (con != null) {
     pool.freeConnection("ora8", con); 
	}
}%>
<!-- ================================== -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>