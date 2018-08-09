<%@ page contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<title>우편번호 검색</title>
	</head>

<body>
	<p><font size="2" color="#7F93FF"><b>주소</b></font><font size="2"><b><font color="#333366" >를 
	</b></font><font size="2" color="#E29115"><b>동/면/리</b></font><font size="2"
	color="#FFB233"><b> </b></font><font size="2" color="#333366"><b>단위로 입력해 주세요</b></font></p>
	<form method="post" action="/servlet/Zip">
	&nbsp;&nbsp;<input type="text" name="addr" size="20"> 
	<input type="submit" value=" 검색" style="cursor:hand" class="inputa" ></form>
</body>
</html> 
