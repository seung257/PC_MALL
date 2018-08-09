package shopdb.product;

import java.sql.*;
import java.util.*;
import shopdb.dbpool.*;

public class category{
	
	private Vector name = null; 
	private Vector company_id = null;
	private Vector expression = null;
	private Vector photo = null;
	private Vector category = null;
	private Vector c_name =  null;
	private Vector id =  null;
	private Vector price =  null;
	private Vector c_namers =  null;

		
  private int newnum =0;
  
	public  void setC(int c){
		this.newnum = c;
	}

	public Vector getName(){
		return this.name;
	}
	public Vector getCompany_id(){
		return this.company_id;
	}
	public Vector getExpression(){
		return this.expression;
	}
	public Vector getPhoto(){
		return this.photo;
	}
	public Vector getCategory(){
		return this.category;
	}
	public Vector getC_name(){
		return this.c_name;
	}
	public Vector getId(){
		return this.id;
	}
	public Vector getPrice(){
		return this.price;
	}
	public Vector getC_namers(){
		return this.c_namers;
	}

	public void List(){
		name = new Vector();  // 제품 이름
		company_id = new Vector(); // 회사 이름
		expression = new Vector();// 설명
		photo = new Vector(); // 이미지
		category =  new Vector();// 카테고리
		c_name =  new Vector();// 카테고리 이름
		id =  new Vector();// 상품 아이디
		price =  new Vector();// 상품 가격
		c_namers =  new Vector();

		ResultSet rs=null;
		//JDBC드라이버를 로딩한다.
		try { 
			 //DB풀 메니저 객체 생성 사용
			DBConnectionManager pool = DBConnectionManager.getInstance();
			Connection con = pool.getConnection("shop");//인자값 shop

			Statement stmt=con.createStatement();
			rs=stmt.executeQuery("select a.id,a.name,a.price,a.company_id,a.expression,a.photo,a.category,b.name from product a , category b where  a.category=b.id and category="+ newnum);
 
			while(rs.next()) {
				id.addElement(new Integer(rs.getInt(1)));
				name.addElement(rs.getString(2));
				price.addElement(new Integer(rs.getInt(3)));
				company_id.addElement(rs.getString(4));
     			expression.addElement(rs.getString(5));
				photo.addElement(rs.getString(6));
				category.addElement(new Integer(rs.getInt(7)));
				c_name.addElement(rs.getString(8));
			}
			stmt.close();
			rs.close();
			pool.freeConnection("shop", con); 

		} catch (Exception e)	{	}
	}
}