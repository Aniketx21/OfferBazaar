package com.offerbazaar.app;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.offerbazaar.app.DbConnection;
//import com.offerbazaar.app.*;

/**
 * Servlet implementation class UserLoginServlet
 */
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String uemail = request.getParameter("email");
		String upassword = request.getParameter("password");

		try {
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM users WHERE uemail=? AND upassword=?");
			pstmt.setString(1, uemail);
			pstmt.setString(2, upassword);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("userEmail", uemail);
				session.setAttribute("userName", rs.getString("uname"));
				GetSet.setAid(0);
				GetSet.setUid(rs.getInt("uid"));
				GetSet.setUserName(rs.getString("uname"));
				response.sendRedirect("userDashboard.jsp");
			} else {
				System.out.println("Login failed – wrong email or password");
				response.sendRedirect("error.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

		doGet(request, response);
	}

}
