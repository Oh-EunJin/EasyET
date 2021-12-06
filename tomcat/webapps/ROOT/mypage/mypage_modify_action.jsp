<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.awt.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <!DOCTYPE html>
<html lang="utf-8">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
</head>
<body>
 <%
	//Map<String, String> articles = new HashMap<String,String>();
  	Map<String, Object> article = new HashMap<>();
  	PrintWriter ot = response.getWriter();
  	request.setCharacterEncoding("utf-8");
  	String id = session.getAttribute("ss").toString();
  	String pwd = request.getParameter("pwd");
  	String tel = request.getParameter("tel");
  	String address = request.getParameter("address");
  	String promise = request.getParameter("promise");
  	String name = request.getParameter("name");
  	
  //	out.print("pwd : " + pwd);
  //	out.print("tel : " + tel);
  //	out.print("addr : " + address);
  	

	Connection conn = null;
	Statement stmt = null;
	int rs = 0;
	
	try {
		String url = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj";
		String dbPass = "Yuhan2020!";
		conn = DriverManager.getConnection(url,dbId,dbPass);
		
		stmt = conn.createStatement();
		String sql = "update user set user_password ='" + pwd + "', user_address = '" + address + "', user_name = '" + name + "', user_tel = '" + tel + "', user_promise = '" + promise + "' where user_id ='" + id +"'";
		rs = stmt.executeUpdate(sql);
	//	out.print("sql " + sql);
	//out.print("id : " + id);
	
/* 	while ( rs.next() ) {
			article.put("id",rs.getString("user_id"));
			article.put("address",rs.getString("user_address"));
			article.put("tel",rs.getString("user_tel"));
			
		//	articles.add(article);
	//	out.print("id : " + article.get("id"));
		} */
		if(rs >0){
			session.invalidate();
			ot.println("<script>alert('회원정보 수정에 성공했습니다. 다시 로그인해주세요'); location.href='/login/login_form.jsp';</script>");
			//response.sendRedirect("");
		}else{
			ot.println("<script>alert('회원정보 수정에 실패했습니다. 다시 시도해주세요'); history.back();</script>");
		}
		
	} catch (SQLException se1) {
	    se1.printStackTrace();
	} catch (Exception ex) {
	    ex.printStackTrace();
	} finally {
	    try {
	        if (stmt != null)
	            stmt.close();
	    } catch (SQLException se2) {
	    }
	    try {
	        if (conn != null)
	            conn.close();
	    } catch (SQLException se) {
	        se.printStackTrace();
	    }
	}   
%>
</body>
</html>