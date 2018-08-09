<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*,oracle.dbpool.*" %>

<%
	if( session.getAttribute("pid") == null) {
		response.sendRedirect("../main/index.jsp");
	}  else {
		String productnum[] = request.getParameterValues("productnum");
		String p_id =(String)session.getAttribute("pid");
		String sql1="select count(id) from basket";
		int id, price, qty;
try {
		DBConnectionManager pool=DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(sql1);
		int count=1;
		if(rs.next()) {
			count=rs.getInt(1);
			count++;    
		}
		rs.close();
		stmt.close();

		for(int k=0;k<productnum.length;k++) {
			if(!productnum[k].equals("0")) {
				Statement stmt2=con.createStatement();
				Statement stmt1=con.createStatement();
				ResultSet rs2=stmt2.executeQuery("select qty from basket where user_id='"+p_id+"' and  product_id='"+productnum[k]+"'");

				if(rs2.next()) {
					stmt1.executeUpdate("update basket set qty=qty+1 where user_id='"+p_id+"' and product_id='"+productnum[k]+"'");
				} else {
					String sql2= "insert into basket(id,product_id,user_id,qty,buydate) values(" + count + "," + productnum[k] + ",'"+p_id+"',1,sysdate)";
					out.print(sql2+"\\n");
					stmt1.executeUpdate(sql2);
					count++;
					}
				rs2.close();
				stmt1.close();
				stmt2.close();
			}
		}
		response.sendRedirect("basket_view.jsp");
		pool.freeConnection("ora8", con);
	} catch (Exception e) {
		out.print(e);
		out.print("<script language=\"javascript\">history.back();</script>");
	}
}
%>