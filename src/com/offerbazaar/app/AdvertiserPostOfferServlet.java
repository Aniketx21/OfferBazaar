package com.offerbazaar.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdvertiserPostOfferServlet
 */
public class AdvertiserPostOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdvertiserPostOfferServlet() {
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
		int ofid = 0;
		String oftitle = request.getParameter("oftitle");
	    String ofdesc = request.getParameter("ofdesc");
	    String ofdiscount = request.getParameter("ofdiscount");
	    String ofcity = request.getParameter("ofcity");
	    String ofstart = request.getParameter("ofstart");
	    String ofend = request.getParameter("ofend");
	 
	    int aid = GetSet.getAid();
	    String abiz = GetSet.getAdvertiserBizName();

	   

	    try {
	        Connection con = DbConnection.connect();
	        PreparedStatement pstmt = con.prepareStatement( "INSERT INTO offers VALUES (?, ?, ?, ?, ?, ?, ?,?,?)");
	        pstmt.setInt(1, ofid);
	        System.out.println("ofid"+ofid);
	        pstmt.setString(2, oftitle);
	        pstmt.setString(3, ofdesc);
	        pstmt.setString(4, ofdiscount);
	        pstmt.setString(5, ofcity);
	        pstmt.setString(6, ofstart);
	        pstmt.setString(7, ofend);
	        pstmt.setInt(8, aid);
	        pstmt.setString(9, abiz);

	        int i = pstmt.executeUpdate();

	        if (i > 0) {
	            System.out.println("Offer posted successfully");
	            response.sendRedirect("advertiserDashboard.jsp");
	        } else {
	            System.out.println("Offer posting failed");
	            response.sendRedirect("error.jsp");
	        }

	        pstmt.close();
	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("error.jsp");
	    }
		
		doGet(request, response);
	}

}
