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
String id = (String)session.getAttribute("ss");

int boardid = Integer.parseInt(request.getParameter("boardid")); //BoardList에서 board_uid 받아오기

int pg = 1;

if(request.getParameter("pg")!=null) {
	pg = 1; 
	pg = Integer.parseInt(request.getParameter("pg"));
	}


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
ResultSet rs1 = null;
ResultSet rs2 = null;

String driverName = "com.mysql.jdbc.Driver";
String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj?useSSL=false&;useUnicode=true&characterEncoding=utf8";
String dbId = "yhpj"; //dbid설정
String dbPass = "Yuhan2020!"; //db비밀번호 설정

String compareid = "qwe";
String comparereplyid = "qwe";
%>

<%
    		 Connection conn7 = null;
    		 PreparedStatement pstmt7 = null;
    		 ResultSet rs7 = null;
    		 String strfirst = "";
    		 try{
    			  jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
    			  dbId = "yhpj";
    			  dbPass = "Yuhan2020!";
    		 	
    		 	Class.forName ("com.mysql.jdbc.Driver"); //driver load
    		 	conn7 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
    		 	
				strfirst = "select name from board_good where uid=?";
    		 	pstmt7 = conn7.prepareStatement(strfirst);
    		 	pstmt7.setInt(1,boardid);
    		 	rs7 = pstmt7.executeQuery();
    		 	
    		 	if(rs7.next())
    		 	{
    		 		compareid = rs7.getString(1);
    		 	}
    		 	
    		 	


    		 }catch(Exception e){
    		 	e.printStackTrace();
    		 }finally{
    			if(rs7 !=null)
    					try{rs7.close();}catch(SQLException sqle){}
    		 	if(pstmt7 != null)
    		 		try{pstmt7.close();}catch(SQLException sqle){}
    		 	if(conn7 != null)
    		 		try{conn7.close();}catch(SQLException sqle){}

    		 }
%>

<!DOCTYPE html>
<html lang="utf-8">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Welcome EasyET</title>
<!-- 작성 시작 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	function check() {
		if (BoardReplyForm.BoardReply_Content.value == "") {
			alert('댓글 내용을 입력하세요');
			BoardReplyForm.BoardReply_Content.focus();
			return false;
		}
	}

	function goBack() {
		/*  window.history.back(); */
		location.href = "board_list.jsp?pg=" + pg;
	}
</script>

<style>
	input.goodimg-button{
		background: url('./BoardIcon/Icon_RGood.png') no-repeat;
		background-size: 99%;
		border : none;
		width: 25px;
		height: 25px;
		cursor : pointer;
		margin-left: 100px;
	}
	
	input.goodimg-buttonblue{
		background: url('./BoardIcon/icon_bluegood.png') no-repeat;
		background-size: 99%;
		border : none;
		width: 25px;
		height: 25px;
		cursor : pointer;
		margin-left: 100px;
	}
	
	input.goodimg-button2{
		background: url('./BoardIcon/Icon_RGood.png') no-repeat;
		background-size: 99%;
		border : none;
		width: 35px;
		height: 35px;
		cursor : pointer;
	}
	
	input.goodimg-button2blue{
		background: url('./BoardIcon/icon_bluegood.png') no-repeat;
		background-size: 99%;
		border : none;
		width: 35px;
		height: 35px;
		cursor : pointer;
	}
