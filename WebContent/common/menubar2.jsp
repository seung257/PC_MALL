<%@ page contentType="text/html;charset=UTF-8"  %>

<%  String pid = (String) session.getAttribute("pid");%>

<SCRIPT language=javascript>
function defaultStatus(){
	var lec = document.all.lecture;
	for (var i=0;i<lec.length;i++){
		document.all.lecture[i].style.border = "1 solid #EFEFEF";
		document.all.lecture[i].style.backgroundColor = "";
	}
}

function mouseOnTD(obj)
{
	obj.style.border = "1 solid gray";
	obj.style.backgroundColor = "gray";
	obj.style.cursor = "hand";
}

function ClickOnTD(obj, page){
	obj.style.border = "1 solid gray";
	obj.style.backgroundColor = "white";
	obj.style.cursor = "hand";
	parent.info.location.href= page;
}
</SCRIPT>
<script language="JavaScript">
<!--
function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
<style type="text/css">
<!--
.layerstyle {  font-size: 12px; color: #797979; text-decoration: none}
-->
</style>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { 
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { 
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { 
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<body onLoad="MM_preloadImages('../img/menubar_1_home.gif','../img/menubar_1_company.gif,'../img/menubar_1_member.gif','../img/menubar_1_intro.gif','../img/menubar_1_shopping.gif','../img/menubar_1_basket.gif','../img/menubar_1_mypage.gif','../img/menubar_1_qna.gif');;;">
<div align="left">
<table width="790"  border="0" cellspacing="0" cellpadding="0" height="39">
<tbody valign="top" align="left" bgcolor="#EEEEEE">
  <tr valign="middle" align="right" height="19">
    <td width="82" valign="middle" height="18"></td>
    <td width="82" valign="middle" height="18"><a href="../main/index.jsp" onMouseOver="document.images[1].src='../img/menubar_2_home.gif';"
   onMouseOut="document.images[1].src='../img/menubar_1_home.gif';">
   <img src="../img/menubar_1_home.gif" ></a></td>

	<td width="82" height="24" border="0"><a href="../service/service_index_c3s.jsp" onMouseOver="document.images[2].src='../img/menubar_2_company.gif';"
   onMouseOut="document.images[2].src='../img/menubar_1_company.gif';">
   <img src="../img/menubar_1_company.gif" ></a></td>

	<td width="80" height="24" border="0"><a href="../mypage/user.jsp" onMouseOver="document.images[3].src='../img/menubar_2_member.gif';"
   onMouseOut="document.images[3].src='../img/menubar_1_member.gif';">
   <img src="../img/menubar_1_member.gif"></a></td>

	<td width="75" height="24" border="0"><a href="../service/inform_01.jsp" onMouseOver="document.images[4].src='../img/menubar_2_intro.gif';"
   onMouseOut="document.images[4].src='../img/menubar_1_intro.gif';">
   <img src="../img/menubar_1_intro.gif"></a></td>

<td width="82" height="24" border="0"><a src="../img/img/menubar_1_shopping.gif" width="80" height="24" onMouseOver="MM_showHideLayers('Layer1','','show','Layer2','','hide','Layer3','','hide','Layer4','','hide')"> 
      </a><a href="../shoppingmall/gongi.jsp" onMouseOver="MM_showHideLayers('Layer1','','show','Layer2','','hide','Layer3','','hide','Layer4','','hide')"> 
      </a><a href="../main/index.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image20','','../img/menubar_2_shopping.gif',1);MM_showHideLayers('shoppingmall','','show','basket','','hide','mypage','','hide','qna','','hide')"><img name="Image20" border="2" src="../img/menubar_1_shopping.gif"></a></td>

<td width="78" height="24" border="0"><a href="../product/cart_view.jsp" onMouseOver="document.images[6].src='../img/menubar_2_basket.gif';"
   onMouseOut="document.images[6].src='../img/menubar_1_basket.gif';">
   <img src="../img/menubar_1_basket.gif"></a></td>
   
   <td width="73" height="24" border="0"><a src="../img/menubar_1_mypage.gif" 
 onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../img/menubar_2_mypage.gif',1);MM_showHideLayers('shoppingmall','','hide','basket','','hide','mypage','','show','qna','','hide')">
 <img name="Image4"  border="2"  src="../img/menubar_1_mypage.gif"></a></td>   

	<td width="81" height="24" border="0"><a src="../img/menubar_1_qna.gif" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','../img/menubar_2_qna.gif',1);MM_showHideLayers('shoppingmall','','hide','basket','','hide','mypage','','hide','qna','','show')">
	<img name="Image3"  border="2"   src="../img/menubar_1_qna.gif"  width="81" height="24"></a></td>   

	<td width="90" height="24" border="0"></td>
    </td>

<tr height="25" > 
    <td colspan=5 bgcolor="#EAEAEA">&nbsp; </td>
	</tr>
</tbody>
</table>

<div id="shoppingmall" style="position:absolute; left:300px; top:100px; width:311px; height:20px; z-index:100; visibility: hidden" class="layerstyle"> 
  <table width="400" border="0" cellspacing="0" cellpadding="0" height="20" onMouseOver="MM_showHideLayers('Layer1','','show','Layer2','','hide','Layer3','','hide','Layer4','','hide')" onMouseOut="MM_showHideLayers('Layer1','','hide','Layer2','','hide','Layer4','','hide','Layer3','','hide')" bgcolor="#EAEAEA" align="center">
    
	<tr> 
      <td width="100" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
        <div align="center"> &nbsp;<span class="layerstyle">
		<a href="../shoppingmall/gongi.jsp">공지사항</a></span> </div>
      </td>
      <td width="100" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
        <div align="center"><span class="layerstyle">
		<a href="../shoppingmall/newproduct.jsp">신상품 코너</a></span> </div>
      </td>
      <td width="100" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
        <div align="center"><span class="layerstyle">
		<a href="../shoppingmall/pc_calculation.jsp">조립 PC견적</a></span> </div>
      </td>
      <td width="100" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
        <div align="center" class="layerstyle">
		<a href="../shoppingmall/gongdong.jsp">공동구매</a></div>
      </td>
    </tr>
  </table>
</div>

<div id="mypage" style="position:absolute; left:550px; top:100px; width:250px; height:20px; z-index:100; visibility: hidden"> 
  <table width="100" border="0" cellspacing="2" cellpadding="0" height="20" onMouseOut="MM_showHideLayers('Layer1','','hide','Layer2','','hide','Layer3','','hide','Layer4','','hide')" onMouseOver="MM_showHideLayers('Layer1','','hide','Layer2','','hide','Layer3','','hide','Layer4','','show')" bgcolor="#EAEAEA">
    <tr> 
   <td width="100" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
        <div align="center" class="layerstyle"><a href="../mypage/view_user.jsp?user_id=<%=pid %>">자기정보수정</a></div>
      </td>
    </tr>
<tbody>
  </table>
</div>

<div id="qna" style="position:absolute; left:600px; top:100px; width:100px; height:20px; z-index:100; visibility: hidden"> 
  <table width="160" border="0" cellspacing="2" cellpadding="0" height="20" onMouseOver="MM_showHideLayers('Layer1','','hide','Layer2','','show','Layer3','','hide','Layer4','','hide')" onMouseOut="MM_showHideLayers('Layer2','','hide','Layer1','','hide','Layer4','','hide','Layer3','','hide')">
    <tr bgcolor="#EAEAEA">        
      <td width="80" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
	<div align="center"><span class="layerstyle"><a href="../board/reply_list.jsp">자유게시판</a></span> </div>
      </td>
      <td width="80" onMouseOver="this.style.backgroundColor='#CDCDCD'" onMouseOut="this.style.backgroundColor=''"> 
        <div align="center" class="layerstyle"><a href="../FAQ/faq.jsp">FAQ</a></div>
      </td>
    </tr>
  </table>
</div>
