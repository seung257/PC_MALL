<%@ page language="java" import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<html>
<head>
<title>컴퓨터전문쇼핑몰</title>

<script language=Javascript>

function mywinopen() {
    mywin=window.open("pop.html","new","width=400,height=180");  
}
function mywinclose() {
    mywin.close();    
}

</script>
<link href="../common/u3.css" type=text/css rel=stylesheet>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
        <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 공동구매 화면 설계  -->
	 <center><br>
	  <table border=1 width=550 height=25 bordercolor=black>
		<tr>
			<td align=center bgcolor=0063ce><font size=2 color=white><b>공 동 구 매</b></td>
		</tr>
	  </table>
	  <br>

	  <table border=1 width=270 height=40 bgcolor=#CCFFFF>
		<tr>
			<td><font size=2>&nbsp;입금기간 : 주문일로부터 2일이내 <br>&nbsp;배송기간 : 결제확인 후 3일이내</font><br></td>
		</tr>
		</table>
		<br>
	 <table width=600 border=0 >
<%
try {
		String name,company_id,content,deadline,photo;
		int id,price,coo_price,quantity,coo_quantity;

		 //DB풀 메니저 객체 생성 사용
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");//인자값 ora8

        Statement stmt=con.createStatement();

		ResultSet rs=stmt.executeQuery("select id,name,company_id,price,coo_price,quantity, coo_quantity,content,to_date(deadline,'yy-mm-dd'),photo from coo_product");
		
		int flag=0;

		while(rs.next()) {
			id=rs.getInt(1);
			name=rs.getString(2);
			company_id=rs.getString(3);
			price=rs.getInt(4);
			coo_price=rs.getInt(5);
			quantity=rs.getInt(6);
			coo_quantity=rs.getInt(7);
			content=rs.getString(8);
			deadline=rs.getString(9);
			photo=rs.getString(10);

		if(flag==0) {					
%>
	  <tr>
		<td>

<!--  1번 테이블  -->
      <table width=200  border=1 cellpadding=1 cellspacing=2>
	    <tr>
			<td colspan=2 bgcolor=#ffccff align=center>[<%=company_id%>]<%=name%></td>
		</tr>
		<tr>
			<td colspan=2 align=center><a href="gongdong_view.jsp?bid=<%=id%>"><img src="../productimg/<%=photo%>" width=100 height=100 border=0>
			</a></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>공동구매가</td>
			<td width=80><font color=red><%=coo_price%></font></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>시중가</td>
			<td width=80><%=price%></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>한정수량</td>
			<td width=80><%=quantity%></td>
		</tr>
		<tr>
		   <td width=120 bgcolor=#ffff99>신청수량</td>
		   <td width=80><font color=red><%=coo_quantity%></font></td>
		</tr>
	   </table>
		<br>
<!--  1번 테이블 끝  -->
	</td>
<%   
	flag=1;
		}
	
	else if(flag==1) {
%>
	<td>

<!--  2번 테이블  -->
      <table width=200  border=1 cellpadding=1 cellspacing=2>
	    <tr>
			<td colspan=2 bgcolor=#ffccff align=center><font size=2>[<%=company_id%>]<%=name%></font></td>
		</tr>
		<tr>
			<td colspan=2 align=center><a href="gongdong_view.jsp?bid=<%=id%>"><img src="../productimg/<%=photo%>" width=100 height=100 border=0>
			</a></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>공동구매가</td>
			<td width=80><font  color=red><%=coo_price%></font></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>시중가</td>
			<td width=80><%=price%></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>한정수량</td>
			<td width=80><%=quantity%></td>
		</tr>
		<tr>
		   <td width=120 bgcolor=#ffff99>신청수량</td>
		   <td width=80><font color=red><%=coo_quantity%></font></td>
		</tr>
	   </table>
		<br>
<!--  2번 테이블 끝  -->
	</td>
<%   flag=2;
	}
    else {
%>
	<td>
	
<!-- 3번 테이블  -->
    <table width=200  border=1 cellpadding=1 cellspacing=2>
	    <tr>
			<td colspan=2 bgcolor=#ffccff align=center>[<%=company_id%>]<%=name%></td>
		</tr>
		<tr>
			<td colspan=2 align=center><a href="gongdong_view.jsp?bid=<%=id%>"><img src="../productimg/<%=photo%>" width=100 height=100 border=0>
			</a></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>공동구매가</td>
			<td width=80><font color=red><%=coo_price%></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>시중가</td>
			<td width=80><%=price%></td>
		</tr>
		<tr>
			<td width=120 bgcolor=#ffff99>한정수량</td>
			<td width=80><%=quantity%></td>
		</tr>
		<tr>
		   <td width=120 bgcolor=#ffff99>신청수량</td>
		   <td width=80><font  color=red><%=coo_quantity%></font></td>
		</tr>
	   </table>
		<br>
<!--  3번 테이블 끝  -->
	
	</td>
	</tr>
<%  flag=0; }
%>

	<%
		}  //while 닫기
		rs.close();
		stmt.close();
 pool.freeConnection("ora8", con); //연결 끊기
   
   } //try 닫기
   catch(Exception e) {
	   out.println(e);
   }
%>
	</table>
	

<!-- ================================ 여기까지 공동구매 =================================   -->
   <jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>
