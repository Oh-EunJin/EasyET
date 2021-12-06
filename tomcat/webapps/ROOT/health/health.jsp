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
  
<script >
function jumpMenu(frm){
	location.href=frm.jump.options[frm.jump.selectedIndex].value;
	frm.jump.selectedIndex.selected;
}
</script>
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
</style>


  <main id="main">
  <br><br>
  
  
 <%
      if(session.getAttribute("ss") == null)
      {
      	%>
    	 	<div class="container contact">
  				<div class="row content">
  					<div class="col-lg-6">
  						<h2>로그인 안내</h2>
  						<h4>건강정보를 이용하려면 로그인이 필요합니다.<br><a href="/login/login_form.jsp">로그인하러 가기</a></h4>
  					</div>
  				</div>
  			</div>
    	<%
      }
      else
      {
    		String ss = session.getAttribute("ss").toString();
    		String myid = null;
    		String myname = null;
    		
    		String date = request.getParameter("date");
    		
    		
    		//이건 인바디변수
    		int inbody_uid = 0;
    		String name = null;
    		int sex = 0;
    		int age = 0;
    		Timestamp check_date = new Timestamp(System.currentTimeMillis());
    		float totalbodywater = 0;
    		float protein = 0;
    		float mineral = 0; 
    		float bodyfat = 0;
    		float height = 0;
    		float weight = 0;
    		float skeletal_muscle_mass = 0; 
    		float bmi = 0; 
    		float percentbodyfat = 0; 
    		int leftarm_muscle = 0; 
    		int rightarm_muscle = 0; 
    		int leftleg_muscle = 0; 
    		int rightleg_muscle = 0; 
    		int center_muscle = 0;
    		int leftarm_fat = 0;
    		int leftleg_fat = 0;
    		int rightarm_fat = 0;
    		int rightleg_fat = 0;
    		int center_fat = 0;
    		
    		Timestamp today = new Timestamp(System.currentTimeMillis());
    		Timestamp getdatefromboard = new Timestamp(System.currentTimeMillis());
    		getdatefromboard = Timestamp.valueOf("1900-01-01 00:00:00.0");
    		java.text.SimpleDateFormat today_date_format = new java.text.SimpleDateFormat("yyyy-MM-dd");
    		
    			
    	
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
    	    		 	
    					str = "select id,name from member where id=?";
    	    		 	pstmt = conn.prepareStatement(str);
    	    		 	pstmt.setString(1,ss);
    	    		 	rs = pstmt.executeQuery();
    	    		 	
    	    		 	while(rs.next())
    	    		 	{
    	    		 		myid = rs.getString(1);
    	    		 		myname = rs.getString(2);
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
    	   	<div class="container contact">
  	<form name="inbody_form" method="post" action="health_action.jsp" class="php-email-form">
  		<div class="row content"><div class="col-lg-6"><h2>InBody</h2></div></div>
  		
                    <div align="right">
                    	<button type="button" class="btn btn-light btn-block" style="width:20%; background-color: #01b1d7; fon" onclick="location.href='/health/health_form.jsp' "><font color="white">Inbody작성</font></button>
                    </div>
                        	<%
    		 Connection conn1 = null;
    		 PreparedStatement pstmt1 = null;
    		 ResultSet rs1 = null;
    		 String strfirst = "";
    		 try{
    			 String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
    			 String dbId = "yhpj";
    			 String dbPass = "Yuhan2020!";
    		 	
    		 	Class.forName ("com.mysql.jdbc.Driver"); //driver load
    		 	conn1 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
    		 	
				strfirst = "select user_id from user where user_id=?";
    		 	pstmt1 = conn1.prepareStatement(strfirst);
    		 	pstmt1.setString(1,ss);
    		 	rs1 = pstmt1.executeQuery();
    		 	
    		 	while(rs1.next())
    		 	{
    		 		myid = rs1.getString(1);
    		 	}
    		 	
    		 	strfirst = "select check_date from inbody where name=? order by check_date desc";
    		 	pstmt1 = conn1.prepareStatement(strfirst);
    		 	pstmt1.setString(1,ss);
    		 	rs1 = pstmt1.executeQuery();
    		 	
    		 	%>
    		 		<form name="forms" method="post" action="health.jsp" >
          				<select name="jump" onChange="jumpMenu(this.form)" class="form-control input-shadow" style="width:30%;">
            				<option value="" >날짜 선택</option>
	    	
 
	    
		 		<%
    		 	
    		 	while(rs1.next())
    		 	{
    		 		%>
    		 		<option value="health.jsp?date=<%=rs1.getTimestamp(1)%>">
    		 			<%=rs1.getTimestamp(1)%>
    		 		</option>
    		 		<%
    		 	}
		 		%>
		 		</select>
		 		<%
    		 	strfirst = "SELECT uid, NAME, sex, age, check_date, totalbodywater, protein, mineral, " +
    		 			"bodyfat, height, weight, skeletal_muscle_mass, bmi,percentbodyfat, leftarm_muscle, rightarm_muscle, leftleg_muscle, " +
    		 			"rightleg_muscle, center_muscle, leftarm_fat, leftleg_fat, rightarm_fat, rightleg_fat, center_fat " +
    		 			"FROM inbody WHERE name=? and check_date=?";
    		 	pstmt1 = conn1.prepareStatement(strfirst);
    		 	pstmt1.setString(1,ss);
    		 	pstmt1.setString(2, date);
    		 	rs1 = pstmt1.executeQuery();
    		 	
    		 	while(rs1.next())
    		 	{
    		 		inbody_uid = rs1.getInt(1);
    		 		name = rs1.getString(2);
    		 		sex = rs1.getInt(3);
    		 		age = rs1.getInt(4);
    		 		check_date = rs1.getTimestamp(5);
    		 		totalbodywater = rs1.getFloat(6);
    		 		protein = rs1.getFloat(7);
    		 		mineral = rs1.getFloat(8);
    		 		bodyfat = rs1.getFloat(9);
    		 		height = rs1.getFloat(10);
    		 		weight = rs1.getFloat(11);
    		 		skeletal_muscle_mass = rs1.getFloat(12);
    		 		bmi = rs1.getFloat(13);
    		 		percentbodyfat = rs1.getFloat(14);
    		 		rightarm_muscle = rs1.getInt(15);
    		 		rightarm_muscle = rs1.getInt(16);
    		 		leftleg_muscle = rs1.getInt(17);
    		 		rightleg_muscle = rs1.getInt(18);
    		 		center_muscle = rs1.getInt(19);
    		 		leftarm_fat = rs1.getInt(20);
    		 		leftleg_fat = rs1.getInt(21);
    		 		rightarm_fat = rs1.getInt(22);
    		 		rightleg_fat = rs1.getInt(23);
    		 		center_fat = rs1.getInt(24);
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
                    <hr>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td>아이디<br><%=name %></td>
                    		<td>신장<br><%=height %>cm</td>
                    		<td>연령<br><%=age %></td>
                    		<td>성별<br><%if(sex == 1){%>남자<%}else{%>여자<%} %></td>
                    		<td>검사일시<br><%=check_date %></td>
                    	</tr>
                    </table><hr><br>
                     <h4>체성분분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td>우리 몸을 이루고 있는 물</td><td>체수분(L)</td><td><%=totalbodywater %></td>
                    	</tr>
                    	<tr>
                    		<td>근육을 만들어 주는</td><td>단백질(kg)</td><td><%=protein %></td>
                    	</tr>
                    	<tr>
                    		<td>뼈를 단단하게 해주는</td><td>무기질(kg)</td><td><%=mineral %></td>
                    	</tr>
                    	<tr>
                    		<td>남은 에너지를 저장해 놓은</td><td>체지방량(kg)</td><td><%=bodyfat %></td>
                    	</tr>
                    	<tr>
                    		<td>체수분, 단백질, 무기질, 체지방을 모두 합하면</td><td>체중(kg)</td><td><%=weight %></td>
                    	</tr>
                    </table><hr><br>
                    <h4>골격근 지방 분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td></td><td>측정치</td>
                    	</tr>
                    	<tr>
                    		<td>체중(kg)</td><td><%=weight %></td>
                    	</tr>
                    	<tr>
                    		<td>골격근량(kg)</td><td><%=skeletal_muscle_mass %></td>
                    	</tr>
                    	<tr>
                    		<td>체지방량(kg)</td><td><%=bodyfat %></td>
                    	</tr>
                    </table><hr><br>
                    <h4>비만분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td></td><td>측정치</td><td>비고</td>
                    	</tr>
                    	<tr>
                    		<td>BMI(kg/㎡)</td><td><%=bmi %></td>
                    		<td>
                    			<%
                    				if(bmi >= 30)
                    				{
                    					%>고도비만<%
                    				}
                    				else if(bmi >= 25)
                    				{
                    					%>비만<%
                    				}
                    				else if(bmi >= 23)
                    				{
                    					%>과체중<%
                    				}
                    				else if(bmi >= 18.5)
                    				{
                    					%>평균<%
                    				}
                    				else
                    				{
                    					%>평균이하<%
                    				} 
                    			%>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>체지방률(%)</td><td><%=percentbodyfat %></td><td><%if(percentbodyfat >= 20){%>평균이상<i class="zmdi zmdi-long-arrow-up"></i><%}else if(percentbodyfat >= 10){%>평균<%}else{%>평균이하<i class="zmdi zmdi-long-arrow-down"><%} %></td>
                    	</tr>
                    </table><hr><br>
                    <h4>부위별 분석</h4>
                    <table class="table table-hover table-striped">
                    	<tr>
                    		<td colspan="2" align="center">부위별근육분석</td>
                    		<td colspan="2" align="center">부위별체지방분석</td>
                    	</tr>
                    	<tr>
                    		<td>왼팔근육(<%if(rightarm_muscle == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(rightarm_muscle == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td align="right">오른팔근육(<%if(rightarm_muscle == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(rightarm_muscle == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td>왼팔지방(<%if(leftarm_fat == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(leftarm_fat == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td align="right">오른팔지방(<%if(rightarm_fat == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(rightarm_fat == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    	</tr>
                    	<tr>
                    		<td colspan="2" align="center">복부근육(<%if(center_muscle == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(center_muscle == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td colspan="2" align="center">복부지방(<%if(center_fat == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(center_fat == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    	</tr>
                    	<tr>
                    		<td>왼다리근육(<%if(leftleg_muscle == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(leftleg_muscle == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td align="right">오른다리근육(<%if(rightleg_muscle == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(rightleg_muscle == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td>왼다리지방(<%if(leftarm_fat == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(leftarm_fat == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    		<td align="right">오른다리지방(<%if(rightleg_fat == 0) {%> 평균이하<i class="zmdi zmdi-long-arrow-down"> <%}else if(rightleg_fat == 1) { %> 평균<% } else {%> 평균이상<i class="zmdi zmdi-long-arrow-up"></i> <% } %>)</td>
                    	</tr>
                    </table>
                     <div align="center">
                    	<button type="button" class="btn btn-light btn-block" style="width:20%; background-color: #01b1d7; fon" onclick="location.href='/health/health_rec_list.jsp?name=<%=name%>&check_date=<%=check_date%>' "><font color="white">운동/식단 추천받기</font></button>
                    </div>
                    </form>
  	</div>
    	   <%
    	    		 
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