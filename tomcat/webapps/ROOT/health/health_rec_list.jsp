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
  


<%

%>
  
  <%
  	//session.setAttribute("ss","test@naver.com");
	String ss = session.getAttribute("ss").toString();	
	String id = request.getParameter("name");
	String date = request.getParameter("check_date");
	
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
%>
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

	strfirst = "SELECT uid, NAME, sex, age, check_date, totalbodywater, protein, mineral, " +
			"bodyfat, height, weight, skeletal_muscle_mass, bmi,percentbodyfat, leftarm_muscle, rightarm_muscle, leftleg_muscle, " +
			"rightleg_muscle, center_muscle, leftarm_fat, leftleg_fat, rightarm_fat, rightleg_fat, center_fat " +
			"FROM inbody WHERE name=? and check_date=?";
	pstmt1 = conn1.prepareStatement(strfirst);
	pstmt1.setString(1,id);
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
		leftarm_muscle = rs1.getInt(16);
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

<%
	float tb = (totalbodywater/weight)*100;
	int fat = 0; //0:평균 이하, 1:평균, 2:평균이상
	int water = 0;//0:평균 이하, 1:평균
	float pmuscle = (skeletal_muscle_mass/weight)*100;
	int muscle = 0;//0:평균 이하, 1:평균, 2:평균이상
	
	if(sex == 1)
	{
		if(percentbodyfat >= 25)
		{
			fat = 2;
		}
		else if(percentbodyfat > 11)
		{
			fat = 1;
		}
		else
		{
			fat = 0;
		}
		
		if(tb >= 50 && tb < 70)
		{
			water = 1;
		}
		else if(tb < 50)
		{
			water = 0;
		}
		
		if(pmuscle > 50)
		{
			muscle = 2;
		}
		else if(pmuscle > 45)
		{
			muscle = 1;
		}
		else
		{
			muscle = 0;
		}
	}
	else
	{
		if(percentbodyfat >= 30)
		{
			fat = 2;
		}
		else if(percentbodyfat > 11)
		{
			fat = 1;
		}
		else
		{
			fat = 0;
		}
		
		if(tb >= 45 && tb < 65)
		{
			water = 1;
		}
		else if(tb < 45)
		{
			water = 0;
		}
		
		if(pmuscle > 40)
		{
			muscle = 2;
		}
		else if(pmuscle > 35)
		{
			muscle = 1;
		}
		else
		{
			muscle = 0;
		}
	}
	
	String intro = "회원님은 ";
	
	if(bmi >= 30)
	{
		intro+= "고도비만 입니다. ";
	}
	else if(bmi >= 25)
	{
		intro+= "비만 입니다. ";
	}
	else if(bmi >= 23)
	{
		intro+= "과체중 입니다. ";
	}
	else if(bmi >= 18)
	{
		intro+= "정상체중 입니다. ";
	}
	else
	{
		intro+= "저체중 입니다. ";
	}
	
	if(fat == 2)
	{
		intro+= "체지방은 평균 이상 입니다. ";
	}
	else if(fat == 1)
	{
		intro+= "체지방은 평균 입니다. ";
	}
	else
	{
		intro+= "체지방은 평균 이하 입니다. ";
	}
	
	if(water == 1)
	{
		intro+= "체수분은 평균이며 ";
	}
	else
	{
		intro+= "체수분은 평균이하 이며 ";
	}
	
	if(muscle == 2)
	{
		intro+= "골격근량은 평균 이상 입니다. ";
	}
	else if(muscle == 1)
	{
		intro+= "골격근량은 평균 입니다. ";
	}
	else
	{
		intro+= "골격근량은 평균 이하 입니다. ";
	}
	
	
	
%>

<%
Connection conn2 = null;
PreparedStatement pstmt2 = null;
ResultSet rs2 = null;
String strfirst2 = "";

int rec_exercise_fat_uid = 0;
String rec_exercise_fat_title = "";
String rec_exercise_fat_link ="";
String rec_exercise_fat_comment ="";

int rec_exercise_muscle_uid = 0;
String rec_exercise_muscle_title = "";
String rec_exercise_muscle_link ="";
String rec_exercise_muscle_comment ="";

int rec_exercise_abs_uid = 0;
String rec_exercise_abs_title = "";
String rec_exercise_abs_link ="";
String rec_exercise_abs_comment ="";

int rec_exercise_upperbody_uid = 0;
String rec_exercise_upperbody_title = "";
String rec_exercise_upperbody_link ="";
String rec_exercise_upperbody_comment ="";

