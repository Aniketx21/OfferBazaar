<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.offerbazaar.app.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Approve Advertisers</title>

<!-- ✅ Fix: Correct relative path to CSS folder -->
<link rel="stylesheet" href="CSS/admin.css">

<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<!-- Top Navbar -->
	<div class="navbar">
		<div class="left">
			<i class="fas fa-tags"></i> OfferBazaar Admin
		</div>
		<div class="right">
			<a href="index.jsp"><i class="fas fa-home"></i> Home</a> <a
				href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
		</div>
	</div>

	<!-- Sidebar + Main Content -->
	<div class="dashboard">
		<!-- Sidebar -->
		<div class="sidebar">
			<a href="adminDashboard.jsp" class="active"><i
				class="fas fa-tachometer-alt"></i> Dashboard</a> <a
				href="adminViewOffers.jsp"><i class="fas fa-tags"></i> Offers</a> <a
				href="adminViewUsers.jsp"><i class="fas fa-users"></i> Users</a><a
				href="adminViewAdvertiser.jsp"><i class="fas fa-store"></i>
				Advertiser</a> <a href="adminApproveAdvertisers.jsp"><i
				class="fas fa-user-check"></i> Pending Requests</a>
		</div>

		<div class="main-content">
			<h2>Pending Advertisers</h2>
			<table>
				<tr>
					<th>AID</th>
					<th>Name</th>
					<th>Biz Name</th>
					<th>Email</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
				<%
					try {
						Connection con = DbConnection.connect();
						PreparedStatement pstmt = con.prepareStatement("SELECT * FROM advertiser");
						ResultSet rs = pstmt.executeQuery();
						while (rs.next()) {
							int id = rs.getInt("aid");
							String name = rs.getString("aname");
							String bizName = rs.getString("abiz");
							String email = rs.getString("aemail");
							int approved = rs.getInt("aapproved");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=bizName%></td>
					<td><%=email%></td>
					<td><%=approved == 1 ? "Approved" : "Pending"%></td>
					<td>
						<%
							if (approved == 0) {
						%>
						<form action="AdminApproveAdvertiserServlet" method="post">
							<input type="hidden" name="aid" value="<%=id%>">
							<button type="submit">Approve</button>
						</form> <%
 	} else {
 %> <span style="color: green;">✔</span> <%
 	}
 %>
					</td>
				</tr>
				<%
					}
						rs.close();
						pstmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>