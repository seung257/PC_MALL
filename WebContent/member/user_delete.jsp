<%@ page contentType="text/html;charset=UTF-8"  %>

<%
     if( session.getAttribute("pid") == null) {
%>
    <script language="Javascript">
	   alert("로그인을 하세요")
	   location.href="../member/login.jsp";
    </script>
<%
	} else {
%>

<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>
	<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	<SCRIPT language=JavaScript src="../common/u3.js"></script>
<script type="text/javascript">

function deleteConfirm(){
	if (confirm("정말 탈퇴 하시겠습니까??") == true){    //확인
    	//document.form.submit();
	    location.href="delete.jsp";
	}else{   //취소
		history.go(-1);
    	//return;
	}
}
</script>

</head>

<body onload="deleteConfirm();">

</body>
</html>
<% } %>