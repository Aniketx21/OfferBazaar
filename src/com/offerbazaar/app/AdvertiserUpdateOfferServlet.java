package com.offerbazaar.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdvertiserUpdateOfferServlet
 */
public class AdvertiserUpdateOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdvertiserUpdateOfferServlet() {
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
		// TODO Auto-generated method stub
		

        try {
            // Read form parameters
            int ofid = Integer.parseInt(request.getParameter("ofid"));
            String title = request.getParameter("oftitle");
            String desc = request.getParameter("ofdesc");
            int discount = Integer.parseInt(request.getParameter("ofdiscount"));
            String city = request.getParameter("ofcity");
            String startDate = request.getParameter("ofstart");
            String endDate = request.getParameter("ofend");
            
            Connection con = DbConnection.connect();
            String sql = "UPDATE offers SET oftitle=?, ofdesc=?, ofdiscount=?, ofcity=?, ofstart=?, ofend=? WHERE ofid=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setInt(3, discount);
            ps.setString(4, city);
            ps.setString(5, startDate);
            ps.setString(6, endDate);
            ps.setInt(7, ofid);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {
                // Redirect back to view page with success
                response.sendRedirect("advertiserViewOffers.jsp");
            } else {
                response.getWriter().println("Failed to update the offer.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        }

		doGet(request, response);
	}

}
