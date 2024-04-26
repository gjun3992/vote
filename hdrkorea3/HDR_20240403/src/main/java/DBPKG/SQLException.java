package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class SQLException {

	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con =DriverManager.getConnection
				("jdbc:oracle:thin:@//localhost:1521/xe","musthave","1234");
		System.out.println(" DB연결 성공");
		
		return con;
	}
}
