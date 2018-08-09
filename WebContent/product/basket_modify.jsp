<%@ page  import="java.sql.*,oracle.dbpool.*" %>

<%
     if (session.getAttribute("pid") == null) {
		response.sendRedirect("../main/index.jsp");
	 }  else {
		String productnum = request.getParameter("productnum");
		String numberqty= request.getParameter("number");
		String pid =(String)session.getAttribute("pid");

	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=con.createStatement();
		String sql="update basket set qty="+ numberqty +" where product_id="+productnum+" and user_id ='"+pid+"'";
		stmt.executeUpdate(sql);
		stmt.close();
		pool.freeConnection("ora8", con); 
	} catch (Exception e)	{}
		response.sendRedirect("basket_view.jsp?productnum="+productnum);
	}
%>