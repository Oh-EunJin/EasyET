<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
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
  
<script type="text/javascript">
	function formSubmit(index) {
		if(index ==1){
			if(document.getElementById('pwd').value != null && document.getElementById('pwd').value != ''
				 && document.getElementById('address').value != null && document.getElementById('address').value != '' 
				 && document.getElementById('name').value != null && document.getElementById('name').value != ''){
				document.myform.action='mypage_modify_action.jsp';	
			}else{
				alert('빠짐없이 입력해주세요.');
			}
		}
		if(index ==2){
			document.myform.action='mypage_delete_form.jsp';
		}
		document.myform.submit();
	}
</script>
</head>
<style>
.buttonStyle {
  background: #01b1d7;
  border: 0;
  padding: 10px 24px;
  color: #fff;
  transition: 0.4s;
  border-radius: 4px;
}
</style>
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
          		<li><a href="/board/board_list.jsp">게시판</a></li>
          		<li><a href="/notice/notice_list.jsp">공지사항</a></li>
          	</ul>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <main id="main">
  	<!-- 여기다 코딩 -->
  	<%
	//Map<String, String> articles = new HashMap<String,String>();
  	Map<String, Object> article = new HashMap<>();
  	String id = session.getAttribute("ss").toString();
  	
 	List<Map<String, String>> articles = new ArrayList<>();
  	String id2 = session.getAttribute("ss").toString();
  	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj";
		String dbPass = "Yuhan2020!";
		conn = DriverManager.getConnection(url,dbId,dbPass);
		
		stmt = conn.createStatement();
		String sql = "SELECT * FROM user where user_id ='" + id +"'";
		rs = stmt.executeQuery(sql);
		
		while ( rs.next() ) {
			article.put("id",rs.getString("user_id"));
			article.put("address",rs.getString("user_address"));
			article.put("name",rs.getString("user_name"));
			article.put("tel",rs.getString("user_tel"));
			article.put("promise",rs.getString("user_promise"));
			
		//	articles.add(article);
		}
		/* 
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
	}    */

/*  	List<Map<String, String>> articles = new ArrayList<>();
  	String id2 = session.getAttribute("ss").toString(); */
  	

	Connection conn2 = null;
	Statement stmt2 = null;
	ResultSet rs2 = null;
	
/* 	try {
		String url = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj";
		String dbPass = "Yuhan2020!";
		conn = DriverManager.getConnection(url,dbId,dbPass);
		
		stmt = conn.createStatement(); */
		String sql2 = "SELECT * FROM board where board_writer ='" + id2 +"' order by board_date desc";
		rs = stmt.executeQuery(sql2);
		
		while ( rs.next() ) {
			Map<String, String> article2 = new HashMap<>();
			article2.put("id",rs.getString("board_writer"));
			article2.put("title",rs.getString("board_title"));
			article2.put("content",rs.getString("board_content"));
			article2.put("bDate",rs.getString("board_date"));
			article2.put("bId",rs.getString("board_uid"));
			
			articles.add(article2);
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
  	
  	<section id="contact" class="contact">
      <div class="container">
        <div class="section-title">
          <span>MYPAGE</span>
          <h2>MYPAGE</h2>
          <p>회원정보 조회 / 수정 / 탈퇴</p>
        </div>
      </div>
      <div class="container">

        <div class="info-wrap mt-5">
          <div class="row">
            <div class="col-lg-4 info">
              <i class="ri-map-pin-line"></i>
              <h4>Address:</h4>
              <p><%= article.get("address") %></p>
            </div>

            <div class="col-lg-4 info mt-4 mt-lg-0">
              <i class="ri-mail-line"></i>
              <h4>Email:</h4>
              <p><%= article.get("id") %></p>
            </div>

            <div class="col-lg-4 info mt-4 mt-lg-0">
              <i class="ri-phone-line"></i>
              <h4>Call:</h4>
              <p><%= article.get("tel") %></p>
            </div>
          </div>
        </div>

        <form name='myform' method="post" role="form" class="php-email-form">
          <div class="form-row">
            <div class="col-md-6 form-group">
              <input type="text" name="id" class="form-control" id="id" value="<%= article.get("id") %>" readonly="readonly" disabled />
              <div class="validate"></div>
            </div>
            <div class="col-md-6 form-group">
              <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Your PASSWORD" >
              <div class="validate"></div>
            </div>
          </div>
          <div class="form-row">
          <div class="col-md-6 form-group">
            <input type="text" class="form-control" name="tel" id="tel" placeholder="전화번호" value="<%= article.get("tel") %>" />
            <div class="validate"></div>
          </div>
          <div class="col-md-6 form-group">
              <input type="text" class="form-control" name="name" id="name" placeholder="이름" value="<%= article.get("name") %>" />
              <div class="validate"></div>
          </div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control" name="address" id="address" placeholder="주소" value="<%= article.get("address") %>" />
            <div class="validate"></div>
          </div>
          <div class="form-group">
            <input type="text" class="form-control" name="promise" id="promise" placeholder="나의 다짐" value="<%= article.get("promise") %>" />
            <div class="validate"></div>
          </div>
          <div class="mb-3">
            <div class="loading">Loading</div>
            <div class="error-message"></div>
            <div class="sent-message">Your message has been sent. Thank you!</div>
          </div>
          <div class="text-center"><input type="button" class="buttonStyle" onclick='formSubmit(1)' value='수정' />
          <input type="button" onclick='formSubmit(2)' class="buttonStyle" value='탈퇴' /></div>
        </form>

      </div>
    </section><!-- End Contact Section -->
    
        <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container">
        <div class="section-title">
          <h2>내가 쓴 글</h2>
          <p>소통게시판에 작성한 글을 보여줍니다.</p>
        </div>
        <div class="row">
			<%
			if(articles.size() != 0 ){
				for ( int i = 0; i < articles.size(); i++ ) { %>
	            <div class="col-md-6 mt-4 mt-md-0">
		            <div class="icon-box">
		              <i class="bx bx-receipt"></i>
		              <h4><a href = "/board/board_detail_form.jsp?boardid=<%= articles.get(i).get("bId")%>"><%= articles.get(i).get("title") %></a></h4>
		              <p><%= articles.get(i).get("content") %><br>
		              <%= articles.get(i).get("bDate") %></p>
	              </div>
	          	</div>
			<% }
			} else{%>
				<p>작성한 글이 없습니다.</p>
			<%}%>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Services Section -->
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
              	<a href="/board/board_list.jsp">게시판</a>&nbsp&nbsp
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