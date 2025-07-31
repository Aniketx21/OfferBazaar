package com.offerbazaar.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.offerbazaar.app.DbConnection;
//import com.offerbazaar.app.*;

/**
 * Servlet implementation class AdvertiserRegisterServlet
 */
public class AdvertiserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdvertiserRegisterServlet() {
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
		String aname = request.getParameter("aname");
		String abiz = request.getParameter("abiz");
		String acontact = request.getParameter("acontact");
		String acity = request.getParameter("acity");
		String aemail = request.getParameter("aemail");
		String apass = request.getParameter("apass");
		int aid = 0;

		try {

			PreparedStatement pstmt = con.prepareStatement("INSERT INTO advertiser VALUES (?, ?, ?, ?, ?, ?, ?,?)");
			pstmt.setInt(1, aid); // Assuming auto-increment ID
			pstmt.setString(2, aname);
			pstmt.setString(3, abiz);
			pstmt.setString(4, acontact);
			pstmt.setString(5, acity);
			pstmt.setString(6, aemail);
			pstmt.setString(7, apass);
			pstmt.setString(8, "no");

			int i = pstmt.executeUpdate();

			if (i > 0) {
				System.out.println("Advertiser registration successful");
				response.sendRedirect("adminLogin.jsp");
			} else {
				System.out.println("Advertiser registration failed");
				response.sendRedirect("error.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

		doGet(request, response);
	}

}
