package com.ignite.jdbcdao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Dao {
	
	Connection con = null;
	
	public Dao()throws FileNotFoundException, IOException, ClassNotFoundException, SQLException{
		con = getConnection();
	}
	
	public Connection getConnection() throws FileNotFoundException, IOException, ClassNotFoundException, SQLException{
		
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/faith";
		String username = "root";
		String password = null ;
		Class.forName(driver);
		con = DriverManager.getConnection(url, username, password);
		con.setAutoCommit(false);
		return con;
	}
	
	public void save() throws SQLException{
		// commit
		try{
			con.commit();
		}
		finally{
			con.close();
		}
	}
	
	public void undo() throws SQLException{
		// rollback
		try{
			con.rollback();
		}
		finally{
			con.close();
		}
	}
}
