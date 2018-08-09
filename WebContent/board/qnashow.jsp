<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%!
	String name, email, title, body,cdate,mailto;
    int qnaid, hits;
 %>
<%
	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		String qnaid=request.getParameter("qnaid"); 

		Statement stmt = con.createStatement();
		stmt.executeUpdate("update qna set hits=hits+1 where qnaid="+qnaid+"");  //조회수를 올린다

		String sql="select qnaid, title, name, email,body, hits, to_char(cdate,'yy-mm-dd') from qna where qnaid="+qnaid; 

        ResultSet rs = stmt.executeQuery(sql);  
        if(rs.next()) {   
//           qnaid=rs.getInt(1);
           title=rs.getString(2);
           name=rs.getString(3);
           email=rs.getString(4);
           body=rs.getString(5);
           hits=rs.getInt(6)+1;
           cdate=rs.getString(7);
           if(!email.equals("")) {
                        mailto="(<font size=2><a href=mailto:"+email+">"+email+"</a></font>)";
                } else {
                        mailto="";
                }
		}
      rs.close(); 
	  stmt.close();
      pool.freeConnection("ora8", con);
} catch (Exception e) {
	out.println(e);
}
%>	    

<html>
<head><title>컴퓨터전문쇼핑몰</title>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
</head>

<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
		<jsp:include page="../common/basic_screen.jsp" flush="true"/>

<table width="630" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align=center><br><br>
      <table border="0" width="550" cellpadding="0" cellspacing="0" align="center">
		<tr bgcolor="#0000FF" valign="top"  height=25>
		  <td width=510 align="center" valign="bottom"><font color="#ffffff"><b>
					게시물 읽기</b></font>
     	   </td>
        </tr>
		<tr>
			<td align=center width=550 colspan=3>
			<table border=0 cellspacing=1 cellpadding=0 bgcolor=#189a5a width=550>
				<tr class="term">
				   <td width=100 align=center bgcolor="#ffffcc">등록자</td>
				   <td width=175 bgcolor=ffffff>&nbsp;<%=name%></td>
				   <td width=100 align=center bgcolor="#ffffcc">등록날짜</td>
				   <td width=175 bgcolor=ffffff>&nbsp;
				   <%=cdate%>
				   </td>
				</tr>	
				<tr class="term">
				   <td width=100 align=center bgcolor="#ffffcc">제 목</td>
				   <td width=450 colspan=3 bgcolor=ffffff>&nbsp;<%=title%></td>
				</tr>	
				<tr class="term">
				   <td width=100 align=center bgcolor="#ffffcc">E-mail</td>
				   <td width=450 colspan=3 bgcolor=ffffff>&nbsp;
				    <a href="mailto:<%=email%>"><%=email%></a></td>
				</tr>	
				<tr class="term">
				   <td width=100 align=center bgcolor="#ffffcc">내 용</td>
				   <td width=450 colspan=3 bgcolor=ffffff>
				   <table>
				      <tr>
				         <td bgcolor=ffffff width=450><%=body%></td>
				      </tr>
				   </table>
				   </td>
				</tr>
			  </table>
			</td>
    	  </tr>
		  <tr height=2 bgcolor="#0033ff">
		     <td valign="bottom" colspan="3">
		       </td>
		  </tr>
		  <tr>
		   	<td colspan=3 align=right height=28 valign=bottom>
		   	  <a href="qnareply_form.jsp?b_id=<%=qnaid%>"><img src="img/j_bt07.gif" border=0></a>
			  <a href="qnaupdate_form.jsp?b_id=<%=qnaid%>"><img src="img/j_bt08.gif" border=0></a>
			  <a href="qnadelete_form.jsp?b_id=<%=qnaid%>"><img src="img/j_bt09.gif" border=0></a>
			  <a href="javascript:history.go(-1)"><img src="img/m_bt06.gif" border=0></a>
		   	</td>
		  </tr>
		</table>
	  </td>
	</tr>
</table>
           
	<%-- 	<jsp:include page="../common/main_copyright.jsp" flush="true"/> --%>

</body>
</html>
