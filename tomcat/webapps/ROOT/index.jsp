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

<%
int user_count = 0;
int health_count = 0;
int board_count = 0;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String str = "";
try{
	 String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	 String dbId = "yhpj";
	 String dbPass = "Yuhan2020!";
	
	Class.forName ("com.mysql.jdbc.Driver"); //driver load
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	str = "select count(user_id) from user";
	pstmt = conn.prepareStatement(str);
	rs = pstmt.executeQuery();
	
	while(rs.next())
	{
		user_count = rs.getInt(1);
	}
	
	str = "select count(uid) from inbody";
	pstmt = conn.prepareStatement(str);
	rs = pstmt.executeQuery();
	
	while(rs.next())
	{
		health_count = rs.getInt(1);
	}
	
	str = "select count(board_uid) from board";
	pstmt = conn.prepareStatement(str);
	rs = pstmt.executeQuery();
	
	while(rs.next())
	{
		board_count = rs.getInt(1);
	}

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
          <li><a href="/health/health.jsp">건강정보</a></li>
          <li><a href="/honor/honor.jsp">명예의 전당</a></li>
          <li class="drop-down"><a href="">Board</a>
          	<ul>
          		<li><a href="/board/board_list.jsp">소통 게시판</a></li>
          		<li><a href="/notice/notice_list.jsp">공지사항</a></li>
          	</ul>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

        <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <!-- Slide 1 -->
          <div class="carousel-item active" style="background-image: url(assets/img/slide/main1.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">Welcome to <span>EasyET</span></h2>
                <p class="animate__animated animate__fadeInUp">개인건강관리 솔루션 EasyET에 오신걸 환영합니다. EasyET는 개인별 맞춤 운동과 식단 추천을 통하여 바쁜 현대인들의 건강관리에 도움을 줍니다. </p>
                <a href="/login/login_form.jsp" class="btn-get-started scrollto animate__animated animate__fadeInUp">지금 시작해 보기</a>
              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div class="carousel-item" style="background-image: url(assets/img/slide/main2.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">운동 및 식단 추천</h2>
                <p class="animate__animated animate__fadeInUp">작성한 인바디를 통해 본인에게 맞는 운동과 식단을 추천해줍니다.</p>
                <a href="/health/health.jsp" class="btn-get-started scrollto animate__animated animate__fadeInUp">인바디 작성하러 가기</a>
              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div class="carousel-item" style="background-image: url(assets/img/slide/award.jpg);">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2 class="animate__animated animate__fadeInDown">명예의 전당</h2>
                <p class="animate__animated animate__adeInUp">한달마다 업데이트되는 명예의 전당을 확인해보세요! </p>
                <a href="/honor/honor.jsp" class="btn-get-started scrollto animate__animated animate__fadeInUp">명예의 전당 보기</a>
              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon ri-arrow-left-line" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon ri-arrow-right-line" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      </div>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row content">
          <div class="col-lg-6">
            <h2>개인건강관리 솔루션 EasyET</h2>
            <h3>EasyET는 개인별 맞춤 운동과 식단 추천을 통하여 바쁜 현대인들의 건강관리에 도움을 줍니다. </h3>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
             	사람들은 건강하고 오래 사는 것(건강수명)을 추구하고 있습니다.치료방향 또한 병이 발병하기 전에 미리 관리하는 시대로 가고 있어 건강관리의 중요성이 더욱더 부각됩니다.  
             	또한 전세계적으로 유행하고 있는 코로나 때문에 사람들이 헬스장 같은 운동시설을 이용하지 못해 건강관리의 어려움을 겪고 있습니다.따라서 집에 있는 시간이 길어져 집에서 스스로 건강관리를 해야 하는 필요성이 대두되고 있습니다.
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> 신자유주의의 강화로 인한 노동 시간과 노동 강도의 강화</li>
              <li><i class="ri-check-double-line"></i> 직업의 불안정성과 다양한 스트레스원의 증가</li>
              <li><i class="ri-check-double-line"></i> 운동 부족, 흡연과 음주, 지방과 육류 과다 섭취</li>
            </ul>
            <p class="font-italic">
             	 건강관리에 미숙한 사람들은 혼자서 자신의 건강을 관리하기에는 무리가 있습니다. 
             	 따라서 이 웹 사이트는 사용자의 건강정보를 바탕으로 알맞은 운동방법 및 식단을 제공하여 사용자 스스로 건강관리를 할 수 있도록 도와줍니다.
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= About List Section ======= -->
    <section id="about-list" class="about-list">
      <div class="container">

        <div class="row">
          <div class="col-lg-6 order-2 order-lg-1">
            <div class="icon-box mt-5 mt-lg-0">
              <i class="bx bx-receipt"></i>
              <h4>개인별 맞춤 운동/식단 추천</h4>
              <p>사용자의 건강정보를 입력받아 알맞은 운동과 식단을 추천해줍니다.</p>
            </div>
            <div class="icon-box mt-5">
              <i class="icofont-award"></i>
              <h4>명예의 전당</h4>
              <p>이 달의 다이어트 왕을 선정하여 혼자 운동하는 사람들에게 동기부여를 해줍니다.</p>
            </div>
            <div class="icon-box mt-5">
              <i class="bx bx-images"></i>
              <h4>게시판</h4>
              <p>사용자들간의 소통을 원할하게 합니다.</p>
            </div>
            <div class="icon-box mt-5">
              <i class="bx bx-shield"></i>
              <h4>개인정보 관리</h4>
              <p>EasyET는 필요한 정보만을 수집하며 탈퇴 시 모든 정보를 삭제합니다. </p>
            </div>
          </div>
          <div class="image col-lg-6 order-1 order-lg-2" style='background-image: url("assets/img/about-list-img.jpg");'></div>
        </div>

      </div>
    </section><!-- End About List Section -->

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container">

        <div class="text-center title">
          <h3>EasyET는 당신의 건강을 응원합니다.</h3>
        </div>

        <div class="row counters">

          <div class="col-lg-4 col-6 text-center">
            <span data-toggle="counter-up"><%=user_count %></span>
            <p>가입한 회원</p>
          </div>

          <div class="col-lg-4 col-6 text-center">
            <span data-toggle="counter-up"><%=health_count %></span>
            <p>입력된 건강정보</p>
          </div>

          <div class="col-lg-4 col-6 text-center">
            <span data-toggle="counter-up"><%=board_count %></span>
            <p>작성된 게시글</p>
          </div>

          

        </div>

      </div>
    </section><!-- End Counts Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">

        <div class="section-title">
          <h2>공지사항</h2>
        </div>

        <div class="row">
        
        	<table class="table table-hover table-striped">
        		<tr>
        			<td>제목</td><td align="right">작성일</td>
        		</tr>
        		<%
        	Connection conn1 = null;
        	PreparedStatement pstmt1 = null;
        	ResultSet rs1 = null;
        	String strfirst = "";
        	String cuttime = null;
        	
        	try{
        		 String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
        		 String dbId = "yhpj";
        		 String dbPass = "Yuhan2020!";
        		
        		Class.forName ("com.mysql.jdbc.Driver"); //driver load
        		conn1 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

        		strfirst = "SELECT notice_uid, notice_title, notice_date from notice order by notice_date desc limit 5";
        		pstmt1 = conn1.prepareStatement(strfirst);
        		rs1 = pstmt1.executeQuery();
        		
        		while(rs1.next())
        		{
        			cuttime = rs1.getString(3).substring(0, 9);
        			%>  
        				
        					<tr>
        						<td><a href="/notice/notice_detail_form.jsp?noticeid=<%=rs1.getInt(1)%>"><%=rs1.getString(2) %></a></td><td align="right"><%=rs1.getString(3).substring(0, 10) %></td>
        					</tr>
        				
        			<%
        		}

        	}catch(Exception e){
        		e.printStackTrace();
        	}finally{
        		if(rs1 !=null)
        				try{rs1.close();}catch(SQLException sqle){}
        		if(pstmt1 != null)
        			try{pstmt1.close();}catch(SQLException sqle){}
        		if(conn1 != null)
        			try{conn1.close();}catch(SQLException sqle){}

        	}
        	%>
        	</table>
        </div>

      </div>
    </section><!-- End Team Section -->

    

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
                                    경기도 부천시 경인로 590 <br>
                <strong>Phone:</strong> +82 02-2610-0600<br>
                <strong>Email:</strong> chk4814@naver.com<br>
              </p>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 footer-links">
            <h4>사이트맵</h4>
            <ul>
              <li>
              	<a href="/index.jsp">Home</a>&nbsp&nbsp
              	<a href="/health/health.jsp">건강정보</a>&nbsp&nbsp
              	<a href="/honor/honor.jsp">명예의 전당</a>&nbsp&nbsp
              	<a href="/board/board_list.jsp">소통게시판</a>&nbsp&nbsp
              	<a href="/notice/notice_list.jsp">공지사항</a>&nbsp&nbsp
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