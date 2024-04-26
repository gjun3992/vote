<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPKG.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2>후보자 등수</h2>
<table class="table">
	<tr  class="table-light">
		<th>후보번호</th>
		<th>성명</th>
		<th>소속정당</th>
		<th>학력</th>
		<th>주민번호</th>
		<th>지역구</th>
		<th>대표전화</th>
	</tr>
<%
Connection conn=null;
Statement stmt=null;


try{
	conn =SQLException.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT mem.*,par.p_tel_1,par.p_tel_2,par.p_tel_3 "+
			"FROM TBL_MEMBER_20240304 mem ,tbl_party_20240304 par "+
			"WHERE mem.P_CODE = par.P_CODE ";
	ResultSet rs= stmt.executeQuery(sql);	
	
	
	while(rs.next()){
		
	String tel_1= rs.getString("p_tel_1");
	String tel_2= rs.getString("p_tel_2");
	String tel_3= rs.getString("p_tel_3");
	
	String tel=tel_1 + "-" + tel_2 + "-" + tel_3 ;
	
	String J_num=rs.getString("M_JUMIN");
	String J_num_1 =J_num.substring(0,6);
	String J_num_2 =J_num.substring(7);
		
	String total_J_num = J_num_1 +"-" + J_num_2;
	
	String school =rs.getString("P_SCHOOL");
	
	
	if (school.equals("1")){
		school= "고졸";
	} 
	else if (school.equals("2")){
		school= "석사";
	}
	else{
		school= "박사";
		
	}
%>
	<tr>
		<td><%= rs.getString("M_NO") %></td>
		<td><%= rs.getString("M_NAME") %></td>
		<td><%= rs.getString("P_CODE") %></td>
		<td><%= school %></td>
		<td><%= total_J_num %></td>
		<td><%= rs.getString("M_CITY") %></td>
		<td><%= tel %></td>
	</tr>





<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>

</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>