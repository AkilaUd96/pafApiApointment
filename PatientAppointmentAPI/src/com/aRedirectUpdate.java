package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class aRedirectUpdate
 */
@WebServlet("/aRedirectUpdate")
public class aRedirectUpdate extends HttpServlet {
	
	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/healthcare", "root", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aRedirectUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.sendRedirect("adminHome.html");
		//System.out.println("test");
			String AID=request.getParameter("AID_form");
			String fName=request.getParameter("fName");
			String lName=request.getParameter("lName");
			String type=request.getParameter("type");
			String phone=request.getParameter("phone");
			String date=request.getParameter("date");
			String time=request.getParameter("time");
			String message=request.getParameter("message");
	
			String output="";
			try {
				Connection con = connect();
				if (con == null) {
					response.sendRedirect("appointmentdet.jsp");
				}
				// create a prepared statement
				String query = "UPDATE appointment SET fName=?,lName=?,type=?,phone=?,date=?,time=?,message=? WHERE AID=?";
				PreparedStatement preparedStmt = con.prepareStatement(query);
				// binding values
				
				preparedStmt.setString(1, fName);
				preparedStmt.setString(2, lName);
				preparedStmt.setString(3, type);
				preparedStmt.setInt(4, Integer.parseInt(phone));
				preparedStmt.setString(5, date);
				preparedStmt.setString(6, time);
				preparedStmt.setString(7, message);
				preparedStmt.setInt(8, Integer.parseInt(AID));

				// execute the statement
				preparedStmt.execute();
				con.close();
				output = "Updated successfully";
				System.out.println("Updated");
			} catch (Exception e) {
				output = "Error while updating the item.";
				System.err.println(e.getMessage());
				
			}
			response.sendRedirect("appointmentdet.jsp");
		
	}

}
