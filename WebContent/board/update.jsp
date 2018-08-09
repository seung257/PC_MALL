<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>

<%
try {

   //DB풀 메니저 객체 생성 사용
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");
 	
	String b_name=makeKOR(request.getParameter("name"));
    String pwd = request.getParameter("pwd");
	String b_email=request.getParameter("email");
	String b_title=makeKOR(request.getParameter("title"));
	String b_content=makeKOR(request.getParameter("content"));
	String ip = request.getRemoteAddr(); // IP 알아내기

   //쿼리에 '가 들어가면 에러가 발생하므로 replace 처리해준다.
   b_title = Replace(b_title,"'","''");
   b_content = Replace(b_content,"'","''");
  

 //HTML 태그(tag) 효과를 제한하고 싶다면
 if(request.getParameter("tag") != null){
 b_title = Replace(b_title,"&","&amp;");
 b_title = Replace(b_title,"<","&lt;");
 b_title = Replace(b_title,">","&gt;");
 
 b_content = Replace(b_content,"&","&amp;");
 b_content = Replace(b_content,"<","&lt;");
 b_content = Replace(b_content,">","&gt;");
 }

String b_id = request.getParameter("b_id");
     
  	Statement stmt= con.createStatement();
    ResultSet rs = stmt.executeQuery("select pwd from re_board where b_id="+b_id); 

	if(rs.next()){	
       	if(pwd.equals(rs.getString("pwd"))) { 
       		String  sql = "update re_board set b_name='"+b_name ;
	   		sql = sql + "' ,b_email='"+b_email +"' , b_title='"+b_title;
	   		sql = sql + "' ,b_content='"+b_content+"' where b_id="+b_id;

			stmt.executeUpdate(sql);
        } else { 
%>
            <script language=javascript>
            	alert("글을 수정할 수 없습니다.");
                history.back();
            </script>
<%
        }

	}
	
	rs.close();
	stmt.close(); 
	pool.freeConnection("ora8", con);
%>
    <script language=javascript>
    	alert("수정 하였습니다.");
    	location.href="board_list.jsp";
     </script>
<%
} catch (Exception e) {
        out.println(e);
} 
%>

<%! 
   String makeKOR(String str)throws java.io.UnsupportedEncodingException{
   String kor="";
   if (str==null) 
    kor=null;
   else
    kor=new String(str.getBytes("ISO-8859-1"),"UTF-8");
   return kor;
   }
	
	   // 개행 처리를 위한 메소드 

public static String Replace(String original, String oldString, String newString)
           {
 for(int index = 0; (index = original.indexOf(oldString, index)) >= 0; index += newString.length())
                                   original = original.substring(0, index) + newString + original.substring(index + oldString.length());
                       return original;
           }	

%>
	

<html>
<head><title>컴퓨터전문쇼핑몰</title>
<script language="Javascript">
function alrim(){
	alert("성공적으로 수정하였습니다.");
	location.href="board_list.jsp";
}
</script>
</head>
<body onload="alrim();">
</body>
</html>
