<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
    <!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Welcome EasyET</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: MyBiz - v2.1.0
  * Template URL: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  

</head>
<body>
	<%
	    request.setCharacterEncoding("utf-8");
	 	//String ss = session.getAttribute("ss").toString(); 		String name = null;
 		String user_tel = request.getParameter("user_tel");
 		
%>
<%
String user_id=null;
Connection conn = null;
PreparedStatement pstmt = null;
String str = "";
ResultSet rs = null;
String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
String dbId = "yhpj";
String dbPass = "Yuhan2020!";
Class.forName ("com.mysql.jdbc.Driver"); //driver load
conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

String sql = "select user_id from user where user_tel = ?";

try{
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, user_tel);
	
	rs=pstmt.executeQuery();
	while(rs.next()){
		user_id =rs.getString("user_id");
	}
	
}catch(Exception e){
	e.printStackTrace();
	
}finally{
	%><% 
	if(rs !=null)
		try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
}

%>	
<label>아이디는 : <% out.print(user_id); %></label>
</body>
</html>