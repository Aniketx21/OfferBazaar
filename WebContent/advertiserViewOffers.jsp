<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.offerbazaar.app.DbConnection"%>
<%@ page import="com.offerbazaar.app.GetSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Offers</title>
<link rel="stylesheet" href="CSS/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

	<div class="navbar">
		<div class="left">🏷️ OfferBazaar Advertiser</div>
		<div class="right">
			<a href="index.jsp"><i class="fas fa-home"></i> Home</a> <a href="#"><i
				class="fas fa-user-circle"></i> <%=GetSet.getAdvertiserName()%></a>
		</div>
	</div>

	<div class="dashboard">
		<div class="sidebar">
			<a href="advertiserDashboard.jsp"><i class="fas fa-plus-circle"></i>
				Post Offer</a> <a href="advertiserViewOffers.jsp" class="active"><i
				class="fas fa-eye"></i> View Offers</a> <a href="changePassword.jsp"><i
				class="fas fa-key"></i> Change Password</a> <a href="logout.jsp"><i
				class="fas fa-sign-out-alt"></i> Logout</a>
		</div>

		<div class="main-content">
			<h2>Your Posted Offers</h2>
			<table>
				<tr>
					<th>Offer ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Discount</th>
					<th>City</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Actions</th>
				</tr>
				<%
					try {
						Connection con = DbConnection.connect();
						PreparedStatement ps = con.prepareStatement("SELECT * FROM offers WHERE aid = ?");
						ps.setInt(1, GetSet.getAid());
						ResultSet rs = ps.executeQuery();
						java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
						while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt("ofid")%></td>
					<td><%=rs.getString("oftitle")%></td>
					<td><%=rs.getString("ofdesc")%></td>
					<td><%=rs.getInt("ofdiscount")%>%</td>
					<td><%=rs.getString("ofcity")%></td>
					<td><%=sdf.format(rs.getDate("ofstart"))%></td>
					<td><%=sdf.format(rs.getDate("ofend"))%></td>
					<td><a
						href="advertiserEditOffer.jsp?ofid=<%=rs.getInt("ofid")%>"
						title="Edit"> <i class="fas fa-edit"
							style="color: #2563eb; margin-right: 10px;"></i>
					</a> <a href="advertiserDeleteOffer.jsp?ofid=<%=rs.getInt("ofid")%>"
						title="Delete"
						onclick="return confirm('Are you sure you want to delete this offer?');">
							<i class="fas fa-trash-alt" style="color: #dc2626;"></i>
					</a></td>
				</tr>
				<%
					}
						rs.close();
						ps.close();
						con.close();
					} catch (Exception e) {
						out.print("<tr><td colspan='8'>Error loading offers.</td></tr>");
						e.printStackTrace();
					}
				%>
			</table>
		</div>
	</div>

</body>
</html>
