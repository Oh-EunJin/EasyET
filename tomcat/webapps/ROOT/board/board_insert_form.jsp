<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!-- 작성 시작 -->
<%
		request.setCharacterEncoding("UTF-8");
		//String login = (String)session.getAttribute("Login");
		//String userid = (String)session.getAttribute("UserID");
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//로그인이 안돼있는 경우 index 페이지로 돌아감 
		if(session.getAttribute("ss") == null)
		{
			response.sendRedirect("index.jsp");
		}
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
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- 이미지 미리보기 할 때 필요한 script -->
<script type="text/javascript">

			//첨부파일 동적 추가하는 부분============================================================================================================================
			BoardImg_cnt = 0;
			 function BoardImg_AddItem()
			 {
				 BoardImg_cnt++;
				 BoardImgdiv = document.createElement('BoardImgdiv'); //div id값 받아오는 부분
				 BoardImgdiv.className = 'row';
				 BoardImgdiv.innerHTML += "<br><br>" + "사진 #"
				 	+ BoardImg_cnt
					+ "<img name=BoardImg id=BoardImg"+BoardImg_cnt +" src='' style='width:70%;align:center;'/>"
					+ "&nbsp;&nbsp;"
					+ "<input type=file name=BoardImgFile"+BoardImg_cnt + " id=BoardImgPreview"+ BoardImg_cnt +" accept='.jpeg, .jpg, .jpe, .jfif, .PNG, .png, .img' />"
					+ "&nbsp;&nbsp;"
					+ "<input type=button value='X' onclick='BoardImg_removeRow(this)' style='align:right; font-weight:bold; font-size:10px; height:30px' class='btn btn-primary btn-fill' /> <br><br><hr>";
					
					document.getElementById('BoardImgdiv').appendChild(BoardImgdiv); //Input 값 유지시켜주는 부분	
			
					
					$(function() {
						$('#BoardImgPreview' + BoardImg_cnt).on('change', function() {
							ReadBoardImgURL(this);
						}); 
					});
			
					function ReadBoardImgURL(input) {
						if (input.files && input.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$('#BoardImg'+ BoardImg_cnt).attr('src', e.target.result);
							}
							reader.readAsDataURL(input.files[0]);
						}
			
					}
					
			 }
			 
			 //Board 동적으로 추가한 행 삭제
			 function BoardImg_removeRow(input)
			 {
				 document.getElementById('BoardImgdiv').removeChild(input.parentNode);
				 BoardImg_cnt--;
			 }
			 
			// 등록 시 빈칸 검사============================================================================================================================
				function BoardWriteCheck()
					{
						var form = document.BoardForm;
					
						if(!form.Board_Title.value)
							{
								alert("제목을 입력해 주세요");
								form.Board_Title.focus();
								return false;
							} else if(!form.Board_Content.value)
							{
								alert("내용을 입력해 주세요");
								form.Board_Content.focus();
								return false;
							} else if(form.Board_Title.value.match("시발") || form.Board_Title.value.match("꺼져") || form.Board_Title.value.match("개새") )
							 {  
								 alert("제목 욕설 금지");
								 document.getElementById("Board_Title").value='';
								 form.Board_Title.focus();
								 return false;
							}else if(form.Board_Content.value.match("시발") || form.Board_Content.value.match("꺼져") || form.Board_Content.value.match("개새"))
							 {  
								 alert("본문 욕설 금지");
								 document.getElementById("Board_Content").value='';
								 form.Board_Content.focus();
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

</head>
<body>
	<!-- ======= Top Bar ======= -->
	<section id="topbar" class="d-none d-lg-block">
		<div class="container d-flex">
			<div class="contact-info mr-auto">
				<i class="icofont-envelope"></i><a href="mailto:chk4814@naver.com">chk4814@naver.com</a>
				<i class="icofont-phone phone-icon"></i> +82 02-2610-0600
			</div>
			<div>
				<%
      	if(session.getAttribute("ss") == null)
      	{
    	  %>
				<a href="/login/login_form.jsp">LOGIN</a> <a
					href="/join/join_form.jsp">JOIN</a>
				<%
      	}
      	else
      	{
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
							<li><a href="/board/board_list.jsp">소통게시판</a></li>
							<li><a href="/notice/notice_list.jsp">공지사항</a></li>
						</ul>
				</ul>
			</nav>
			<!-- .nav-menu -->

		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<!-- 작성 시작 -->
		<div class="space-30"></div>
		<div class="container tim-container"
			style="width: 70%; align: center; margin-top: 10px;">
			<form name="BoardForm" id="BoardForm" action="board_insert_action.jsp?pg=<%=pg %>"
				method="post" onSubmit="return BoardWriteCheck(this);" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-12 col-sm-24">
						<div align="center">
							<h1 style="font-style: bold;">소통글작성</h1>
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
						<input type=text id="Board_Title" name="Board_Title" placeholder="제목을 입력해 주세요"
							class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-4">
						<button type="button" class="btn btn-default"
							style="border: none; color: #1f50ab; font-weight: bold; font-size: 20px;"
							disabled="disabled">내용</button>
					</div>
					<div class="col-md-10 col-sm-20">
						<textarea id="Board_Content" name="Board_Content" placeholder="내용을 입력해 주세요"
							cols="100" rows="20" style="resize: none; letter-spacing: 1px;"
							class="form-control"></textarea>
					</div>
				</div>
				
				<div class="row"></div>
				<div class="row"></div>
				<div class="row">
					<div class="col-md-2 col-sm-4">
						<button type="button" class="btn btn-default"
							style="border: none; color: #1f50ab; font-weight: bold; font-size: 20px;"
							disabled="disabled">사진첨부</button>
					</div>
					<div class="col-md-10 col-sm-20">
						<div id="BoardImgdiv" style="align: left;"></div>
						<input type="button" value="파일 추가하기" onclick="BoardImg_AddItem()"
							class="btn btn-primary btn-round">
							
					</div>
				</div> 
				<div class="row">
					<div class="col-md-12 col-sm-24">
						<hr>
					</div>
				</div>
				<div class="row"></div>
				<div class="row">
					<div class="col-md-12 col-sm-24" style="text-align: center;">
						<input type="submit" value="글쓰기" class="btn btn-success"/>
					</div>
				</div>
				<div class="row"></div>
				<div class="row"></div>
			</form>
		</div>

		<!-- 작성 끝 -->
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
								href="/board/board_list.jsp">소통게시판</a>&nbsp;&nbsp; <a
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
				<!-- Purchase the pro version with worki`ng PHP/AJAX contact form: https://bootstrapmade.com/mybiz-free-business-bootstrap-theme/ -->
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