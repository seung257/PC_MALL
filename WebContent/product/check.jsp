<%@ page contentType="text/html;charset=UTF-8" %>

<%  
	String productnum= request.getParameter("productnum");

	if(session.getAttribute("pid") == null) {
%>
		<script language=javascript>
		alert("로그인을 하셔야 합니다.");	    
		location.href="../member/login.jsp";
		</script> 
<%
	} else {
		response.sendRedirect("../product/basket_insert.jsp?productnum="+productnum);
	}
%>
