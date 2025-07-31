package com.offerbazaar.app;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminToggleApprovalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminToggleApprovalServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// Get parameters from request
			int aid = Integer.parseInt(request.getParameter("aid"));
			int newStatus = Integer.parseInt(request.getParameter("status")); // 0
																				// or
																				// 1

			// Update advertiser approval status in DB
			Connection con = DbConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("UPDATE advertiser SET aapproved = ? WHERE aid = ?");
			pstmt.setInt(1, newStatus);
			pstmt.setInt(2, aid);
			int updated = pstmt.executeUpdate();

			pstmt.close();
			con.close();

			// Redirect after update
			if (updated > 0) {
				System.out.println("Advertiser approval status updated.");
			} else {
				System.out.println("No advertiser found with given ID.");
			}

			response.sendRedirect("adminViewAdvertiser.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response); // Use same logic for POST if ever needed
	}
}
