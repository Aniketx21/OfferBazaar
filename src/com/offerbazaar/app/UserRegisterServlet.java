package com.offerbazaar.app;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offerbazaar.app.DbConnection;
//import com.offerbazaar.app.*;

/**
 * Servlet implementation class UserRegisterServlet
 */
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegisterServlet() {
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

		Connection con = DbConnection.connect();
		String uname = request.getParameter("uname");
		String ucontact = request.getParameter("ucontact");
		String uaddress = request.getParameter("uaddress");
		String uemail = request.getParameter("uemail");
		String upassword = request.getParameter("upassword");
		int uid = 0;
		try {
			PreparedStatement pstmt = con.prepareStatement("insert into users value (?,?,?,?,?,?)");
			pstmt.setInt(1, uid);
			pstmt.setString(2, uname);
			pstmt.setString(3, ucontact);
			pstmt.setString(4, uaddress);
			pstmt.setString(5, uemail);
			pstmt.setString(6, upassword);

			int i = pstmt.executeUpdate();

			if (i > 0) {
				System.out.println("Registration success – redirect to login or success page");
				response.sendRedirect("login.jsp");
			} else {
				System.out.println("Error – redirect to error page");
				response.sendRedirect("error.jsp");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

		doGet(request, response);
	}

}
