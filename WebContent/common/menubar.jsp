<%@ page contentType="text/html;charset=UTF-8"  %>
<%  
	String pid = (String) session.getAttribute("pid"); 
%>

<script language="JavaScript">
<!--
function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>

<BODY>
<div align=left>
<table width=780  border=0 cellspacing=0 cellpadding=0 height=39>
<tbody valign="top" align="left" bgcolor="#eeeeee">
  <tr valign="middle" align="right" height="19">
    <td width=50 height=24></td>
    <td width=95 height=24><a href="../main/index.jsp" onMouseOver="document.images[1].src='../img/bar_11.gif';" onMouseOut="document.images[1].src='../img/bar_1.gif';"><img src="../img/bar_1.gif" width=95 height=24></a></td>

	<td width=95 height=24><a href="../service/company_intro.jsp" onMouseOver="document.images[2].src='../img/bar_22.gif';;MM_showHideLayers('shop','','hide','member','','hide','qna','','hide')" onMouseOut="document.images[2].src='../img/bar_2.gif';">
   <img src="../img/bar_2.gif" width=95 height=24></a></td>

    <td width=95 height=24 border=0><a src="../img/bar_3.gif"   onMouseOver="document.images[3].src='../img/bar_33.gif';MM_showHideLayers('shop','','show','member','','hide','qna','','hide')" onMouseOut="document.images[3].src='../img/bar_3.gif';"><img name="Image1" border=2 src="../img/bar_3.gif" width=95 height=24></a></td>

   <td width=95 height=24><a href="../product/basket_view.jsp?user_id=<%=pid %>" onMouseOver="document.images[4].src='../img/bar_44.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','hide')" onMouseOut="document.images[4].src='../img/bar_4.gif';"><img src="../img/bar_4.gif" width=95 height=24></a></td>
   
   <td width=95 height=24><a src="../img/bar_5.gif" onMouseOver="document.images[5].src='../img/bar_55.gif';MM_showHideLayers('shop','','hide','member','','show','qna','','hide')" onMouseOut="document.images[5].src='../img/bar_5.gif';"><img name="Image2"  border=2  src="../img/bar_5.gif" width=95 height=24></a></td>  
 
 	<td width=95 height=24><a href="../member/user.jsp" onMouseOver="document.images[6].src='../img/bar_66.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','hide');" onMouseOut="document.images[6].src='../img/bar_6.gif';">
   <img src="../img/bar_6.gif" width=95 height=24></a></td>

	<td width=95 height=24><a src="../img/bar_7.gif"  onMouseOver="document.images[7].src='../img/bar_77.gif';MM_showHideLayers('shop','','hide','member','','hide','qna','','show')" onMouseOut="document.images[7].src='../img/bar_7.gif';"><img name="Image3"  border=2   src="../img/bar_7.gif" width=95 height=24></a></td>

	<td width=30 height=24 border=0></td>

<tr height=25 > 
    <td colspan=5 bgcolor="#eaeaea">&nbsp; </td>
</tr>
</tbody>
</table>

<div id="shop" style="position:absolute; left:240px; top:100px; width:311px; height:20px; z-index:100; visibility: hidden" class="layerstyle"> 
  <table width=250 border=0 cellspacing=0 cellpadding=0 height=20>    
	<tr> 
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center> &nbsp;<span class="layerstyle"><a href="../shoppingmall/gongi.jsp">공지사항</a></span> </div>
      </td>
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center><span class="layerstyle"><a href="../shoppingmall/newproduct.jsp">신상품 코너</a></span> </div>
      </td>
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center><span class="layerstyle"><a href="../shoppingmall/pc_calculation.jsp">조립 PC 견적</a></span> </div>
      </td>
    </tr>
  </table>
</div>

<div id="member" style="position:absolute; left:420px; top:99px; width:160px; height:20px; z-index:100; visibility: hidden"> 
  <table width=180 border=0 cellspacing=2 cellpadding=0 height=20>
    <tr> 
      <td width=100 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../member/modify.jsp?user_id=<%= pid %>">회원정보수정</a></div>
      </td>
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../member/user_delete.jsp?user_id=<%= pid %>">회원 탈퇴</a></div>
      </td>
    </tr>
  </table>
</div>

<div id="qna" style="position:absolute; left:600px; top:99px; width:100px; height:20px; z-index:100; visibility: hidden"> 
  <table width=220 border=0 cellspacing=2 cellpadding=0 height=20>
    <tr bgcolor="#EAEAEA">        
      <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
	<div align=center><span class="layerstyle"><a href="../board/board_list.jsp">자유게시판</a></span> </div>
      </td>
       <td width=90 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
	<div align=center><span class="layerstyle"><a href="../board/MemberBoard_list.jsp">회원게시판</a></span> </div>
      </td>
      <td width=80 onMouseOver="this.style.backgroundColor='#cdcdcd'" onMouseOut="this.style.backgroundColor=''"> 
        <div align=center class="layerstyle"><a href="../service/inform_01.jsp">F A Q</a></div>
      </td>
    </tr>
  </table>
</div>