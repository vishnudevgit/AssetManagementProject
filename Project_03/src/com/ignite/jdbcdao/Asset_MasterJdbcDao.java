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
import java.util.List;


import com.ignite.beans.Asset_Master;
import com.ignite.beans.Asset_det;
import com.ignite.beans.Vendor_Det;
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
		pstmt.setString(7, am.getAm_warranty());
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
		// TODO Auto-generated method stub
		return null;
	}


	

	@Override
	public Asset_Master find(int am_id) throws SQLException, FileNotFoundException, ClassNotFoundException, IOException {
		Asset_Master asset_master = null;
		Connection con=null;
		Statement stmt = null;
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		ResultSet rs = null;
		ResultSet rs1 = null;
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
				asset_master.setAm_model(rs.getString("ad_model"));
				asset_master.setAm_snumber(rs.getString("am_snumber"));
				asset_master.setAm_myear(rs.getString("am_myear"));
				String str1=df.format("am_pdate");
				String str2=df.format("am_from");
				String str3=df.format("am_to");
				asset_master.setAm_pdate(rs.getString(str1));
				asset_master.setAm_from(rs.getString(str2));
				asset_master.setAm_to(rs.getString(str3));
				asset_master.setAm_warranty("am_warranty");
					
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

}


