<%@ page contentType="text/html;charset=UTF-8" 
		 import="java.sql.*,oracle.dbpool.*"
		 errorPage="error.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<HTML>
   <HEAD>
      <TITLE> 회원 가입 처리 </TITLE>
   </HEAD>
<BODY>

<%
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

     String mem_uid   = request.getParameter("uid");
     String mem_pwd   = request.getParameter("pwd");
     String mem_name  = request.getParameter("name");
     String mem_email = request.getParameter("email");
     String mem_ssn   = request.getParameter("ssn1") +"-"+request.getParameter("ssn2");
     String mem_addr  = request.getParameter("addr");
     String mem_zip   = request.getParameter("zip1") + "-" + request.getParameter("zip2");
     String mem_phone = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
     String mem_job   = request.getParameter("job");

	try {
		Statement stmt = con.createStatement();
        ResultSet rs=stmt.executeQuery("select m_uid from member where m_uid='"+mem_uid+"'");

		if(rs.next()) {
			rs.close();
%>
        <script language=javascript>
                alert("중복되는 아이디가 존재합니다.");
                history.back();
        </script>
<%
        } else {
			// String sql = "insert into member values (?,?,?,?,?,?,?,sysdate,?,sysdate,?,?)";
        	String sql = "insert into member (m_uid, m_pwd, m_name, m_ssn, m_email, m_phone, m_job, m_visit, m_zip, m_address, m_regdate, m_lastvisit )";
        	       sql += " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_uid);
			pstmt.setString(2, mem_pwd);
			pstmt.setString(3, mem_name);
			pstmt.setString(4, mem_ssn);
			pstmt.setString(5, mem_email);
			pstmt.setString(6, mem_phone);
			pstmt.setString(7, mem_job);
			pstmt.setInt(8, 0);
	        pstmt.setString(9, mem_zip);
			pstmt.setString(10, mem_addr);
			pstmt.executeUpdate();
			
			session.setAttribute("uid", mem_uid);
			pstmt.close();
			rs.close();
			stmt.close();
			pool.freeConnection("ora8", con); 
%>
			<script language=javascript>
				alert("회원가입을 축하합니다.");
				document.location.href='../main/index.jsp';
			</script>
<%
		}
	} catch (SQLException e) {
		pool.freeConnection("ora8", con);
%>
		<script language=javascript>
			alert("회원가입이 실패하였습니다. 다시 시도해 보시기 바랍니다.");
			document.location.href='../main/index.jsp';
		</script>
<%
		}
%>
</BODY>
</HTML>