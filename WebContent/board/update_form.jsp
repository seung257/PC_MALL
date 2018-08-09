<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%!
String b_name ,b_email,b_title,b_content,b_date,b_ip,mailto;
 int b_id , b_hit , ref=0 ;
%>

 <%
try {
      
 //DB풀 메니저 객체 생성 사용
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");
     
   String bid=request.getParameter("b_id"); 

	Statement stmt = con.createStatement();
    stmt.executeUpdate("update re_board set b_hit=b_hit+1 where b_id="+bid+"");  //조회수를 올린다

	String sql="select b_id, b_name, b_email, b_title, b_content, to_char(b_date,'yy-mm-dd'),b_hit, b_ip, ref, step, anslevel, pwd  from re_board where b_id= "+bid; 

   ResultSet rs = stmt.executeQuery(sql);  
   if(rs.next()) {   
     b_id=rs.getInt(1);
     b_name=rs.getString(2);
     b_email=rs.getString(3);
     b_title=rs.getString(4);
     b_content=rs.getString(5);
     b_date=rs.getString(6);
     b_hit=rs.getInt(7)+1;
     b_ip=rs.getString(8);
     ref = rs.getInt(9);  // 글 그룹
     if(!b_email.equals("")) {
       mailto="(<font size=2><a href=mailto:"+b_email+">"+b_email+"</a></font>)";
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
<script>
function  go_update(){
 document.update_form.submit();
}
</script>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<br>
  <table border=1 width=550 height=30 bordercolor=black>
	<tr>
		<td align=center bgcolor=0063ce><font size=3 color=#FFFFFF><b>게시물 수정</b></td>
	</tr>
  </table><br>
<table width="550" border="1" cellspacing="0" cellpadding="0">
<form method="post" name="update_form" action="update.jsp">
	<tr class="term">
	   <td width=120 align=center bgcolor="#7eaee9">등록자</td>
	   <td width=170 bgcolor=ffffff>&nbsp;<input type="text" size=20 name="name" value="<%=b_name%>"></td>
	   <td width=120 align=center bgcolor="#7eaee9">등록일</td>
	   <td width=170 bgcolor=ffffff>&nbsp;<%=b_date%></td>
	</tr>	
	<tr class="term">
       <td width=120 align=center bgcolor="#7eaee9">E-Mail 주소</td>
       <td colspan=3 bgcolor=ffffff>&nbsp;<input type="text" size=50 name="email" value="<%=b_email%>"></td>
    </tr>
	<tr class="term">
	   <td width=120 align=center bgcolor="#7eaee9">비밀번호</td>
	   <td colspan=3 bgcolor=ffffff>&nbsp;<input type="password" size=10 name="pwd" ></td>
	</tr>
	<tr class="term">
	   <td width=120 align=center bgcolor="#7eaee9">제 목</td>
	   <td  colspan=3 bgcolor=ffffff>&nbsp;<input type="text" size=50 name="title" value="<%=b_title%>"></td>
	</tr>	
	<tr class="term">
	   <td width=120 align=center bgcolor="#7eaee9">내 용</td>
	   <td width=440 colspan=3 bgcolor=ffffff>
	   <table>
	      <tr>
	        <td>
		         <textarea cols=58 rows=15 name="content"><%=b_content%></textarea>
	        </td>
	      </tr>
	   </table>
	   </td>
	</tr>

     <tr>
	   	<td colspan=4 align=right height=25>
	         <a href="javascript:go_update()"><img src="img/b_edit.gif" border=0></a>
		     <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
  	   	</td>
      </tr>

	<input type="hidden" name="b_id" value="<%=b_id%>">
</form>
</table>
</center>
		<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>
