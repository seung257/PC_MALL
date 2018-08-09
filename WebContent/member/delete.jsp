<%@ page contentType="text/html;charset=UTF-8" 
         import="java.sql.*,oracle.dbpool.*" 
         errorPage="error.jsp" %>

<% 
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

	String  uid = session.getAttribute("pid").toString();
	String sql = "delete from member where m_uid = ?";
    
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1,uid);

	pstmt.executeUpdate();
	session.invalidate();
	pstmt.close();
	pool.freeConnection("ora8", con); 
%>
	<script language=javascript>
		alert("회원정보를 삭제하였습니다.");
		document.location.href='../main/index.jsp';
	</script>