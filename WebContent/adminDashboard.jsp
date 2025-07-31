<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="CSS/admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
.main-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100%;
	text-align: center;
}
</style>
</head>
<body>

	<div class="navbar">
		<div class="left">
			<i class="fas fa-tags"></i> OfferBazaar Admin
		</div>
		<div class="right">
			<a href="index.jsp"><i class="fas fa-home"></i> Home</a> <a
				href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
		</div>
	</div>

	<div class="dashboard">
		<div class="sidebar">
			<a href="adminDashboard.jsp" class="active"><i
				class="fas fa-tachometer-alt"></i> Dashboard</a> <a
				href="adminViewOffers.jsp"><i class="fas fa-tags"></i> Offers</a> <a
				href="adminViewUsers.jsp"><i class="fas fa-users"></i> Users</a> <a
				href="adminViewAdvertiser.jsp"><i class="fas fa-store"></i>
				Advertiser</a> <a href="adminApproveAdvertisers.jsp"><i
				class="fas fa-user-check"></i> Pending Requests</a>
		</div>

		<div class="main-content">
			<h2>Welcome to Admin Dashboard</h2>
			<p>Use the options on the left to manage users, offers, and
				advertisers.</p>
		</div>
	</div>

</body>
</html>
