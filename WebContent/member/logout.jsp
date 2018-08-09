<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션 제거
    session.invalidate();

    if( application.getAttribute("admincount") != null) {
		Integer rm1 = (Integer)application.getAttribute("admincount");
		int s = rm1.intValue(); 
		Integer rm2 = new Integer(--s);
    	application.setAttribute("admincount",rm2);
	}				
%>
<script language="javascript">
    alert('로그아웃 되었습니다.');
    location.href="../main/index.jsp";
</script>    