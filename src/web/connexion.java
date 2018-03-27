package web;

import java.sql.DriverManager;


public class connexion {
	public static java.sql.Connection MySql() {
	java.sql.Connection conn = null;
  
    try {

    	String user = "root";
    	String password = "Douggy38";
        String DRIVER = "com.mysql.jdbc.Driver"; 
        String URL = "jdbc:mysql://localhost:3306/Carriere?verifyServerCertificate=false&useSSL=true";
        

        Class.forName(DRIVER).newInstance(); 
        conn = DriverManager.getConnection(URL,user, password);
    }
    catch (Exception e) {
        System.out.println(e);
    }
    return conn; 
	}
	
}
