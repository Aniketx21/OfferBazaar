<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.offerbazaar.app.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - View Offers</title>
<link rel="stylesheet" href="CSS/admin.css">
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
			<h2>All Offers</h2>
			<table>
				<tr>
					<!-- <th>Sr No.</th> -->
					<th>Title</th>
					<th>Description</th>
					<th>Discount %</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>City</th>
					<th>Advertiser</th>
					<th>AID</th>
				</tr>
				<%
					try {
						Connection con = DbConnection.connect();
						PreparedStatement pstmt = con.prepareStatement("SELECT * FROM offers");
						ResultSet rs = pstmt.executeQuery();
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
						int srno = 1;
						while (rs.next()) {
				%>
				<tr>
					<!-- <td><%=srno++%></td> -->
					<td><%=rs.getString("oftitle")%></td>
					<td><%=rs.getString("ofdesc")%></td>
					<td><%=rs.getInt("ofdiscount")%> %</td>
					<td><%=sdf.format(rs.getDate("ofstart"))%></td>
					<td><%=sdf.format(rs.getDate("ofend"))%></td>
					<td><%=rs.getString("ofcity")%></td>
					<td><%=rs.getString("abiz")%></td>
					<td><%=rs.getInt("aid")%></td>

				</tr>
				<%
					}
						rs.close();
						pstmt.close();
						con.close();
					} catch (Exception e) {
						out.println("<tr><td colspan='9'>Error loading offers</td></tr>");
						e.printStackTrace();
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>
