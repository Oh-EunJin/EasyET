<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	//String ss = session.getAttribute("ss").toString();
	String id = (String) session.getAttribute("ss");

	int noticeid = Integer.parseInt(request.getParameter("noticeid")); //NoticeList에서 notice_uid 받아오기

	//int pg = Integer.parseInt(request.getParameter("pg"));
	int pg = 1; //마이페이지에서 넘어올 때 pg가 빈 값이여서 1로 지정해줌.
	
	if(request.getParameter("pg")!=null) {
	pg = 1; 
	pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driverName = "com.mysql.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId = "yhpj"; //dbid설정
	String dbPass = "Yuhan2020!"; //db비밀번호 설정
%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Welcome EasyET</title>
<!-- 작성 시작 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	function goBack() {
		/*  window.history.back(); */
		location.href = "notice_list.jsp?pg=" + pg;
	}
</script>
<!-- 작성 끝 -->
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/assets/img/favicon.png" rel="icon">
<link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">

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

.hr1 {
    border: 0;
    height: 1px;
    background: #000000;
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
					if (session.getAttribute("ss") == null) {
				%>
				<a href="/login/login_form.jsp">LOGIN</a> <a
					href="/join/join_form.jsp">JOIN</a>
				<%
					} else {
				%>
				<a href="/login/logout_action.jsp">LOGOUT</a> <a
					href="/mypage/mypage.jsp">MYPAGE</a>
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
				<h1 class="text-light">
					<a href="/index.jsp">Easy<span>ET</span></a>
				</h1>
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
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

<main id="main">
<!-- 여기다 코딩 -->
<div class="main">
	<div class="container contact">
			<div class="row content" >
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12" style="text-align: center;">
					<h1 align="center">공지사항</h1>
				</div>
			</div>
			<br>
			<div>
				<hr class="hr1">
			</div>
			

			<%
				try {
				
				Class.forName("com.mysql.jdbc.Driver"); 
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); 

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();

				String NoticeLookSQL = "UPDATE notice SET notice_look_cnt = notice_look_cnt+"
												+	1
												+	" WHERE notice_uid ="
												+	noticeid;
		
				pstmt= conn.prepareStatement(NoticeLookSQL);
				pstmt.executeUpdate();
				pstmt.close();

				String NoticeSQL = "SELECT * FROM notice WHERE notice_uid=?";
				pstmt = conn.prepareStatement(NoticeSQL);
				pstmt.setInt(1, noticeid);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					String Notice_Title = rs.getString(3);
					String Notice_Name = rs.getString(2);
					String Notice_Date = rs.getString(5);
					String Notice_Content = rs.getString(4).replaceAll("\r\n", "<br>");;
					String Notice_Look_Cnt =  rs.getString(6);;
					String notice_name = "관리자";
					String date = Notice_Date.substring(0,10);
			%>
			
			<div class="row">
				<B><font size="5" align="left" style="margin-left: 20px;"><%=Notice_Title%></font></B>
			</div>

			<hr>
			
			<div class="row">
				<div style="float: left; margin-left: 20px;">
					<img
						src="./NoticeIcon/Icon_Admin3.png" alt="Circle Image"
						class="img-circle"
						style="width: 20px; height: 20px; margin-right: 10px; float: left;">
					<font size="3"><B><%=notice_name%></B></font>
					<font size="3" style="margin-left: 20px; margin-right: 20px;">|</font>
					<font size="3">등록일&nbsp;&nbsp;&nbsp;<B><%=date%></B></font>
					<font size="3" style="margin-left: 20px; margin-right: 20px;">|</font>
					<font size="3">조회수&nbsp;&nbsp;&nbsp;<B><%=Notice_Look_Cnt%></B></font>
				</div>
			</div>
				
			<hr>

			<div class="row">
				<font size="5" align="left" style="margin-left: 20px;"><%=Notice_Content%></font>
			</div>

			<!--<hr>-->
			<br><br>

			<div class="row">
			<div class="panel-group" style="margin-left: 20px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<!--<h5 class="panel-title">
							<a data-target="#collapseFour" href="#collapseFour"
								data-toggle="gsdk-collapse"> 첨부사진 </a>
						</h5>-->
					</div>
					<div class="panel-body">
						<%
									rs.close();
									pstmt.close();
									String NoticeImgSQL = "SELECT * FROM noticeimg WHERE notice_uid=?";

									pstmt = conn.prepareStatement(NoticeImgSQL);
									pstmt.setInt(1, noticeid);
									
									rs = pstmt.executeQuery();
									while (rs.next()) {
										Integer NoticeImg_Id = rs.getInt(2);
										String NoticeImg_ChangeName = rs.getString(4);
										String NoticeImg_SavePath = rs.getString(5);
						%>
									<!-- <div id="circle"> -->
									<div>
										<!--<%=NoticeImg_Id%>-->
									</div>
									&nbsp; <center> <img src="\NoticeSavePath\<%= NoticeImg_ChangeName %>" style="width:50%; height:auto;"/> </center>
						<%
									} //NoticeImg 닫는부분
						%>
					<div class="space-30"></div>
					</div>
				</div>
			</div>
			</div>
				
			<hr>
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12" style="text-align: center;">
					<button onclick="window.location='notice_list.jsp?pg=<%=pg%>'"
						class="btn btn-info">목록보기</button>
					&nbsp;
					<%
						if (session.getAttribute("ss") != null)
						if (id.equals(Notice_Name)) {
					%>
					
					<input type=button value="수정"
						OnClick="window.location='notice_modify_form.jsp?noticeid=<%=noticeid%>&noticetitle=<%=Notice_Title%>&noticecontent=<%=Notice_Content%>&pg=<%=pg%>'"
						class="btn btn-success">
					<input type=button value="삭제"
						OnClick="window.location='notice_delete_action.jsp?noticeid=<%=noticeid%>&pg=<%=pg%>'"
						class="btn btn-danger">
					<%
						}

					} //Notice 닫는부분
					%>
			</div>
			</div>
			<!-- Notice 게시물 내용 보여주는 곳 end -->

				
		<%
			conn.close();
			
			}catch(ClassNotFoundException e){
				out.println("Where is your mysql jdbc driver?");
				e.printStackTrace();
				//return;
			}
		%>
		</div>
</div>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-6 col-md-6">
						<div class="footer-info">
							<h3>EasyET</h3>
							<p>
								경기도 부천시 경인로 590 <br> <strong>Phone:</strong> +82
								02-2610-0600<br> <strong>Email:</strong> chk4814@naver.com<br>
							</p>
						</div>
					</div>

					<div class="col-lg-6 col-md-6 footer-links">
						<h4>사이트맵</h4>
						<ul>
							<li><a href="/index.jsp">Home</a>&nbsp;&nbsp; <a
								href="/health/health.jsp">건강정보</a>&nbsp;&nbsp; <a
								href="/honor/honor.jsp">명예의 전당</a>&nbsp;&nbsp; <a
								href="/board/board_list.jsp">게시판</a>&nbsp;&nbsp; <a
								href="/notice/notice_list.jsp">공지사항</a>&nbsp;&nbsp;</li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>MyBiz</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

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