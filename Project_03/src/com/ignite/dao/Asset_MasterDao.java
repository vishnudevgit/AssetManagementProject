package com.ignite.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.ignite.beans.Asset_Master;

public interface Asset_MasterDao {
	boolean insert(Asset_Master am) throws SQLException;
    boolean update(Asset_Master am) throws SQLException;
    boolean delete(Asset_Master am) throws SQLException;
    
    Asset_Master find(int am_id) throws FileNotFoundException, ClassNotFoundException, IOException, SQLException;
    List<Asset_Master> findAll() throws FileNotFoundException, ClassNotFoundException, IOException, SQLException;
}
