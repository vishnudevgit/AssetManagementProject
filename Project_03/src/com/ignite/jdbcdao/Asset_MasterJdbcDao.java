package com.ignite.jdbcdao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;


import com.ignite.beans.Asset_Master;
import com.ignite.dao.Asset_MasterDao;

public class Asset_MasterJdbcDao extends Dao implements Asset_MasterDao {

	public Asset_MasterJdbcDao() throws FileNotFoundException, IOException, ClassNotFoundException, SQLException {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean insert(Asset_Master am) throws SQLException {
		
		boolean res = false;
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO Asset_Master(am_type,am_make,am_model,am_snumber,am_myear,am_pdate,am_warranty,am_from,am_to,isactive) VALUES(?,?,?,?,?,?,?,?,?,'Y')");
		pstmt.setString(1, am.getAm_type());
		pstmt.setString(2, am.getAm_make());
		pstmt.setString(3, am.getAm_model());
		pstmt.setString(4, am.getAm_snumber());    
		pstmt.setString(5, am.getAm_myear());
		pstmt.setDate(6, Date.valueOf(am.getAm_pdate()));
		pstmt.setInt(7, am.getAm_warranty());
		pstmt.setDate(8, Date.valueOf (am.getAm_from()));
		pstmt.setDate(9, Date.valueOf(am.getAm_to()));
		if(1==pstmt.executeUpdate()){     
			res = true;
		}
		return res;
	}

	

	@Override
	public boolean delete(int am_id) throws SQLException {
		boolean res= false;
		PreparedStatement pstmt = con.prepareStatement("UPDATE asset_master SET isactive ='N' WHERE am_id=?");
		pstmt.setInt(1,am_id);
		if(1==pstmt.executeUpdate()){
			res = true;
		}
		return res;
	}

	@Override
	public List<Asset_Master> findAll()
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		ArrayList<Asset_Master> Asset_Masters = new ArrayList<>() ;
		
		Connection con=null;
		Statement stmt = null;
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		ResultSet rs = null;
		
		try{
			con = getConnection();
			con.commit();
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM asset_master WHERE isactive='Y'");
			while(rs.next()){
				Asset_Master asset_master = new Asset_Master();
				asset_master = new Asset_Master();
				asset_master.setAm_id(rs.getInt("am_id"));
				asset_master.setAm_type(rs.getString("am_type"));
				asset_master.setAm_make(rs.getString("am_make"));
				asset_master.setAm_model(rs.getString("am_model"));
				asset_master.setAm_snumber(rs.getString("am_snumber"));
				asset_master.setAm_myear(rs.getString("am_myear"));
				
				
				java.util.Date ampdate = rs.getTimestamp("am_pdate");
				
				java.util.Date amfrom = rs.getTimestamp("am_from");
				
				java.util.Date amto = rs.getTimestamp("am_to");
				
				asset_master.setAm_pdate(df.format(ampdate));
				asset_master.setAm_from(df.format(amfrom));
				asset_master.setAm_to(df.format(amto));
				
				asset_master.setAm_warranty(rs.getInt("am_warranty"));
				Asset_Masters.add(asset_master);
					
				}
			}
		catch(IllegalArgumentException e){
			e.printStackTrace();
		}
		finally{
			try{
				rs.close();
			}
			catch(SQLException e){
				throw e;
			}
			try{
				stmt.close();
			}
			catch(SQLException e){
				throw e;
			}
			try{
				con.close();
			}
			catch(SQLException e){
				throw e;
			}
		}
		return Asset_Masters;
	}


	

	@Override
	public Asset_Master find(int am_id) throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		Asset_Master asset_master = null;
		Connection con=null;
		Statement stmt = null;
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		ResultSet rs = null;
		
		try{
			con = getConnection();
			con.commit();
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT * FROM asset_master WHERE am_id = "+am_id);
			if(rs.next()){
				asset_master = new Asset_Master();
				asset_master.setAm_id(rs.getInt("am_id"));
				asset_master.setAm_type(rs.getString("am_type"));
				asset_master.setAm_make(rs.getString("am_make"));
				asset_master.setAm_model(rs.getString("am_model"));
				asset_master.setAm_snumber(rs.getString("am_snumber"));
				asset_master.setAm_myear(rs.getString("am_myear"));
				
				
				java.util.Date ampdate = rs.getTimestamp("am_pdate");
				
				java.util.Date amfrom = rs.getTimestamp("am_from");
				
				java.util.Date amto = rs.getTimestamp("am_to");
				
				asset_master.setAm_pdate(df.format(ampdate));
				asset_master.setAm_from(df.format(amfrom));
				asset_master.setAm_to(df.format(amto));
				
				asset_master.setAm_warranty(rs.getInt("am_warranty"));
					
			}
		}
		finally{
			try{
				rs.close();
			}
			catch(SQLException e){
				throw e;
			}
			try{
				stmt.close();
			}
			catch(SQLException e){
				throw e;
			}
			try{
				con.close();
			}
			catch(SQLException e){
				throw e;
			}
		}
		return asset_master;
		
		
	}

	@Override
	public boolean update(Asset_Master am) throws SQLException {
		boolean res = false;
		PreparedStatement pstmt = con.prepareStatement("UPDATE Asset_Master SET am_type=?,am_make=?,am_model=?,am_snumber=?,am_myear=?,am_pdate=?,am_warranty=?,am_from=?,am_to=? WHERE am_id=?");
		pstmt.setString(1, am.getAm_type());
		pstmt.setString(2, am.getAm_make());
		pstmt.setString(3, am.getAm_model());
		pstmt.setString(4, am.getAm_snumber());    
		pstmt.setString(5, am.getAm_myear());
		pstmt.setDate(6, Date.valueOf(am.getAm_pdate()));
		pstmt.setInt(7, am.getAm_warranty());
		pstmt.setDate(8, Date.valueOf (am.getAm_from()));
		pstmt.setDate(9, Date.valueOf(am.getAm_to()));
		pstmt.setInt(10, am.getAm_id());
		if(1==pstmt.executeUpdate()){     
			res = true;
		}
		return res;	
	}

}


