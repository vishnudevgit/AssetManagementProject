package com.ignite.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ignite.jdbcdao.Asset_MasterJdbcDao;
import com.ignite.jdbcdao.Asset_detJdbcDao;

/**
 * Servlet implementation class DeleteMasterServlet
 */
@WebServlet("/deletemaster")
public class DeleteMasterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMasterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("username")!=null){
			int am_id = Integer.parseInt(request.getParameter("am_id"));
			try {
				Asset_MasterJdbcDao masterDao = new Asset_MasterJdbcDao();
				if(masterDao.delete(am_id)){
					masterDao.save();
				}
				else{
					masterDao.undo();
				}
				RequestDispatcher rd = request.getRequestDispatcher("Homepage.jsp");
				rd.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				// Properly log this exception
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				// Properly log this exception
				e.printStackTrace();
			}
		}
		else{
			response.sendRedirect("Login.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