int rec_exercise_leg_uid = 0;
String rec_exercise_leg_title = "";
String rec_exercise_leg_link ="";
String rec_exercise_leg_comment ="";

int rec_food_fat_uid = 0;
String rec_food_fat_title = "";
String rec_food_fat_link ="";
String rec_food_fat_comment ="";

int rec_food_muscle_uid = 0;
String rec_food_muscle_title = "";
String rec_food_muscle_link ="";
String rec_food_muscle_comment ="";

int rec_food_water_uid = 0;
String rec_food_water_title = "";
String rec_food_water_link ="";
String rec_food_water_comment ="";

try{
	 String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	 String dbId = "yhpj";
	 String dbPass = "Yuhan2020!";
	
	Class.forName ("com.mysql.jdbc.Driver"); //driver load
	conn2 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	if(fat == 2)
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"cardio0");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_fat_uid = rs2.getInt(1);
			rec_exercise_fat_title = rs2.getString(2);
			rec_exercise_fat_link = rs2.getString(3);
			rec_exercise_fat_comment = rs2.getString(4);
		}
		
		strfirst2 = "select uid,title,link,comment from info_food where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"diet");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_food_fat_uid = rs2.getInt(1);
			rec_food_fat_title = rs2.getString(2);
			rec_food_fat_link = rs2.getString(3);
			rec_food_fat_comment = rs2.getString(4);
		}
	}
	else
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"cardio1");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_fat_uid = rs2.getInt(1);
			rec_exercise_fat_title = rs2.getString(2);
			rec_exercise_fat_link = rs2.getString(3);
			rec_exercise_fat_comment = rs2.getString(4);
		}
		
		strfirst2 = "select uid,title,link,comment from info_food where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"muscle");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_food_fat_uid = rs2.getInt(1);
			rec_food_fat_title = rs2.getString(2);
			rec_food_fat_link = rs2.getString(3);
			rec_food_fat_comment = rs2.getString(4);
		}
	}
	
	if(muscle == 2)
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"muscle1");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_muscle_uid = rs2.getInt(1);
			rec_exercise_muscle_title = rs2.getString(2);
			rec_exercise_muscle_link = rs2.getString(3);
			rec_exercise_muscle_comment = rs2.getString(4);
		}
		
		strfirst2 = "select uid,title,link,comment from info_food where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"muscle");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_food_muscle_uid = rs2.getInt(1);
			rec_food_muscle_title = rs2.getString(2);
			rec_food_muscle_link = rs2.getString(3);
			rec_food_muscle_comment = rs2.getString(4);
		}
	}
	else
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"muscle0");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_muscle_uid = rs2.getInt(1);
			rec_exercise_muscle_title = rs2.getString(2);
			rec_exercise_muscle_link = rs2.getString(3);
			rec_exercise_muscle_comment = rs2.getString(4);
		}
		
		strfirst2 = "select uid,title,link,comment from info_food where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"muscle");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_food_muscle_uid = rs2.getInt(1);
			rec_food_muscle_title = rs2.getString(2);
			rec_food_muscle_link = rs2.getString(3);
			rec_food_muscle_comment = rs2.getString(4);
		}
	}
	
	if(water == 0)
	{
		strfirst2 = "select uid,title,link,comment from info_food where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"water");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_food_water_uid = rs2.getInt(1);
			rec_food_water_title = rs2.getString(2);
			rec_food_water_link = rs2.getString(3);
			rec_food_water_comment = rs2.getString(4);
		}
	}
	
	if(center_muscle == 0)
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"abs");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_abs_uid = rs2.getInt(1);
			rec_exercise_abs_title = rs2.getString(2);
			rec_exercise_abs_link = rs2.getString(3);
			rec_exercise_abs_comment = rs2.getString(4);
		}
	}
	
	if(rightarm_muscle == 0 || leftarm_muscle == 0)
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"upperbody");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_upperbody_uid = rs2.getInt(1);
			rec_exercise_upperbody_title = rs2.getString(2);
			rec_exercise_upperbody_link = rs2.getString(3);
			rec_exercise_upperbody_comment = rs2.getString(4);
		}
	}
	
	if(rightleg_muscle == 0 || leftleg_muscle == 0)
	{
		strfirst2 = "select uid,title,link,comment from info_exercise where category=?";
		pstmt2 = conn2.prepareStatement(strfirst2);
		pstmt2.setString(1,"leg");
		rs2 = pstmt2.executeQuery();
		
		while(rs2.next())
		{
			rec_exercise_leg_uid = rs2.getInt(1);
			rec_exercise_leg_title = rs2.getString(2);
			rec_exercise_leg_link = rs2.getString(3);
			rec_exercise_leg_comment = rs2.getString(4);
		}
	}
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs2 !=null)
			try{rs2.close();}catch(SQLException sqle){}
	if(pstmt2 != null)
		try{pstmt2.close();}catch(SQLException sqle){}
	if(conn2 != null)
		try{conn2.close();}catch(SQLException sqle){}

}
%>


  

  <main id="main">
  <br><br>
  <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container">
		
        <div class="section-title">
          <span>운동 및 식단</span>
          <h2>운동 및 식단</h2>
          <p><%=id %>님! 추천하는 운동과 식단입니다.</p>
          <p><%=intro %> </p>
        </div>

        <div class="row">
        
          <div class="col-md-6">
            <div class="icon-box">
              <i class="icofont-runner-alt-1"></i>
              <h4><a href="#"><%=rec_exercise_fat_title %></a></h4>
              <p><%=rec_exercise_fat_comment %></p>
              <p><iframe  width="100%" height="100%" src="<%=rec_exercise_fat_link %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
            </div>
          </div>
          
          <div class="col-md-6 mt-4 mt-md-0">
          <a href="health_food_info.jsp?url=<%=rec_food_fat_link %>">
            <div class="icon-box">
              <i class="icofont-culinary"></i>
              <h4><%=rec_food_fat_title %></h4>
              <p><%=rec_food_fat_comment %></p>
              <p><img width="100%" height="100%" src="/health/imgs/<%=rec_food_fat_uid%>.JPG"></p>
            </div>
            </a>
          </div>
          
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-runner-alt-1"></i>
              <h4><a href="#"><%=rec_exercise_muscle_title %></a></h4>
              <p><%=rec_exercise_muscle_comment %></p>
              <p><iframe width="100%" height="100%" src="<%=rec_exercise_muscle_link %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
            </div>
          </div>
          
          <div class="col-md-6 mt-4 mt-md-0">
          <a href="health_food_info.jsp?url=<%=rec_food_muscle_link %>">
            <div class="icon-box">
              <i class="icofont-culinary"></i>
              <h4><%=rec_food_muscle_title %></h4>
              <p><%=rec_food_muscle_comment %></p>
              <p><img width="100%" height="100%" src="/health/imgs/<%=rec_food_muscle_uid%>.JPG"></p>
            </div>
            </a>
          </div>
          
          <%
          if(water == 0)
          {
        	 %>
        	  <div class="col-md-6 mt-4 mt-md-0">
          <a href="health_food_info.jsp?url=<%=rec_food_water_link %>">
            <div class="icon-box">
              <i class="icofont-culinary"></i>
              <h4><%=rec_food_water_title %></h4>
              <p><%=rec_food_water_comment %></p>
              <p><img width="100%" height="100%" src="/health/imgs/water.JPG"></p>
            </div>
            </a>
          </div>
        	 <%
          }
          %>
          
          <%
          if(center_muscle == 0)
          {
        	 %>
        	  <div class="col-md-6 mt-4 mt-md-0">
            	<div class="icon-box">
              	<i class="icofont-runner-alt-1"></i>
              	<h4><a href="#"><%=rec_exercise_abs_title %></a></h4>
              	<p><%=rec_exercise_abs_comment %></p>
              	<p><iframe width="100%" height="100%" src="<%=rec_exercise_abs_link %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
            	</div>
          	</div>
        	 <%
          }
          %>
          
          <%
          if(rightarm_muscle == 0 || leftarm_muscle == 0)
          {
        	 %>
        	  <div class="col-md-6 mt-4 mt-md-0">
            	<div class="icon-box">
              	<i class="icofont-runner-alt-1"></i>
              	<h4><a href="#"><%=rec_exercise_upperbody_title %></a></h4>
              	<p><%=rec_exercise_upperbody_comment %></p>
              	<p><iframe width="100%" height="100%" src="<%=rec_exercise_upperbody_link %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
            	</div>
          	</div>
        	 <%
          }
          %>
          
          <%
          if(rightleg_muscle == 0 || leftleg_muscle == 0)
          {
        	 %>
        	  <div class="col-md-6 mt-4 mt-md-0">
            	<div class="icon-box">
              	<i class="icofont-runner-alt-1"></i>
              	<h4><a href="#"><%=rec_exercise_leg_title %></a></h4>
              	<p><%=rec_exercise_leg_comment %></p>
              	<p><iframe width="100%" height="100%" src="<%=rec_exercise_leg_link %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
            	</div>
          	</div>
        	 <%
          }
          %>
          
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