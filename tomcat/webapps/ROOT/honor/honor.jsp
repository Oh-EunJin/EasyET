<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>	
    <!DOCTYPE html>
<html lang="utf-8">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Honor Page</title>
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
        <i class="icofont-envelope"></i><a href="mailto:chk4814@naver.com ">chk4814@naver.com</a>
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
  	<br>

<%
  	if(session.getAttribute("ss") == null)
      {
      	%>
    	 	<div class="container contact">
  				<div class="row content">
  					<div class="col-lg-6">
  						<h2>로그인 안내</h2>
  						<h4>명예의 전당을 이용하려면 로그인이 필요합니다.<br><a href="/login/login_form.jsp">로그인하러 가기</a></h4>
  					</div>
  				</div>
  			</div>
    	<%
      }
      else
      {
  		%>
      
	  <section id="services" class="services section-bg">
      <div class="container">

        <div class="section-title">
          <span>Honor</span>
          <h2>Honor</h2>
          <p>이번 달 명예의 전당</p>
        </div>
        <div class="row">
		<div class="col-md-12">
            <div class="icon-box">
              <i class="icofont-measure"></i>
              <h4><a href="#">체중 감량 순</a></h4> <br>
              	<table class="table table-hover table-striped">
              			<tr>
              				<td style="width: 1%"> </td>
							<td>등수 </td>
			        		<td>아이디</td>
			        		<td>감량한 체중</td>
			        		<td>증가한 골격근량</td>
			        	</tr>
              	<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			String str = "";
			ResultSet rs = null;
			
			String name = null;
			float Max_weight = 0;
			float Min_weight = 0;
			float Max_skeletal_muscle_mass = 0;
			float Min_skeletal_muscle_mass = 0;
			String check_date;
			int rank = 0;
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
				String dbId = "yhpj";
				String dbPass = "Yuhan2020!";
				
				Class.forName ("com.mysql.jdbc.Driver"); //driver load
				conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
				
				String sql = "SELECT name, Max(weight), Min(weight), Max(skeletal_muscle_mass), Min(skeletal_muscle_mass), check_date FROM inbody " + 
							 "WHERE month(now()) = month(check_date) group by name  order by Max(weight)-Min(weight) DESC";
				
				/* String sql = "SELECT name, Max(weight), Min(weight), Max(skeletal_muscle_mass), Min(skeletal_muscle_mass), check_date, "+
						"(SELECT COUNT(*)+1 FROM inbody group by name having Max(weight)-Min(weight) > Max(i.weight)-Min(i.weight)) "+
						"FROM inbody i group by name having month(now()) = month(check_date) order by Max(weight)-Min(weight) desc "; */
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next())
			 	{
			 		name = rs.getString(1);
					Max_weight = rs.getFloat(2);
					Min_weight = rs.getFloat(3);
					Max_skeletal_muscle_mass = rs.getFloat(4);
					Min_skeletal_muscle_mass = rs.getFloat(5);
					check_date = rs.getString(6);
					
			%>
						
			        	<%-- <% for(i=1; i<6; i++) {   
			        		if(name != null) {%> --%>
			        	<tr>
			        	<%  if(rank == 0) { rank++; %>
		        			<td class="icofont-crown"> </td>
		        			<td> <%=rank %>등 </td>
			        	<%	
			        	    }
			        		else if(rank >= 1 && rank < 5) { rank++; %>
			        		<td> </td>
			        		<td><%=rank %>등</td>
			        	<%
			        		}
			        		else if(rank == 5){
			        		  break;
			        	    }
			        	%>
							<%-- <td><%=rank %>등</td> --%>
			        		<td><%=name %></td>
			        		<td><%=Max_weight - Min_weight %>kg</td>
			        		<td><%=Max_skeletal_muscle_mass - Min_skeletal_muscle_mass %>kg</td>
			        	</tr>
			<%  				 
							/*  }else break;
							} */
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
		
		</div></table><br>
		            </div>
		            
	        <br>
	        <div class="col-md-13">
            <div class="icon-box">
              <i class="icofont-muscle-weight"></i>
              <h4><a href="#">골격근량 증가 순</a></h4> <br>
              	<table class="table table-hover table-striped">
              			<tr>
              				<td style="width: 1%"> </td>
							<td>등수 </td>
			        		<td>아이디</td>
			        		<td>증가한 골격근량</td>
			        		<td>감량한 체중</td>
			        	</tr>
              	<%
			Connection conn2 = null;
			PreparedStatement pstmt2 = null;
			String str2 = "";
			ResultSet rs2 = null;
			
			String name2 = null;
			float Max_weight2 = 0;
			float Min_weight2 = 0;
			float Max_skeletal_muscle_mass2 = 0;
			float Min_skeletal_muscle_mass2 = 0;
			String check_date2;
			int rank2 = 0;
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
				String dbId = "yhpj";
				String dbPass = "Yuhan2020!";
				
				Class.forName ("com.mysql.jdbc.Driver"); //driver load
				conn2 = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
				
				String sql2 = "SELECT name, Max(weight), Min(weight), Max(skeletal_muscle_mass), Min(skeletal_muscle_mass), check_date FROM inbody " +
						      "WHERE month(now()) = month(check_date) GROUP by name order by Max(skeletal_muscle_mass)-Min(skeletal_muscle_mass) desc";
				
				pstmt2 = conn2.prepareStatement(sql2);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next())
			 	{
			 		name2 = rs2.getString(1);
					Max_weight2 = rs2.getFloat(2);
					Min_weight2 = rs2.getFloat(3);
					Max_skeletal_muscle_mass2 = rs2.getFloat(4);
					Min_skeletal_muscle_mass2 = rs2.getFloat(5);
					check_date2 = rs2.getString(6);
					
			%>
									        	
			        	<tr>
							<%  if(rank2 == 0) { rank2++; %>
		        			<td class="icofont-crown"> </td>
		        			<td> <%=rank2 %>등 </td>
			        	<%	
			        	    }
			        		else if(rank2 >= 1 && rank2 < 5) { rank2++; %>
			        		<td> </td>
			        		<td><%=rank2 %>등</td>
			        	<%
			        		}
			        		else if(rank == 5){
				        		  break;
			        	    }
			        	%>
			        		<td><%=name2 %></td>
			        		<td><%=Max_skeletal_muscle_mass2 - Min_skeletal_muscle_mass2 %>kg</td>
			        		<td><%=Max_weight2 - Min_weight2 %>kg</td>
			        	</tr>
			<%  				 
							
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
		
		</div>
	        	
			        </table><br>
			        
			        </form>
		        
	<%
		} 
%>
            </div>
          </div>
        
          <%-- <div class="col-md-12">
            <div class="icon-box">
              <i class="icofont-crown-king"></i>
              <h4><a href="#">Lorem Ipsum</a></h4>
              <p>Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-crown-queen"></i>
              <h4><a href="#">Sed ut perspiciatis</a></h4>
              <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-crown"></i>
              <h4><a href="#">Magni Dolore</a></h4>
              <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque</p>
            </div>
          </div>
          
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-settings"></i>
              <h4><a href="#">Nemo Enim</a></h4>
              <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
          </div>
          <div class="col-md-6 mt-4 mt-md-0">
            <div class="icon-box">
              <i class="icofont-tasks-alt"></i>
              <h4><a href="#">Eiusmod Tempor</a></h4>
              <p>Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi</p>
            </div>
          </div>
        </div>

      </div>
    </section>
          
	        <table class="table table-hover table-striped">
			<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			String str = "";
			ResultSet rs = null;
			
			String name = null;
			float Max_weight = 0;
			float Min_weight = 0;
			float Max_skeletal_muscle_mass = 0;
			float Min_skeletal_muscle_mass = 0;
			String check_date;
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
				String dbId = "yhpj";
				String dbPass = "Yuhan2020!";
				
				Class.forName ("com.mysql.jdbc.Driver"); //driver load
				conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
				
				String sql = "SELECT name, Max(weight), Min(weight), Max(skeletal_muscle_mass), Min(skeletal_muscle_mass), check_date "+
						"FROM inbody group by name having month(now()) = month(check_date)";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next())
			 	{
			 		name = rs.getString(1);
					Max_weight = rs.getFloat(2);
					Min_weight = rs.getFloat(3);
					Max_skeletal_muscle_mass = rs.getFloat(4);
					Min_skeletal_muscle_mass = rs.getFloat(5);
					check_date = rs.getString(6);
					
			%>
						<tr>
			        		<td>아이디<br><%=name %></td>
			        		<td>감량한 체중<br><%=Max_weight - Min_weight %>kg</td>
			        		<td>증가한 골격근량<br><%=Max_skeletal_muscle_mass - Min_skeletal_muscle_mass %>kg</td>
			        	</tr>
			<%
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
		
		</div>
	        	
			        </table><br>
			        
			        </form>
		        
	<%
		} 
%> --%>
  	
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