<%@ page contentType="text/html;charset=UTF-8"  %>

<% String user_id= (String) session.getAttribute("pid");%>

<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>

<body link="#000000" vlink="#000000" alink="#FF6633">

<br><br>
<table  width=410 height=25 border=1  cellspacing=0 cellpadding=0 topmargin=0>
	<tr valign=middle bgcolor=ffffff>
		<td align=center bgcolor=#ffccff><font  size=4><b>사이트 맵</b></font></td>
	</tr>
</table>
  
<table width=400 border=1 cellspacing="1" cellpadding="0">
	<tr align="center" valign="top"> 
		<td width=200>
			<table width=100 border=0 cellspacing="0" cellpadding="0">
				<tr> 
					<td height=30><b><font color="#0000FF" size=3>쇼핑몰</font></b><br>
						<img src="img/middle_line_01.gif" border=0 width=200></td>
				</tr>                           
				<tr>
					<td><a href="../shoppingmall/gongi.jsp" id="dami"> &nbsp;공지사항</a></td>
				</tr>
				 <tr>
					<td><a href="../shoppingmall/newproduct.jsp"> &nbsp;신상품 코너</a></td>
				</tr>
				<tr>
					<td><a href="../shoppingmall/pc_calculation.jsp"> &nbsp;조립PC견적</a></td>
				</tr>
				<tr>
					<td><a href="../shoppingmall/gongdong.jsp"> &nbsp;공동구매</a></td>
				</tr>
			</table>

		</td>
		<td width=200>
			<table width="50%" border=0 cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				<tr> 
					<td height=30><b><font color="#0000FF" size=3>내페이지</font></b><br>
						<img src="img/middle_line_01.gif" border=0 width=200></td>
				</tr>
				<tr>
					<td><a href="../member/user.jsp"> &nbsp;회원가입</a></td>
				</tr>
				<tr>
					<td><a href="../member/modify.jsp?user_id=<%=user_id%>"> &nbsp;회원정보수정</a></td>
				</tr>
				<tr>
					<td><a href="../member/delete.jsp?user_id=<%=user_id%>"> &nbsp;회원탈퇴</a></td>
				</tr>
				<tr>
					<td><a href="../product/basket_view.jsp"> &nbsp;장바구니</a></td>
				</tr>
			</table>
		</td>

	<table width="50%" border=1 cellspacing="0" cellpadding="0">
			<tr align="center" height=30> 
				<td width=200>
					<table width="50%" border=0 cellspacing="0" cellpadding="0" bgcolor="#ffffff">
						<tr> 
							<td height=30><b><font color="#0000FF" size=3>묻고답하기</font></b><br>
								<img src="img/middle_line_01.gif" border=0 width=200></td>
						</tr>                           
						<tr>
							<td><a href="../board/reply_list.jsp"> &nbsp;자유게시판</a></td>
						</tr>
						<tr>
							<td><a href="../service/inform_01.jsp"> &nbsp;FAQ</a></td>
						</tr>
					</table> 
				</td>
				<td width=200>
					<table width="50%" border=0 cellspacing="0" cellpadding="0" bgcolor="#ffffff">
						<tr> 
							<td height=30><b><font color="#0000FF" size=3>기 타</font></b><br>
							<img src="img/middle_line_01.gif" border=0 width=200></td>
						</tr>
						<tr>
							<td><a href="../member/login_form.jsp"> &nbsp;로그인</a></td>
						</tr>
						<tr>
							<td><a href="../service/company_intro.jsp"> &nbsp;회사소개</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</tr>
</table>

</BODY>
</HTML>