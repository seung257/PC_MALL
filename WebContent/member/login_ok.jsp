<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
<%// 로그인하려면 제일 중요한 페이지 %>
<%
	try{
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		String uid="", pwd="", name="";
		String mem_uid = request.getParameter("uid"); 
		String mem_pwd = request.getParameter("pwd");
		String sql = "select m_uid, m_pwd, m_name from member where m_uid ='" + mem_uid +"'"; 
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if(rs.next()) {
			
			uid = rs.getString(1);
			pwd = rs.getString(2);
			name = rs.getString(3);
			System.out.println("@@@@@@@@ ID 조회확인 ");
			
		} else{
			
			System.out.println("!!!!!!!!! ID 없으니 회원가입");
 %>

			<script language="JavaScript"> 
				alert("등록되어 있지 않은 아이디입니다.");
				history.go(-1);  // 1단계 이전 페이지로 이동(페이지를 이동할때 스크립트를 많이 사용)
			</script>

 <% }
		
        if(uid.equals(mem_uid) && pwd.equals(mem_pwd)) {
			
        	//세션영역에 세션키와 값을 설정
		    session.setAttribute("pid",uid);	 //회원아이디
			session.setAttribute("pname",name);	 //회원 이름
			session.setAttribute("pmember","y"); //회원 인지 아닌지..

            // 사용안함. - 어플리케이션 변수 설정. 현재 몇명이 사이트에 접속중인지(사용자) 체크용

			if( application.getAttribute("activecount") == null){
		
				Integer r1 = new Integer("1");
				application.setAttribute("activecount",r1);

			} else { 

				Integer r2 = (Integer)application.getAttribute("activecount");
			    int s = r2.intValue(); 
				Integer r3 = new Integer(++s);
			   application.setAttribute("activecount",r3);
			}			
			
			System.out.println("########### 로그인 성공! ###########");
			//log로 교체해보기.
%>

			<script>
				alert("로그인 되었습니다.");
				location.href="../main/index.jsp";	 
			</script>
				
<%		 
			//response.sendRedirect("../main/index.jsp");

		 } else if(uid.equals(mem_uid) && !pwd.equals(mem_pwd)) {

			 System.out.println("로그인 실패 - 패스워드 오류");
%>

			<script>
				alert("패스워드가 일치하지 않습니다");
				history.go(-1); 
			</script>

<%
		}
		stmt.close();						 // stmt 닫기
		rs.close();							 // rs 닫기
		pool.freeConnection("ora8", con);    //커넥션 풀 종료.

	} catch(Exception e) {

		out.println(e);
	}
	// response.sendRedirect("../main/index.jsp");
%>