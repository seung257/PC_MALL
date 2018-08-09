<%@ page contentType="text/html;charset=UTF-8" %>

<script language="JavaScript">
<!--
function MM_swapImgRestore() { 
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { 
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { 
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>

<script language="JavaScript">
<!--

function MM_showHideLayers() {
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>

<body>
<table width=125 border=1 cellspacing=0 cellpadding=0 align=left height=590>
<tbody valign=top align=left bgcolor=white>
<tr> 
    <td width=125 height=40 valign=top bgcolor=#ffffff >
      <table width=125 border=1 cellspacing=1 cellpadding=0>
          <tr> 
              <td><img src="../img/title_search.gif" width=125 height=20></td>
          </tr>
          <tr> 
             <form name="search_form" action="../common/search_view.jsp" method=post>
	         <td height=20 width=125 align=center>  
                   <input type="text" name="srch_word" size=14>
                   <input type="image" border=0 src="../img/s.gif"></td>
             </form>
          </tr> 
      </table>

     <table width=125 border=1 cellspacing=1 cellpadding=0>
     <tr> 
         <td height=22 valign=middle align=center><img src="../img/m_ani.gif" width=125 height=22></td>
      </tr>
      <tr> 
          <td><a href="../product/categoryall.jsp?c=23" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','../img/nav_1_back.gif',1);MM_showHideLayers('computer','','show','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')"><img name="Image1" border=0 src="../img/nav_1.gif" width=124 height=30></a></td>
      </tr>
      <tr> 
          <td><a href="../product/categoryall.jsp?c=1" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','../img/nav_2_back.gif',1);MM_showHideLayers('computer','','hide','pc','','show','software','','hide','network','','hide','digital','','hide','etc','','hide')"><img name="Image2" border=0 src="../img/nav_2.gif" width=124 height=30></a></td>
      </tr>
      <tr> 
          <td><a href="../product/categoryall.jsp?c=30" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','../img/nav_3_back.gif',1);MM_showHideLayers('computer','','hide','pc','','hide','software','','show','network','','hide','digital','','hide','etc','','hide')"><img name="Image3" border=0 src="../img/nav_3.gif" width=124 height=30></a></td>
      </tr>
      <tr> 
          <td><a href="../product/categoryall.jsp?c=26" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','../img/nav_4_back.gif',1);MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','show','digital','','hide','etc','','hide')"><img name="Image4" border=0 src="../img/nav_4.gif" width=124 height=30></a></td>
       </tr>
       <tr> 
           <td><a href="../product/categoryall.jsp?c=34" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image5','','../img/nav_5_back.gif',1);MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','show','etc','','hide')"><img name="Image5" border=0 src="../img/nav_5.gif" width=124 height=30></a></td>
       </tr>
       <tr> 
           <td><a href="../product/categoryall.jsp?c=19" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','../img/nav_6_back.gif',1);MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','show')"><img name="Image6" border=0 src="../img/nav_6.gif" width=124 height=30></a></td>
      </tr>
     </table>

<table width=125 border=2 cellspacing=1 cellpadding=0>   
  <tr> 
      <td><img src="../img/image_case.gif" width=125 height=150></td>
  </tr>
</table>

<div id="computer" style="position:absolute; left:123px; top:220px; width:100px; z-index:200; visibility: hidden"> 
  <table width=110 border=1 cellspacing=1 cellpadding=0 bgcolor="#d59bd7" onMouseOver="MM_showHideLayers('computer','','show','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')" onMouseOut="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')">
    <tr> 
      <td  onmouseover="this.style.background='#ffff99'" style="padding-top: 2px" onmouseout="this.style.background='#edfaee'" bgcolor=#ffffcc  height=14><a href="../product/category.jsp?c=23" target=_top>&nbsp;&nbsp;브랜드 PC</a></td></tr>
   <tr>
       <td onmouseover="this.style.background='#ffff99'" style="padding-top: 2px" onmouseout="this.style.background='#edfaee'" bgcolor=#ffffcc height=14><a href="../product/category.jsp?c=24" target=_top>&nbsp;&nbsp;노트북</a></td></tr>
   <tr>
       <td onmouseover="this.style.background='#ffff99'" style="padding-top: 2px" onmouseout="this.style.background='#edfaee'" bgcolor=#ffffcc height=14><a href="../product/category.jsp?c=25" target=_top>&nbsp;&nbsp;노트북 주변기기</a></td></tr>
  </table>
</div>

<div id="pc" style="position:absolute; left:123px; top:245px; width:100px; z-index:200; visibility: hidden"> 
  <table width=110 border=1 cellspacing=1 cellpadding=0 bgcolor="#d59bd7" onMouseOver="MM_showHideLayers('computer','','hide','pc','','show','software','','hide','network','','hide','digital','','hide','etc','','hide')" onMouseOut="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')">
   <tr>
       <td onmouseover="this.style.background='#f4daf4'"  style="padding-top: 2px"  onmouseout="this.style.background='#f8eef8';" width=94  bgcolor=#f8eef8><a href="../product/category.jsp?c=1" target=_top>&nbsp;&nbsp;C P U</a></td> </tr>
   <tr>
       <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=2" target=_top>&nbsp;&nbsp;R A M</a></td>
   </tr>
   <tr>
       <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'" bgcolor=#f8eef8><a href="../product/category.jsp?c=3"  target=_top>&nbsp;&nbsp;메인보드</a></td></tr>
   <tr>
       <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'" bgcolor=#f8eef8><a href="../product/category.jsp?c=4" target=_top>&nbsp;&nbsp;하드디스크</a></td></tr>
   <tr>
       <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"             bgcolor=#f8eef8><a href="../product/category.jsp?c=5" target=_top>&nbsp;&nbsp;V G A 카드</a></td>
	</tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8';" width=94 bgcolor=#f8eef8><a href="../product/category.jsp?c=6" target=_top>&nbsp;&nbsp;사운드 카드</a></td></tr>
   <tr>
       <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=7" target=_top>&nbsp;&nbsp;모니터</a></td></tr>
   <tr>
       <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=8" target=_top>&nbsp;&nbsp;CD-ROM</a></td></tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=10" target=_top>&nbsp;&nbsp;마우스</a></td></tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=13" target=_top>&nbsp;&nbsp;키보드</a></td></tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=14" target=_top>&nbsp;&nbsp;랜카드</a></td></tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=15" target=_top>&nbsp;&nbsp;스피커</a></td></tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'"  bgcolor=#f8eef8><a href="../product/category.jsp?c=16" target=_top>&nbsp;&nbsp;스케너</a></td></tr>
    <tr>
        <td onmouseover="this.style.background='#f4daf4'" style="padding-top: 2px" onmouseout="this.style.background='#f8eef8'" bgcolor=#f8eef8><a href="../product/category.jsp?c=17" target=_top>&nbsp;&nbsp;프린터</a></td></tr>
  </table>
</div>

<div id="software" style="position:absolute; left:123px; top:275px; width:100px; z-index:200; visibility: hidden"> 
  <table width=110 border=1 cellspacing=1 cellpadding=0 bgcolor="#de93a1" onMouseOver="MM_showHideLayers('computer','','hide','pc','','hide','software','','show','network','','hide','digital','','hide','etc','','hide')" onMouseOut="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')">
   <tr>
        <td onmouseover="this.style.background='#00ff99'" style="padding-top: 2px"  onmouseout="this.style.background='#f9edef'" width=99 bgcolor=#f9edef><a  href="../product/category.jsp?c=30" target=_top>&nbsp;&nbsp;운영체제</a></td></tr>
	<tr>
         <td onmouseover="this.style.background='#00ff99'" style="padding-top: 2px" onmouseout="this.style.background='#f9edef'" width=99 bgcolor=#f9edef><a  href="../product/category.jsp?c=31" target=_top>&nbsp;&nbsp;개발툴</a></td></tr>
    <tr>
         <td onmouseover="this.style.background='#00ff99'" style="padding-top: 2px" onmouseout="this.style.background='#f9edef'" width=99 bgcolor=#f9edef><a href="../product/category.jsp?c=32"  target=_top>&nbsp;&nbsp;멀티미디어</a></td></tr>
    <tr>
      <td onmouseover="this.style.background='#00ff99'" style="padding-top: 2px" onmouseout="this.style.background='#f9edef'" width=99 bgcolor=#f9edef><a href="../product/category.jsp?c=33" target=_top>&nbsp;&nbsp;OFFICE용</a></td></tr>
  </table>
</div>

<div id="network" style="position:absolute; left:123px; top:300px; width:100px; z-index:200; visibility: hidden"> 
  <table width=110 border=1 cellspacing=1 cellpadding=0 bgcolor="#95c7dd" onMouseOver="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','show','digital','','hide','etc','','hide')" onMouseOut="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')">
  <tr>
      <td onmouseover="this.style.background='#d2e9f2'" style="padding-top: 2px" onmouseout="this.style.background='#edf5f9'"  bgcolor=#edf5f9><a href="../product/category.jsp?c=26" target=_top>&nbsp;&nbsp;공유기/분배기</font></a></td>
  <tr>
      <td onmouseover="this.style.background='#d2e9f2'" style="padding-top: 2px" onmouseout="this.style.background='#edf5f9'"  bgcolor=#edf5f9><a href="../product/category.jsp?c=27" target=_top>&nbsp;&nbsp;인터넷공유기</a></td>
 <tr>
     <td onmouseover="this.style.background='#d2e9f2'" style="padding-top: 2px" onmouseout="this.style.background='#edf5f9'"  bgcolor=#edf5f9><a href="../product/category.jsp?c=28"  target=_top>&nbsp;&nbsp;랜카드</a></td></tr>
   </table>
</div>

<div id="digital" style="position:absolute; left:123px; top:330px; width:100px; z-index:200; visibility: hidden"> 
  <table width=110 border=1 cellspacing=1 cellpadding=0 bgcolor="#9bcbd7" onMouseOver="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','show','etc','','hide')" onMouseOut="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')">
   <tr>
        <td onmouseover="this.style.background='#ffccff'" style="padding-top: 2px"  onmouseout="this.style.background='#eef6f8'" width=94 bgcolor=#eef6f8><a href="../product/category.jsp?c=34" target=_top>&nbsp;&nbsp;디지탈카메라</font></a></td></tr>
   <tr>
        <td onmouseover="this.style.background='#ffccff'" style="padding-top: 2px" onmouseout="this.style.background='#eef6f8'" bgcolor=#eef6f8><a href="../product/category.jsp?c=35"target=_top>&nbsp;&nbsp;화상카메라</a></td></tr>
   <tr>
      <td onmouseover="this.style.background='#ffccff'"  style="padding-top: 2px" onmouseout="this.style.background='#f7f0f0'" width=94  bgcolor=#f7f0f0><a href="../product/category.jsp?c=37" target=_top>&nbsp;&nbsp;P D A</a></td></tr>
    <tr>
      <td onmouseover="this.style.background='#ffccff'" style="padding-top: 2px" onmouseout="this.style.background='#f7f0f0'" width=94  bgcolor=#f7f0f0><a  href="../product/category.jsp?c=39" target=_top>&nbsp;&nbsp;MP3PLAYER</a></td></tr>
  </table>
</div>

<div id="etc" style="position:absolute; left:123px; top:360px; width:100px; z-index:200; visibility: hidden"> 
  <table width=110 border=1 cellspacing=1 cellpadding=0 bgcolor="#9ba9d7" onMouseOver="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','show')" onMouseOut="MM_showHideLayers('computer','','hide','pc','','hide','software','','hide','network','','hide','digital','','hide','etc','','hide')">
   <tr>
       <td onmouseover="this.style.background='#d4d8e8'" style="padding-top: 2px" onmouseout="this.style.background='#eef0f8'" width=94  bgcolor=#eef0f8><a href="../product/category.jsp?c=19"  target=_top>&nbsp;&nbsp;저장미디어</a></td></tr>
   <tr>
         <td onmouseover="this.style.background='#d4d8e8'" style="padding-top: 2px" onmouseout="this.style.background='#eef0f8'" bgcolor=#eef0f8><a href="../product/category.jsp?c=20" target=_top>&nbsp;&nbsp;C D</a></td></tr>
   <tr>
        <td onmouseover="this.style.background='#d4d8e8'"  style="padding-top: 2px" onmouseout="this.style.background='#eef0f8'" bgcolor=#eef0f8><a href="../product/category.jsp?c=21" target=_top>&nbsp;&nbsp;프린터잉크토너</a></td></tr>
   <tr>
        <td onmouseover="this.style.background='#d4d8e8'" style="padding-top: 2px" onmouseout="this.style.background='#eef0f8'"  bgcolor=#eef0f8><a href="../product/category.jsp?c=22" target=_top>&nbsp;&nbsp;컴퓨터사무용품</a></td></tr>
</table>
</div>
</tbody>
</table>
</body>