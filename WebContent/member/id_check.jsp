<%@ page contentType="text/html;charset=UTF-8" 
                 import="java.sql.*,java.util.*,oracle.dbpool.*"
            errorPage="error.jsp" %>
<HTML>
   <HEAD>
      <TITLE> ID 중복 체크 </TITLE>
   </HEAD>

<BODY>

<%
     DBConnectionManager pool = DBConnectionManager.getInstance();
     Connection con = pool.getConnection("ora8");
     String sql = "select count(m_uid) from member where m_uid = '";
            sql = sql + request.getParameter("uid") + "'";
       Statement stmt = con.createStatement();
       ResultSet rs = stmt.executeQuery(sql);

       rs.next();
       if(rs.getInt(1) > 0) {
 %>
      <center>
         <h4>아이디(id) 중복 !!!</h4>
         <img src="img/warning.gif"><br><br>
         <font size=2>입력한 아이디(id)는 사용중입니다.</font><br>
         <a href="JavaScript:window.close()">닫기</a>
      </center>
<%
       } else {
%>
      <center>
         <h4>사용 가능합니다 !!!</h4>
         <img src="img/cong.gif"><br><br>
         <font size=2>입력한 아이디(id)는 사용 가능합니다.</font><br>
         <a href="JavaScript:window.close()">계속하기</a>
      </center>
<%
       }
     rs.close();
     stmt.close();
     pool.freeConnection("ora8", con);
%>
</BODY>
</HTML>