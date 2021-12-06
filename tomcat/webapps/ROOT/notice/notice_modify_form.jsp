<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
    <!-- 작성 시작 -->
    <%
		request.setCharacterEncoding("UTF-8");
	
		int pg = Integer.parseInt(request.getParameter("pg"));

		int noticeid = Integer.parseInt(request.getParameter("noticeid")); 
		String Notice_Title = request.getParameter("noticetitle");
		String Notice_Content = request.getParameter("noticecontent");
		
		if(session.getAttribute("ss") == null)
		{
			response.sendRedirect("index.jsp");
		}

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String driverName = "com.mysql.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
		String dbId = "yhpj"; //dbid설정
		String dbPass = "Yuhan2020!"; 
%>
<!-- 작성 끝 -->
<!DOCTYPE html>
<html lang="utf-8">
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Welcome EasyET</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
<!-- 작성 시작 -->
<script src="//code.jquery.com/jquery.min.js"></script> <!-- 이미지 미리보기 할 때 필요한 script -->
<script type="text/javascript">
			
			// 등록 시 빈칸 검사============================================================================================================================
			 function WriteCheck()
			 {
				var form = document.NoticeModifyForm;
				if(!form.Notice_Title.value)
					{
					alert("제목을 입력해 주세요");
					form.Notice_Title.focus();
					return false;
					}
				if(!form.Notice_Content.value)
					{
					alert("내용을 입력해 주세요");
					form.Notice_Content.focus();
					return false;
					}
				return true;
			 }
			
		</script>
<!-- 작성 끝 -->
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
  <style>
.contact  {
  width: 100%;
  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);
  padding: 30px;
  background: #fff;
}

.contact .form-group {
  padding-bottom: 8px;
}

.contact .validate {
  display: none;
  color: red;
  margin: 0 0 15px 0;
  font-weight: 400;
  font-size: 13px;
}

.contact .error-message {
  display: none;
  color: #fff;
  background: #ed3c0d;
  text-align: left;
  padding: 15px;
}

.contact .error-message br + br {
  margin-top: 25px;
}

.contact .sent-message {
  display: none;
  color: #fff;
  background: #18d26e;
  text-align: center;
  padding: 15px;
  font-weight: 600;
}

.contact .loading {
  display: none;
  background: #fff;
  text-align: center;
  padding: 15px;
}

.contact .loading:before {
  content: "";
  display: inline-block;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  margin: 0 10px -6px 0;
  border: 3px solid #18d26e;
  border-top-color: #eee;
  -webkit-animation: animate-loading 1s linear infinite;
  animation: animate-loading 1s linear infinite;
}

.contact  input, .contact textarea {
  border-radius: 0;
  box-shadow: none;
  font-size: 14px;
}

.contact input {
  height: 44px;
}

.contact textarea {
  padding: 10px 12px;
}

.contact button[type="submit"] {
  background: #01b1d7;
  border: 0;
  padding: 10px 24px;
  color: #fff;
  transition: 0.4s;
  border-radius: 4px;
}

.contact  button[type="submit"]:hover {
  background: #0dd3fe;
}

.contact  button{
  background: #01b1d7;
  border: 0;
  padding: 10px 24px;
  color: #fff;
  transition: 0.4s;
  border-radius: 4px;
}
</style>

</head>
<body>
 <!-- ======= Top Bar ======= -->
  <section id="topbar" class="d-none d-lg-block">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i><a href="mailto:chk4814@naver.com ">chk4814@naver.com </a>
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
<!-- 작성 시작 -->
<div class="main">
	<div class="space-30"></div>
		<div class="container tim-container"
			style="width: 70%; align: center; margin-top: 10px;">
		<form id="NoticeModifyForm" name="NoticeModifyForm" action="notice_modify_action.jsp?noticeid=<%=noticeid %>&pg=<%=pg %>"
			method="post"  onSubmit="return WriteCheck(this);">
			<div class="row">
					<div class="col-md-12 col-sm-24">
						<div align="center">
							<h1 style="font-style: bold;">공지사항 수정</h1>
						</div>
					</div>
			</div>

			<div class="row" style="margin-top: 20px;">
					<div class="col-md-2 col-sm-4">
						<button type="button" class="btn btn-default"
							style="border: none; color: #1f50ab; font-weight: bold; font-size: 20px;"
							disabled="disabled">제목</button>
					</div>
		    			<div class="col-md-10 col-sm-20">
		    			<input type=text  id="Notice_Title" name="Notice_Title" placeholder="<%=Notice_Title%>" class="form-control" style="font-size:20px;">
					</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-2 col-sm-4">
		    			<button type="button" class="btn btn-default"
							style="border: none; color: #1f50ab; font-weight: bold; font-size: 20px;"
							disabled="disabled">내용</button>
				</div>
		    		<div class="col-md-10 col-sm-20">
		    			<textarea id="Notice_Content" name="Notice_Content" placeholder="<%=Notice_Content%>" cols="100" rows="20" style="resize:none; letter-spacing: 1px;font-size:20px;" class="form-control"></textarea>
				</div>
			</div>
			
			<div class="row"></div>
				
			<div class="row">
				<div class="col-md-12 col-sm-24">
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-24" style="text-align:center;">
					<input type="submit" value="수정" class="btn btn-success"/>
					<input type=button value="취소" OnClick="window.location='notice_list.jsp?pg=<%=pg%>'" class="btn btn-danger">
				</div>
			</div>
			<div class="row"></div>
			<div class="row"></div>
	</form>
</div>


<!-- 작성 끝 -->
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