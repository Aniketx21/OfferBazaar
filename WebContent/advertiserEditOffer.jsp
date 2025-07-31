<%@ page import="java.sql.*" %>
<%@ page import="com.offerbazaar.app.DbConnection" %>
<%@ page import="com.offerbazaar.app.GetSet" %>
<%
    int ofid = Integer.parseInt(request.getParameter("ofid"));
    Connection con = DbConnection.connect();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM offers WHERE ofid = ?");
    ps.setInt(1, ofid);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Offer</title>
    <link rel="stylesheet" href="CSS/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<div class="navbar">
  <div class="left">🏷️ OfferBazaar Advertiser</div>
  <div class="right">
    <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
    <a href="#"><i class="fas fa-user-circle"></i> <%= GetSet.getAdvertiserName() %></a>
  </div>
</div>

<div class="dashboard">
  <div class="sidebar">
    <a href="advertiserDashboard.jsp"><i class="fas fa-plus-circle"></i> Post Offer</a>
    <a href="advertiserViewOffers.jsp"><i class="fas fa-eye"></i> View Offers</a>
    <a href="advertiserChangePassword.jsp"><i class="fas fa-key"></i> Change Password</a>
    <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
  </div>

  <div class="main-content">
    <h2 style="text-align:center; margin-bottom: 30px;">Edit Offer</h2>

    <form action="AdvertiserUpdateOfferServlet" method="post"
          style="max-width: 720px; margin: 0 auto; padding: 30px 40px; background-color: #ffffff; border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.08);">
      
      <input type="hidden" name="ofid" value="<%= ofid %>">
      
      <!-- Title -->
      <div style="margin-bottom: 20px;">
        <label style="font-weight: 600; display: block; margin-bottom: 6px;">Title:</label>
        <input type="text" name="oftitle" value="<%= rs.getString("oftitle") %>" required
               style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-size: 15px;">
      </div>

      <!-- Description -->
      <div style="margin-bottom: 20px;">
        <label style="font-weight: 600; display: block; margin-bottom: 6px;">Description:</label>
        <textarea name="ofdesc" rows="3" required
                  style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-size: 15px;"><%= rs.getString("ofdesc") %></textarea>
      </div>

      <!-- Discount and City -->
      <div style="display: flex; gap: 40px; margin-bottom: 20px;">
        <div style="flex: 1;">
          <label style="font-weight: 600; display: block; margin-bottom: 6px;">Discount (%):</label>
          <input type="number" name="ofdiscount" value="<%= rs.getInt("ofdiscount") %>" required min="1" max="100"
                 style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-size: 15px;">
        </div>
        <div style="flex: 1;">
          <label style="font-weight: 600; display: block; margin-bottom: 6px;">City:</label>
          <input type="text" name="ofcity" value="<%= rs.getString("ofcity") %>" required
                 style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-size: 15px;">
        </div>
      </div>

      <!-- Start and End Dates -->
      <div style="display: flex; gap: 40px; margin-bottom: 30px;">
        <div style="flex: 1;">
          <label style="font-weight: 600; display: block; margin-bottom: 6px;">Start Date:</label>
          <input type="date" name="ofstart" value="<%= rs.getDate("ofstart") %>" required
                 style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-size: 15px;">
        </div>
        <div style="flex: 1;">
          <label style="font-weight: 600; display: block; margin-bottom: 6px;">End Date:</label>
          <input type="date" name="ofend" value="<%= rs.getDate("ofend") %>" required
                 style="width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-size: 15px;">
        </div>
      </div>

      <!-- Submit -->
      <div style="text-align: center;">
        <button type="submit"
                style="width: 100%; padding: 14px; background-color: #10b981; color: white; font-size: 17px; font-weight: bold; border: none; border-radius: 8px; cursor: pointer;">
          Update Offer
        </button>
      </div>
    </form>
  </div>
</div>

</body>
</html>

<%
    }
    rs.close();
    ps.close();
    con.close();
%>
