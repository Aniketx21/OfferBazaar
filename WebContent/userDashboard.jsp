<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, com.offerbazaar.app.DbConnection, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard - OfferBazaar</title>
<link rel="stylesheet" href="CSS/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
/* Additional styles for scrollable offers */
.dashboard-container {
	display: flex;
	height: calc(100vh - 60px); /* Subtract navbar height */
	gap: 20px; /* Space between sidebar and main content */
}

.sidebar {
	height: 100%;
	overflow-y: auto;
	padding-left: 15px; /* Optional left padding */
}

.main-content-container {
	flex: 1;
	display: flex;
	flex-direction: column;
	height: 100%;
	padding-right: 15px; /* Optional right padding */
}

.filter-section {
	flex-shrink: 0;
}

.offer-grid-container {
	flex: 1;
	overflow-y: auto;
	padding-bottom: 20px;
}
</style>
</head>
<body>

	<!-- Top Navbar (fixed) -->
	<div class="navbar">
		<div class="left">🏷️ OfferBazaar User</div>
		<div class="right">
			<a href="index.jsp"><i class="fas fa-home"></i> Home</a> <a href="#"><i
				class="fas fa-user"></i> Welcome <%=com.offerbazaar.app.GetSet.getUserName()%></a>
		</div>
	</div>

	<div class="dashboard-container">
		<!-- Sidebar (fixed) -->
		<div class="sidebar">
			<a href="userDashboard.jsp" class="active"><i class="fas fa-tags"></i>
				Browse Offers</a> <a href="changePassword.jsp"><i class="fas fa-key"></i>
				Change Password</a> <a href="logout.jsp"><i
				class="fas fa-sign-out-alt"></i> Logout</a>
		</div>

		<!-- Main Content -->
		<div class="main-content-container">
			<!-- Search Filter (fixed) -->
			<div class="filter-section">
				<h2>Available Offers</h2>
				<div class="filter-card">
					<form method="post" class="filter-form">
						<div class="filter-group">
							<label for="city"><i class="fas fa-city"></i> City</label> <input
								type="text" id="city" name="city" placeholder="Enter city">
						</div>
						<div class="filter-group">
							<label for="startDate"><i class="far fa-calendar-alt"></i>
								Start Date</label> <input type="date" id="startDate" name="startDate">
						</div>
						<div class="filter-group">
							<label for="endDate"><i class="far fa-calendar-alt"></i>
								End Date</label> <input type="date" id="endDate" name="endDate">
						</div>
						<button type="submit" class="filter-button">
							<i class="fas fa-search"></i> Search Offers
						</button>
					</form>
				</div>
			</div>

			<!-- Offer Cards Grid (scrollable) -->
			<div class="offer-grid-container">
				<div class="offer-grid">
					<%
						String city = request.getParameter("city");
						String startDate = request.getParameter("startDate");
						String endDate = request.getParameter("endDate");

						SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd");
						SimpleDateFormat displayFormat = new SimpleDateFormat("dd/MM/yyyy");

						String sql = "SELECT * FROM offers WHERE 1=1";
						if (city != null && !city.trim().isEmpty()) {
							sql += " AND ofcity LIKE ?";
						}
						if (startDate != null && !startDate.trim().isEmpty()) {
							sql += " AND ofstart >= ?";
						}
						if (endDate != null && !endDate.trim().isEmpty()) {
							sql += " AND ofend <= ?";
						}

						boolean hasOffers = false;

						try {
							Connection con = DbConnection.connect();
							PreparedStatement ps = con.prepareStatement(sql);

							int index = 1;
							if (city != null && !city.trim().isEmpty()) {
								ps.setString(index++, "%" + city + "%");
							}
							if (startDate != null && !startDate.trim().isEmpty()) {
								ps.setDate(index++, java.sql.Date.valueOf(startDate));
							}
							if (endDate != null && !endDate.trim().isEmpty()) {
								ps.setDate(index++, java.sql.Date.valueOf(endDate));
							}

							ResultSet rs = ps.executeQuery();
							while (rs.next()) {
								hasOffers = true;
								String formattedStartDate = displayFormat.format(rs.getDate("ofstart"));
								String formattedEndDate = displayFormat.format(rs.getDate("ofend"));
					%>
					<div class="offer-card">
						<div class="offer-badge"><%=rs.getInt("ofdiscount")%>% OFF
						</div>
						<div class="offer-header">
							<h3 class="offer-title"><%=rs.getString("oftitle")%></h3>
							<div class="offer-merchant">
								by <span class="advertiser-name"><%=rs.getString("abiz")%></span>
							</div>
						</div>
						<div class="offer-location">
							<i class="fas fa-map-marker-alt"></i>
							<%=rs.getString("ofcity")%></div>
						<div class="offer-dates">
							<span><i class="far fa-calendar-check"></i> <%=formattedStartDate%></span>
							<span><i class="far fa-calendar-times"></i> <%=formattedEndDate%></span>
						</div>
						<div class="offer-description">
							<%=rs.getString("ofdesc") != null && !rs.getString("ofdesc").isEmpty()
									? rs.getString("ofdesc").length() > 100
											? rs.getString("ofdesc").substring(0, 100) + "..." : rs.getString("ofdesc")
									: "No description available"%>
						</div>
						<div class="offer-actions">
							<form action="userOfferDetails.jsp" method="get">
								<input type="hidden" name="ofid" value="<%=rs.getInt("ofid")%>">
								<button type="submit" class="view-more-btn">
									<i class="fas fa-eye"></i> View Details
								</button>
							</form>
						</div>
					</div>
					<%
						}
							rs.close();
							ps.close();
							con.close();
						} catch (Exception e) {
							out.print("<div class='no-offers'>Error loading offers. Please try again later.</div>");
							e.printStackTrace();
						}

						if (!hasOffers) {
							out.print(
									"<div class='no-offers'><i class='far fa-frown'></i><h3>No offers found</h3><p>Try adjusting your search criteria</p></div>");
						}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>