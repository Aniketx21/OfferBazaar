package com.offerbazaar.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminApproveAdvertiserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminApproveAdvertiserServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String aid = request.getParameter("aid");

		try {
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("UPDATE advertiser SET aapproved = 1 WHERE aid = ?");
			pstmt.setInt(1, Integer.parseInt(aid));
			int i = pstmt.executeUpdate();

			if (i > 0) {
				System.out.println("Advertiser approved successfully");
			} else {
				System.out.println("Approval failed");
			}

			response.sendRedirect("adminApproveAdvertisers.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
