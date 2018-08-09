<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html; charset=UTF-8" %>

<%
     if (session.getAttribute("pid") == null) {
        response.sendRedirect("../main/index.jsp");
     }  else  {
        Statement stmt=null;
         Statement stmt1=null;
         ResultSet rs=null;

	  // DB풀 메니저 객체 생성 사용
       DBConnectionManager pool = DBConnectionManager.getInstance();
       Connection con = pool.getConnection("ora8");

try {
		String productnum[] = request.getParameterValues("productnum");
		String p_id =(String)session.getAttribute("pid");
		String name,company_id,expression,photo,category;
		String sql1="select count(id) from newcart";

		int id,price,qty;
		int number=1;

		stmt=con.createStatement();
		rs=stmt.executeQuery(sql1);

		int count=777;
		if(rs.next()) {
			count=rs.getInt(1);
			if (count==0) {
				count=count+1;
			} else {
				count=count+1;    
				}
		} else {
			count=7777;   
		}
		rs.close();
		stmt.close();

		for(int k=0;k<productnum.length;k++)
		{
			if(!productnum[k].equals("0")) {
				Statement stmt2=con.createStatement();
				stmt1=con.createStatement();
				ResultSet rs2=stmt2.executeQuery("select qty from newcart where user_id='"+p_id+"' and  product_id='"+productnum[k]+"'");

				if(rs2.next()) {
					stmt1.executeUpdate("update newcart set qty=qty+1 where user_id='"+p_id+"' and product_id='"+productnum[k]+"' and  temp2='C'");
				} else {
					
					String sql2= "insert into newcart(id,product_id,user_id,new_id,qty,temp1,temp2 ) values(" + count + "," + productnum[k] + ",'"+p_id+"','test',1,'SS','C')";
					out.print(sql2+"\\n");
					stmt1.executeUpdate(sql2);
					count++;
					
				}
				rs2.close();
				stmt1.close();
				stmt2.close();
			}
		}

		response.sendRedirect("cart_view_coo.jsp");
	} catch (Exception e) {
		out.print(e);
		out.print("<script language=\"javascript\">history.back();</script>");
	} finally{
	
	if (con != null) {
	pool.freeConnection("ora8", con);
		}
	}
}
%>