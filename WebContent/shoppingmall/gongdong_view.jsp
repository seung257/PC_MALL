<%@ page import="java.sql.*,oracle.dbpool.*"
		 contentType="text/html;charset=UTF-8"  %>

<html>
	<head>
		<title>컴퓨터 전문쇼핑몰</title>
			<SCRIPT language=JavaScript src="../common/u3.js"></SCRIPT>
				<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
        <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!--  공동구매보기 넣기   -->
	<center><br>
	  <table border=1 width=550 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=0063ce><font size=2 color=white><b>공 동 구 매</b></td>
		</tr>
	  </table>
	  <br>
<%
try {
        String name,company_id,content,deadline,photo;
		int id,price,coo_price,quantity,coo_quantity;
        
        String bid=request.getParameter("bid"); 

      		 //DB풀 메니저 객체 생성 사용
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");//인자값 ora8

        Statement stmt=con.createStatement();

		String sql="select id,name,company_id,price,coo_price,quantity,coo_quantity,content, to_char(deadline,'yy-mm-dd'),PHOTO from coo_product where id="+bid; 
        
		ResultSet rs = stmt.executeQuery(sql);  
        if(rs.next()) {   
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
                
%>	
	
	공동구매 기간: 2005년 3월 31일 까지
    <br><br>
      <table border=1 width=550 height=200 cellpadding=1 cellspacing=1>
		<tr>
		<td rowspan=7 width=220 align=center><img src="../productimg/<%=photo%>" width=200 height=180></td>
		<td align=right  bgcolor=#ffff99>마감날짜</td>
		<td>&nbsp;<%=deadline%></font></td>
		</tr>
		<tr>
		<td align=right  bgcolor=#ffff99>제품명</td>
		<td>&nbsp;<%=name%></td>
		</tr>
		<tr>
		<td align=right  bgcolor=#ffff99>제조회사</td>
		<td>&nbsp;<%=company_id%></td>
		</tr>
		<tr>
		<td align=right  bgcolor=#ffff99>공동구매가격</td>
		<td>&nbsp;<%=coo_price%></td>
		</tr>
		<tr>
		<td align=right  bgcolor=#ffff99>신청수량</td>
		<td>&nbsp;<%=coo_quantity%></td>
		</tr>
		<tr>
		<td align=right  bgcolor=#ffff99>제품설명</td>
		<td>&nbsp;<%=content%></td>
		</tr>
		<tr>
		<td colspan=2 height=50 align=center><a href="../product/check.jsp?productnum=<%=id%>">공동구매 참가하기<a>
		</td>
		</tr>
	  </table>
		<p>&nbsp;</p>
	  <%
    }
        rs.close(); 
        stmt.close();
   pool.freeConnection("ora8", con); 
} catch (Exception e) {
	out.println(e);
}
%>
	  </center>
<!-- 공동구매보기 끝  -->
	  
   <jsp:include page="../common/basic_copyright.jsp" flush="true"/>

</body>
</html>
 