
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
import com.offerbazaar.app.GetSet;

/**
 * Servlet implementation class ChangePasswordServlet
 */
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePasswordServlet() {
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

		String oldPass = request.getParameter("oldPassword");
		String newPass = request.getParameter("newPassword");
		String confirmPass = request.getParameter("confirmPassword");

		if (!newPass.equals(confirmPass)) {
			response.sendRedirect("changePassword.jsp?error=nomatch");
			return;
		}

		try {
			Connection con = DbConnection.connect();

			HttpSession session = request.getSession(false);
			if (session == null) {
				response.sendRedirect("login.jsp?error=sessionExpired");
				return;
			}

			// Try advertiser first
			int aid = GetSet.getAid();
			if (aid > 0) {
				// Advertiser password change
				PreparedStatement check = con.prepareStatement("SELECT * FROM advertiser WHERE aid=? AND apass=?");
				check.setInt(1, aid);
				check.setString(2, oldPass);
				ResultSet rs = check.executeQuery();

				if (rs.next()) {
					PreparedStatement update = con.prepareStatement("UPDATE advertiser SET apass=? WHERE aid=?");
					update.setString(1, newPass);
					update.setInt(2, aid);
					update.executeUpdate();
					response.sendRedirect("advertiserDashboard.jsp?success=passchanged");
				} else {
					response.sendRedirect("changePassword.jsp?error=wrongold");
				}
			} else {
				// User password change
				String email = (String) session.getAttribute("userEmail");
				if (email == null || email.trim().isEmpty()) {
					response.sendRedirect("login.jsp?error=sessionExpired");
					return;
				}

				PreparedStatement check = con.prepareStatement("SELECT * FROM users WHERE uemail=? AND upassword=?");
				check.setString(1, email);
				check.setString(2, oldPass);
				ResultSet rs = check.executeQuery();

				if (rs.next()) {
					PreparedStatement update = con.prepareStatement("UPDATE users SET upassword=? WHERE uemail=?");
					update.setString(1, newPass);
					update.setString(2, email);
					update.executeUpdate();
					response.sendRedirect("userDashboard.jsp?success=passchanged");
				} else {
					response.sendRedirect("changePassword.jsp?error=wrongold");
				}
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

		doGet(request, response);
	}

}