</style>
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
		<!-- 여기다 코딩 -->

		<div class="container contact">
			<%
				try {
				//드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver"); //Driver로 connection객체와 연결
				// connection 객체 세팅
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass); //위에서 로딩한 드라이버를 가지고 connection객체에 연결

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar cal = Calendar.getInstance();
				
				String BoardReplyLookCntUpdateSQL = "UPDATE board SET board_look_cnt = board_look_cnt+"
												+	1
												+	" WHERE board_uid ="
												+	boardid;
		
				pstmt= conn.prepareStatement(BoardReplyLookCntUpdateSQL);
				pstmt.executeUpdate();
				pstmt.close();
				
				String BoardSQL = "SELECT * FROM board WHERE board_uid= ? ";
				pstmt = conn.prepareStatement(BoardSQL);
				pstmt.setInt(1, boardid);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					String Board_Title = rs.getString("board_title");
					String Board_Writer = rs.getString("board_writer");
					String Board_Date = rs.getString("board_date");
					String Board_Content = rs.getString("board_content");
			%>
			<div class="row">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12">
					<h1 class="text-center">
						[ <%=Board_Title%> ]
					</h1>					
					<div style="float: left;">
					<img src='./BoardIcon/Icon_Prof.png' 
						style="width:7%; margin-right: 10px; float: left;">
						<font size="5"><%=Board_Writer%></font>
						
							<%
							
								try{
									Class.forName("com.mysql.jdbc.Driver"); 
									Connection conn2 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
							
									String sql = "SELECT NAME name1, MAX(weight) maxwei, MIN(weight) minwei FROM inbody HAVING MAX(maxwei-minwei)";
									pstmt = conn2.prepareStatement(sql);
									
									rs1= pstmt.executeQuery();
									
									while(rs1.next())
									{	
										String name1 = rs1.getString("name1");
										
										String sql2 = "SELECT name, Max(skeletal_muscle_mass), Min(skeletal_muscle_mass) FROM inbody group by name order by Max(skeletal_muscle_mass)-Min(skeletal_muscle_mass) DESC LIMIT 1"; 
										pstmt = conn2.prepareStatement(sql2);
										
										rs2= pstmt.executeQuery();
										
										while(rs2.next())
										{	
											String name2 = rs2.getString("name");
													
								if(name1.equals(Board_Writer) || name2.equals(Board_Writer)) //여기 수정하기
								{
							%>
								<img src='./BoardIcon/Icon_Queen.png' style="width:4%; margin-bottom:7px; float: left;">
							<%
								} 
							%>
							<%
										}	
									}
									rs2.close();
									rs1.close();
									conn2.close();
								
							
								}catch(ClassNotFoundException e){
									out.println("Where is your mysql jdbc driver?");
									e.printStackTrace();
									//return;
								}
				
							%>	
						<font size="3" style="margin-left: 20px;">&nbsp;&nbsp;<%=Board_Date%></font>
					</div>
				
					
					<div style="float: right;">
					<%
						if(compareid.equals(id) && compareid != null )
						{
							%>
								<input type=button class="goodimg-button2blue"
									OnClick="window.location='board_goodcnt_insert_action.jsp?boardid=<%=boardid%>&pg=<%=pg%>&what=delete'">
							<%
						}
						else
						{
							%>
							<input type=button class="goodimg-button2"
								OnClick="window.location='board_goodcnt_insert_action.jsp?boardid=<%=boardid%>&pg=<%=pg%>&what=insert'">
						<%
						}
					%>
					
					</div>
				</div>
				<div class="col-md-2 col-sm-4"></div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12">
					<hr>
				</div>
				<div class="col-md-2 col-sm-4"></div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12"
					style="margin-left: 20px; margin-right: 20px;">
					<%=Board_Content%>
				</div>
				<div class="col-md-2 col-sm-4"></div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12">
					<hr>
				</div>
				<div class="col-md-2 col-sm-4"></div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12">
					<div class="panel-group">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-target="#collapseFour" href="#collapseFour"
										data-toggle="gsdk-collapse"> </a>
								</h4>
							</div>
							<div class="panel-body" >
									<%
									rs.close();
									pstmt.close();
									
									String BoardImgSQL = "SELECT * FROM boardimg WHERE board_uid=?";

									pstmt = conn.prepareStatement(BoardImgSQL);
									pstmt.setInt(1, boardid);
									
									rs = pstmt.executeQuery();
									while (rs.next()) {
										Integer BoardImg_Id = rs.getInt("boardimg_uid");
										String BoardImg_ChangeName = rs.getString("boardimg_changename");
										String BoardImg_SavePath = rs.getString("boardimg_savepath");
									%>
									<!-- <div id="circle"> -->
									<div>
									<hr>
										<%-- <button class="btn btn-info"> <%=BoardImg_Id%> </button> --%>
									</div>
									<center> <img src="\BoardSavePath\<%= BoardImg_ChangeName %>" style="width:50%; height:auto;"/> </center>
									<%
										} //BoardImg 닫는부분
									%>
								<div class="space-30"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 col-sm-4"></div>
			</div>
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-2 col-sm-4"></div>
				<div class="col-md-8 col-sm-12" style="text-align: center;">
					<button onclick="window.location='board_list.jsp?pg=<%=pg%>'"
						class="btn btn-info">목록보기</button>
					&nbsp;
					<%
						if (session.getAttribute("ss") != null)
						if (id.equals(Board_Writer)) {
					%>
					<input type=button value="삭제"
						OnClick="window.location='board_delete_action.jsp?boardid=<%=boardid%>&pg=<%=pg%>'"
						class="btn btn-danger">
					<input type=button value="수정"
						OnClick="window.location='board_modify_form.jsp?boardid=<%=boardid%>&boardtitle=<%=Board_Title%>&boardcontent=<%=Board_Content%>&pg=<%=pg%>'"
						class="btn btn-danger">
					<%
						}

					} //Board 닫는부분
					%>
				</div>
				<div class="col-md-2 col-sm-4"></div>
			</div>
			<!-- Board 게시물 내용 보여주는 곳 end -->


			<div>
				<%
					String sqlReplyCount = "SELECT COUNT(*) FROM boardreply WHERE board_uid = ?";
				pstmt = conn.prepareStatement(sqlReplyCount);
				pstmt.setInt(1, boardid);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					Integer ReplyCount = rs.getInt(1);
				%>
				<form name="BoardReplyForm" method="post" onsubmit="return check()"
					action="board_reply_insert_action.jsp?boardid=<%=boardid%>&pg=<%=pg%>&replycnt=<%=ReplyCount%>">
					<div class="row">
						<div class="col-md-2 col-sm-4"></div>
						<div class="col-md-8 col-sm-12"
							style="text-align: Left; font-size: 25px;">
							댓글 &nbsp; <font color="#0080c0;"><%=ReplyCount%></font>
						</div>
						<div class="col-md-2 col-sm-4"></div>
					</div>
					<%
						if (session.getAttribute("ss") != null) {
					%>
					<div class="row" style="margin-top: 10px">
						<div class="col-md-2 col-sm-4"></div>
						<div class="col-md-8 col-sm-12"
							style="text-align: Left; size: 10px;">
							<textarea name="BoardReply_Content" id="BoardReply_Content"
								placeholder="댓글 내용을 입력해 주세요" cols="70" rows="3"
								style="resize: none; letter-spacing: 1px;" class="form-control"></textarea>
						</div>
						<div class="col-md-2 col-sm-4"></div>
					</div>
					<div class="row" style="margin-top: 10px">
						<div class="col-md-2 col-sm-4"></div>
						<div class="col-md-8 col-sm-12"
							style="text-align: right; size: 10px;">
							<input type="submit" value="댓글쓰기" class="btn btn-info" 
								style="align: center; background-color: rgba(254, 210, 1, 0.98); color: white;">
						</div>
						<div class="col-md-2 col-sm-4"></div>
					</div>
					<%
						}
					%>
				</form>
				<%
					}
				%>
			</div>
			<div>
				<%
					String BoardReplySQL = "SELECT * FROM boardreply WHERE board_uid = ? ORDER BY boardreply_uid DESC";

				pstmt = conn.prepareStatement(BoardReplySQL);
				pstmt.setInt(1, boardid);

				rs = pstmt.executeQuery();
				while (rs.next()) {
					String BoardReply_Uid = rs.getString("boardreply_uid");
					String BoardReply_Writer = rs.getString("boardreply_writer");
					String BoardReply_Content = rs.getString("boardreply_content");
					String BoardReply_Good_Cnt = rs.getString("boardreply_good_cnt");
					String BoardReply_Date = rs.getString("boardreply_date");
				%>
				
				<%
    		 Connection conn8 = null;
    		 PreparedStatement pstmt8 = null;
    		 ResultSet rs8 = null;
    		 String strfirst2 = "";
    		 try{
    			  jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
    			  dbId = "yhpj";
    			  dbPass = "Yuhan2020!";
    		 	
    		 	Class.forName ("com.mysql.jdbc.Driver"); //driver load
    		 	conn8 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
    		 	
				strfirst2 = "select name from reply_good where board_uid=? and reply_uid=?";
    		 	pstmt8 = conn8.prepareStatement(strfirst2);
    		 	pstmt8.setInt(1,boardid);
    		 	pstmt8.setInt(2,Integer.parseInt(BoardReply_Uid));
    		 	rs8 = pstmt8.executeQuery();
    		 	
    		 	if(rs8.next())
    		 	{
    		 		comparereplyid = rs8.getString(1);
    		 	}
    		 	

    		 }catch(Exception e){
    		 	e.printStackTrace();
    		 }finally{
    			if(rs8 !=null)
    					try{rs8.close();}catch(SQLException sqle){}
    		 	if(pstmt8 != null)
    		 		try{pstmt8.close();}catch(SQLException sqle){}
    		 	if(conn8 != null)
    		 		try{conn8.close();}catch(SQLException sqle){}

    		 }
%>
				
				
				
				
				
				<div class="row" style="margin-top: 20px;">
					<div class="col-md-2 col-sm-4"></div>
					<div class="col-md-8 col-sm-12" style="align: center; size: 10px;">
						<table style="width:100%; align: center; font-size: 20px;">
							<tr>
								<td>
									<font size="5"><%=BoardReply_Writer%></font> &nbsp;&nbsp;
									<font size="3"><%=BoardReply_Date%></font>
								</td>
								<td></td>
									<%
										if (BoardReply_Writer.equals(id)) {
											
									%>
									<td class="btn btn-danger">
										<a href="board_reply_delete_action.jsp?boardreplyid=<%=BoardReply_Uid%>&boardid=<%=boardid%>&pg=<%=pg%>"><font color="white">삭제</font></a>
									</td>
									<%
										}
									%>
							</tr>
							<tr style="margin-top: 10px;">
								<td style="margin-left: 40px; width:70%;"><%=BoardReply_Content%> </td>
								<td style="align:right">
								<%
									if(comparereplyid.equals(id) && comparereplyid != null)
									{
										%>
											<input type=button class="goodimg-buttonblue"
									OnClick="window.location='board_reply_goodcnt_insert_action.jsp?boardid=<%=boardid%>&pg=<%=pg%>&boardreplyid=<%=BoardReply_Uid%>&what=delete'">
										<%
									}
									else
									{
										%>
											<input type=button class="goodimg-button"
									OnClick="window.location='board_reply_goodcnt_insert_action.jsp?boardid=<%=boardid%>&pg=<%=pg%>&boardreplyid=<%=BoardReply_Uid%>&what=insert'">
										<%
									}
								%>
								<font size="5"><%=BoardReply_Good_Cnt %></font>
								</td>
							</tr>
						</table>	
					</div>
					<div class="col-md-2 col-sm-4"></div>
				</div>
				<div class="row">
					<div class="col-md-2 col-sm-4"></div>
					<div class="col-md-8 col-sm-12" style="align: center; size: 10px;">
						<hr>
					</div>
					<div class="col-md-2 col-sm-4"></div>
				</div>
				<%
					}

				rs.close();
				pstmt.close();
				conn.close();

				} catch (Exception e) {
				out.println("Where is your mysql jdbc driver?");
				out.println(e.getMessage());
				e.printStackTrace();
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
							<li>
							<a href="/index.jsp">Home</a>&nbsp;&nbsp; 
							<a href="/health/health.jsp">건강정보</a>&nbsp;&nbsp; 
							<a href="/honor/honor.jsp">명예의 전당</a>&nbsp;&nbsp; 
							<a href="/board/board_list.jsp">소통게시판</a>&nbsp;&nbsp; 
							<a href="/notice/notice_list.jsp">공지사항</a>&nbsp;&nbsp;
							</li>
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