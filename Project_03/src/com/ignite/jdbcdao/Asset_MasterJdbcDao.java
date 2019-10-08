package com.ignite.jdbcdao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;


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
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO Asset_Master(am_type,am_make,am_model,am_snumber,am_myear,am_pdate,am_warranty,am_from,am_to) VALUES(?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, am.getAm_type());
		pstmt.setString(2, am.getAm_make());
		pstmt.setString(3, am.getAm_model());
		pstmt.setString(4, am.getAm_snumber());
		pstmt.setString(5, am.getAm_myear());
		pstmt.setDate(6, (Date) am.getAm_pdate());
		pstmt.setString(7, am.getAm_warranty());
		pstmt.setDate(8, (Date) am.getAm_from());
		pstmt.setDate(9, (Date) am.getAm_to());
		if(1==pstmt.executeUpdate()){
			res = true;
		}
		return res;
	}

	@Override
	public boolean delete(Asset_Master  am) throws SQLException {
		boolean res = false;
		PreparedStatement pstmt = con.prepareStatement("UPDATE Asset_Master SET isactive='N', WHERE id=?");
		pstmt.setInt(3,am.getAm_id());
		if(1==pstmt.executeUpdate()){
			res = true;
		}
		return res;
	}

	@Override
	public Asset_Master find(int am_id) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Asset_Master> findAll()
			throws FileNotFoundException, ClassNotFoundException, IOException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Asset_Master am) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}


