package com.offerbazaar.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdvertiserLoginServlet
 */
public class AdvertiserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdvertiserLoginServlet() {
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

		String aemail = request.getParameter("email");
		String apass = request.getParameter("password");

		try {
			Connection con = DbConnection.connect();

			PreparedStatement pstmt = con
					.prepareStatement("SELECT * FROM advertiser WHERE aemail=? AND apass=? AND aapproved='1'");
			pstmt.setString(1, aemail);
			pstmt.setString(2, apass);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				
				int aid = rs.getInt("aid");
				GetSet.setAid(aid);
				
				String abiz = rs.getString("abiz");
				GetSet.setAdvertiserBizName(abiz);
				
				response.sendRedirect("advertiserDashboard.jsp");
				
				GetSet.setAid(rs.getInt("aid"));
				GetSet.setAdvertiserName(rs.getString("aname"));
				GetSet.setAdvertiserBizName(rs.getString("abiz"));

			} else {
				System.out.println("Advertiser login failed");
				response.sendRedirect("error.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

		doGet(request, response);
	}

}
