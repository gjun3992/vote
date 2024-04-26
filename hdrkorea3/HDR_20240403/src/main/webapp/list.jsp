<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		<th>성명</th>
		<th>생년월일</th>
		<th>나이</th>
		<th>성별</th>
		<th>후보번호</th>
		<th>투표시간</th>
		<th>유권자 확인</th>
	</tr>
<%
Connection conn=null;
Statement stmt=null;

try{
	conn =SQLException.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT * FROM TBL_VOTE_20240304";
	ResultSet rs= stmt.executeQuery(sql);
	

	while(rs.next()){
		String datestr =rs.getString(1);
		String confirm = rs.getString("V_CONFIRM");
		String year =datestr.substring(0,2);
		String month_str =datestr.substring(2,4);
		String day_str =datestr.substring(4,6);

		String gender =datestr.substring(6,7);

		
		String birth=year+"년 "+ month_str+"월 "+ day_str+"일생";
		
		
		Date today = new Date();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String n_year_str = dateFormat.format(today);
		String n_year =n_year_str.substring(0,4);
		String n_month_str =n_year_str.substring(0,4);
		String n_day_str =n_year_str.substring(0,4);
		
		int now_year=Integer.parseInt(n_year);
		int b_year=Integer.parseInt(year)+1900;
		
		
		int day=Integer.parseInt(day_str);
		int n_day=Integer.parseInt(n_day_str);
		int month=Integer.parseInt(month_str);
		int n_month=Integer.parseInt(n_month_str);
	
		String V_TIME_ =rs.getString("V_TIME");
		String V_TIME1 =V_TIME_.substring(0,2);
		String V_TIME2 =V_TIME_.substring(2,4);
		
		String V_TIME = V_TIME1+":" +V_TIME2;
		
		int int_age=now_year-b_year;
		if(month > n_month &&  day > n_day ){
			int_age--;
		}
		
		
		String age="만 "+int_age+"세";
		
		if (confirm.equals("N")){
			confirm= "미확인";
		}else{
			confirm= "확인";
		}
		if (gender.equals("1")){
			gender= "남";
		}else{
			gender= "여";
		}
		
		

%>
	<tr>
		<td><%= rs.getString("V_NAME") %></td>
		<td>19<%= birth %></td>
		<td><%= age %></td>
		<td><%= gender %></td>
		<td><%= rs.getString("M_NO") %></td>
		<td><%= V_TIME %></td>
		<td><%= confirm %></td>

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