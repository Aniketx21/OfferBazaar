<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.offerbazaar.app.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - View Users</title>

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
			<h2>All Users</h2>
			<table>
				<tr>
					<th>User ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Status</th>
				</tr>
				<%
					try {
						Connection con = DbConnection.connect();
						PreparedStatement pstmt = con.prepareStatement("SELECT * FROM users");
						ResultSet rs = pstmt.executeQuery();
						while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt("uid")%></td>
					<td><%=rs.getString("uname")%></td>
					<td><%=rs.getString("uemail")%></td>
					<td>Active</td>
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
