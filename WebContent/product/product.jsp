<%@ page language="java" import="java.sql.*,oracle.dbpool.*"  contentType="text/html;charset=UTF-8" %>

<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>
  <link href="../common/u3.css" type=text/css rel=stylesheet>

<script language=javascript src="../common/u3.js"></script>
</head>

<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 상품상세정보 표시 -->
<%
	int productid = 0;
	String name,company_id,expression,photo,category,cdate;
	int id,price,code;

	Statement stmt=null;
	ResultSet rs=null;

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
    
	try {
		 productid = Integer.parseInt(request.getParameter("i"));
		String pid= (String)session.getAttribute("pid");
	
		String sql1="select id,name,price,company_id,expression,photo,cname,code,cdate from product_view where id ="+ productid;
		stmt=con.createStatement();
		rs=stmt.executeQuery(sql1);
		while(rs.next()) {
			id = rs.getInt(1);
			name = rs.getString(2);
			price = rs.getInt(3);
			company_id = rs.getString(4);
			expression = rs.getString(5);
			photo = rs.getString(6);
			category = rs.getString(7);
			code = rs.getInt(8);
			cdate = rs.getString(9);
%>

<br><br>
<table border=0 cellpadding=0 cellspacing=0 width=605 align=center>
   <tr bgcolor=#7aaad5 height=30>
       <td  colspan=3 align=center bgcolor="#0000ff"><font color="#ffffff"><b> [<%= name %>]상세 상품 정보</b></font></td>
  </tr>
</table><br>
	
<table border=1 align=center cellpadding=0 cellspacing=0 width=600>
 <tbody> 
    <tr> 
      <td valign=top> 
        <table border=0 cellpadding=0 cellspacing=0 width=200>
          <tr> 
            <td valign=top><img border=0 name=picmedium height=200 width=200 src="image/<%=photo%>"></td>
          </tr>
         </table>
      </td>

      <td> 
        <table border=1 cellpadding=0 cellspacing=0 width=400>
          <tr> 
              <td colspan=2 align=center  bgcolor=#00ff66 width=400><font size=3><b><%=name%></b></font></td>
		 </tr>
          <tr>
                  <td width=90>&nbsp; 상품분류</td>
                  <td width=280>&nbsp;[<%= category %>]</td>
          </tr>
          <tr>
                  <td width=90>&nbsp; 가       격</td>
                  <td width=280>&nbsp;[<%=price%>원]</td>
          </tr>
           <tr> 
                  <td>&nbsp; 제조 회사</td>
                  <td>&nbsp;<%=company_id  %></td>
          </tr>
          <tr> 
                  <td>&nbsp; 상품 코드</td>
                  <td>&nbsp;<%= code%></td>
           </tr>
            <tr> 
                  <td>&nbsp; 등  록  일</td>
                  <td>&nbsp;<%= cdate %></td>
           </tr>
          <tr> 
            <td>&nbsp; 상세 설명</td>
            <td>&nbsp;<%=expression%></td>
          </tr>
        <tr>
            <td height=50 ><img src="../img/b_white_1.gif"></td>
            <td align=right><a  href="check.jsp?productnum=<%= productid %>"><img src="../img/basket_1.gif"></a>
          </tr>
        </table>
      </td>
    </tr>
    </tbody> 
</table>

<%}
	rs.close();
	} catch (Exception e)
	{System.out.println(e);
	} finally{
	if (stmt != null) stmt.close();
	if (con != null) {
		 pool.freeConnection("ora8", con);
		}
}%>
<!-- 상품상세정보 표시 끝 -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>