<%@page import="java.sql.PreparedStatement"%>
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
<%
Connection conn=null;
PreparedStatement pstmt=null;

String M_JUMIN= request.getParameter("M_JUMIN");
String M_NAME= request.getParameter("M_NAME");
String M_NO= request.getParameter("M_NO");
String V_TIME= request.getParameter("V_TIME");
String V_AREA= request.getParameter("V_AREA");
String V_CONFIRM= request.getParameter("V_CONFIRM");



try{
	conn =SQLException.getConnection();

	String sql = "INSERT INTO tbl_vote_20240304 VALUES (?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
 	pstmt.setString(1, M_JUMIN);
 	pstmt.setString(2, M_NAME);
 	pstmt.setString(3, M_NO);
 	pstmt.setString(4, V_TIME);
 	pstmt.setString(5, V_AREA);
 	pstmt.setString(6, V_CONFIRM);
	
 	int rowsAffected = pstmt.executeUpdate();
	response.sendRedirect("index.jsp");
}catch(Exception e){
	e.printStackTrace();
}
%>



</section>
]<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>