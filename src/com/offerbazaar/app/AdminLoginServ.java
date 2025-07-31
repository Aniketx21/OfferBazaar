package com.offerbazaar.app;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLoginServ
 */
public class AdminLoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServ() {
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
		

        String email = request.getParameter("email");
        System.out.println("email"+email);
        String password = request.getParameter("password");
        System.out.println("pass"+password);

        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            // Login successful
            System.out.println("Admin Login Successful");
            response.sendRedirect("adminDashboard.jsp");
        } else {
            // Login failed
            System.out.println("Admin Login Failed: Invalid credentials");
            response.sendRedirect("error.jsp");
        }
		
		doGet(request, response);
	}

}
