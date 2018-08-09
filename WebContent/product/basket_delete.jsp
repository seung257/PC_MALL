<%@ page  import="java.sql.*,oracle.dbpool.*" %>

<%
	if( session.getAttribute("pid") == null) {
		response.sendRedirect("../common/index.jsp");
	} else {	
		String productnum=request.getParameter("productnum");
		String pid =(String)session.getAttribute("pid");
		String deleteall="deleteall";
		String sql1="delete from basket where product_id = "+productnum+" and user_id ='"+pid+"'";
		String sql2="delete from basket where user_id = '"+pid+"'";

	try {

		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=con.createStatement();
		if(productnum.equals(deleteall)) {
			stmt.executeUpdate(sql2);
		} else {
			stmt.executeUpdate(sql1);
		}
		stmt.close();
		con.commit();
		pool.freeConnection("ora8", con);
		} catch (Exception e) {
			out.println(e);
		}
		response.sendRedirect("basket_view.jsp?productnum="+productnum);	 
	}
%>
