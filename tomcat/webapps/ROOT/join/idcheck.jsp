<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script>
	
</script>
<body>
<%
request.setCharacterEncoding("utf-8");
String f_id = (String)request.getParameter("id");

Connection conn = null;
PreparedStatement pstmt = null;
String str = "";
ResultSet rs = null;
int check = -1;
try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/yhpj";
	String dbId = "yhpj";
	String dbPass = "Yuhan2020!";
	
	Class.forName ("com.mysql.jdbc.Driver"); //driver load
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	String sql = "select user_id from user where user_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, f_id);
	rs = pstmt.executeQuery();
 	
 	if(rs.next())
 	{
 		check = 1;
 	}
 	else
 	{
 		check = 0;
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

if(check == 1)
{
%>
	<center>
		<b><font color="red"><%=f_id %></font>는 <br/> 이미 사용중인 아이디 입니다.</b>
		<input type="button" value="닫기" onclick="reid()">
	</center>
<%
}
else
{
%>
	<center>
		<b>입력하신 <font color="red"><%=f_id%></font>는 <br/> 사용하실 수 있는 ID입니다.</b>
		<input type="button" value="닫기" onclick="setid()">
	</center>

<%
}
%>
<script language="javascript">
function reid()
{
	opener.document.joinform.id.value="";
	opener.document.joinform.join_name.value="다른 아이디를 입력해주세요.";
	window.self.close();
}
	function setid()
	{
		opener.document.joinform.id.value="<%=f_id%>";
		opener.document.joinform.join_name.value="사용가능한 아이디 입니다.";
		window.self.close();
	}
</script>

</body>
</html>