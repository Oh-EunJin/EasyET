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

  <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-none d-lg-block">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i><a href="mailto:contact@example.com">chk4814@naver.com</a>
        <i class="icofont-phone phone-icon"></i> +82 02-2610-0600
      </div>
      <div>
      	 <%
      	if(session.getAttribute("ss") == null)
      	{
    	  %>
    	  	<a href="/login/login_form.jsp" >LOGIN</a> 
      	 	<a href="/join/join_form.jsp" >JOIN</a>
    	  <%
      	}
      	else
      	{
    	  %>
    	  	<a href="/login/logout_action.jsp" >LOGOUT</a> 
      	 	<a href="/mypage/mypage.jsp" >MYPAGE</a>
    	  <%
      	}
      %>
      </div>
    </div>
  </section>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="/index.jsp">Easy<span>ET</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/index.jsp">Home</a></li>
          <li><a href="/health/health.jsp">????????????</a></li>
          <li><a href="/honor/honor.jsp">????????? ??????</a></li>
          <li class="drop-down"><a href="">Board</a>
          	<ul>
          		<li><a href="/board/board_list.jsp">?????? ?????????</a></li>
          		<li><a href="/notice/notice_list.jsp">????????????</a></li>
          	</ul>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
<script >
function jumpMenu(frm){
	location.href=frm.jump.options[frm.jump.selectedIndex].value;
	frm.jump.selectedIndex.selected;
}
</script>
  
  <%
  	//session.setAttribute("ss","test@naver.com");
	String ss = session.getAttribute("ss").toString();
  %>


  

  <main id="main">
  <br><br>
		<%
	    request.setCharacterEncoding("utf-8");
	 	//String ss = session.getAttribute("ss").toString(); 		String name = null;
 		int sex = Integer.parseInt(request.getParameter("sex"));
 		int age = Integer.parseInt(request.getParameter("age"));
 		String check_date = request.getParameter("check_date");
 		float totalbodywater = Float.parseFloat(request.getParameter("totalbodywater"));
 		float protein = Float.parseFloat(request.getParameter("protein"));
 		float mineral = Float.parseFloat(request.getParameter("mineral"));
 		float bodyfat = Float.parseFloat(request.getParameter("bodyfat"));
 		float height = Float.parseFloat(request.getParameter("height"));
 		float weight = Float.parseFloat(request.getParameter("weight"));
 		float skeletal_muscle_mass = Float.parseFloat(request.getParameter("skeletal_muscle_mass"));
 		float bmi = weight / ((height/100) * (height/100)); 
 		float percentbodyfat = (bodyfat / weight) * 100; 
 		int leftarm_muscle = Integer.parseInt(request.getParameter("leftarm_muscle")); 
 		int rightarm_muscle = Integer.parseInt(request.getParameter("rightarm_muscle")); 
 		int leftleg_muscle = Integer.parseInt(request.getParameter("leftleg_muscle")); 
 		int rightleg_muscle = Integer.parseInt(request.getParameter("rightleg_muscle")); 
 		int center_muscle = Integer.parseInt(request.getParameter("center_muscle"));
 		int leftarm_fat = Integer.parseInt(request.getParameter("leftarm_fat"));
 		int leftleg_fat = Integer.parseInt(request.getParameter("leftleg_fat"));
 		int rightarm_fat = Integer.parseInt(request.getParameter("rightarm_fat"));
 		int rightleg_fat = Integer.parseInt(request.getParameter("rightleg_fat"));
 		int center_fat = Integer.parseInt(request.getParameter("center_fat"));
 		Timestamp register = new Timestamp(System.currentTimeMillis());
%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
String str = "";
ResultSet rs = null;
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId = "yhpj";
	String dbPass = "Yuhan2020!";
	
	Class.forName ("com.mysql.jdbc.Driver"); //driver load
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	String sql = "insert into inbody(name, sex, age, check_date, totalbodywater, protein, mineral, " +
			"bodyfat, height, weight, skeletal_muscle_mass, bmi, percentbodyfat, leftarm_muscle, rightarm_muscle, leftleg_muscle, " +
			"rightleg_muscle, center_muscle, leftarm_fat, leftleg_fat, rightarm_fat, rightleg_fat, center_fat) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, ss);
	pstmt.setInt(2, sex);
	pstmt.setInt(3, age);
	pstmt.setString(4, check_date);
	pstmt.setFloat(5, totalbodywater);
	pstmt.setFloat(6, protein);
	pstmt.setFloat(7, mineral);
	pstmt.setFloat(8, bodyfat);
	pstmt.setFloat(9, height);
	pstmt.setFloat(10, weight);
	pstmt.setFloat(11, skeletal_muscle_mass);
	pstmt.setFloat(12, bmi);
	pstmt.setFloat(13, percentbodyfat);
	pstmt.setInt(14, leftarm_muscle);
	pstmt.setInt(15, rightarm_muscle);
	pstmt.setInt(16, leftleg_muscle);
	pstmt.setInt(17, rightleg_muscle);
	pstmt.setInt(18, center_muscle);
	pstmt.setInt(19, leftarm_fat);
	pstmt.setInt(20, leftleg_fat);
	pstmt.setInt(21, rightarm_fat);
	pstmt.setInt(22, rightleg_fat);
	pstmt.setInt(23, center_fat);
	
	pstmt.executeUpdate();
	
	%>
		<meta http-equiv="Refresh" content="0; URL=/health/health.jsp">
	<%
	
}catch(Exception e){
	e.printStackTrace();
	
}finally{
	if(rs !=null)
		try{rs.close();}catch(SQLException sqle){}
	if(pstmt != null)
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null)
		try{conn.close();}catch(SQLException sqle){}
}
%>	
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-6 col-md-6">
            <div class="footer-info">
              <h3>EasyET</h3>
              <p>
                                    ????????? ????????? ????????? 590 <br>
                <strong>Phone:</strong> +82 02-2610-0600<br>
                <strong>Email:</strong> chk4814@naver.com<br>
              </p>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 footer-links">
            <h4>????????????</h4>
            <ul>
              <li>
              	<a href="/index.jsp">Home</a>&nbsp&nbsp
              	<a href="/health/health.jsp">????????????</a>&nbsp&nbsp
              	<a href="/honor/honor.jsp">????????? ??????</a>&nbsp&nbsp
              	<a href="/board/board_list.jsp">???????????????</a>&nbsp&nbsp
              	<a href="/notice/notice_list.jsp">????????????</a>&nbsp&nbsp
              </li>
            </ul>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>MyBiz</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>
  <script src="/assets/vendor/jquery-sticky/jquery.sticky.js"></script>
  <script src="/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/assets/vendor/counterup/counterup.min.js"></script>
  <script src="/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/assets/vendor/venobox/venobox.min.js"></script>
  <script src="/assets/vendor/owl.carousel/owl.carousel.min.js"></script>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>

</body>

</html>