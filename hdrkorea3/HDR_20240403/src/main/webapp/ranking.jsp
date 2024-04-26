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
		<th>총투표건수</th>
	</tr>
<%
Connection conn=null;
Statement stmt=null;


try{
	conn =SQLException.getConnection();
	stmt=conn.createStatement();
	String sql ="SELECT mem.M_NO, mem.M_NAME, count(vote.m_no) as total_m_no "+
			"FROM TBL_VOTE_20240304 vote, TBL_MEMBER_20240304 mem  "+
			"WHERE mem.M_NO = vote.M_NO and vote.v_confirm != 'N' "+
			"GROUP BY mem.M_NO, mem.M_NAME "+
			"ORDER BY total_m_no desc";
	ResultSet rs= stmt.executeQuery(sql);	
	
	while(rs.next()){
		
		
%>
	<tr>
		<td><%= rs.getString("M_NO") %></td>
		<td><%= rs.getString("M_NAME") %></td>
		<td><%= rs.getString("total_m_no") %></td>
	</tr>





<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>


</table>
</section>
]<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>