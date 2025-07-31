<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.sql.*, com.offerbazaar.app.DbConnection, java.text.SimpleDateFormat"%>
<%
int ofid = Integer.parseInt(request.getParameter("ofid"));
SimpleDateFormat displayFormat = new SimpleDateFormat("dd/MM/yyyy");

Connection con = DbConnection.connect();
PreparedStatement ps = con.prepareStatement("SELECT * FROM offers WHERE ofid = ?");
ps.setInt(1, ofid);
ResultSet rs = ps.executeQuery();

if (!rs.next()) {
    response.sendRedirect("userDashboard.jsp?error=Offer not found");
    return;
}

String abiz = rs.getString("abiz");
int discount = rs.getInt("ofdiscount");
String formattedStartDate = displayFormat.format(rs.getDate("ofstart"));
String formattedEndDate = displayFormat.format(rs.getDate("ofend"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Offer Details - OfferBazaar</title>
    <link rel="stylesheet" href="CSS/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /* Fix spacing and centering */
        .dashboard {
            gap: 0; /* Remove default gap */
        }
        .main-content {
            padding: 20px;
            display: flex;
            justify-content: center;
        }
        .offer-detail-container {
            width: 100%;
            max-width: 800px;
        }
        .offer-detail-card {
            margin: 0 auto;
        }
        /* Keep existing styles */
        .offer-title {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        .claim-button {
            background: #10b981;
        }
        .claim-button.claimed {
            background: #ef4444;
        }
        .claim-message {
            display: none;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="left">🏷️ OfferBazaar User</div>
        <div class="right">
            <a href="index.jsp"><i class="fas fa-home"></i> Home</a> 
            <a href="#"><i class="fas fa-user"></i> Welcome <%=com.offerbazaar.app.GetSet.getUserName()%></a>
        </div>
    </div>

    <div class="dashboard">
        <div class="sidebar">
            <a href="userDashboard.jsp"><i class="fas fa-tags"></i> Browse Offers</a> 
            <a href="changePassword.jsp"><i class="fas fa-key"></i> Change Password</a> 
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <div class="main-content">
            <div class="offer-detail-container">
                <div class="offer-detail-card">
                    <h1 class="offer-title">
                        <%= rs.getString("oftitle") %>
                        <span class="discount-badge"><%= discount %>% OFF</span>
                    </h1>
                    
                    <div class="offer-field">
                        <div class="offer-label"><i class="fas fa-store"></i> Merchant:</div>
                        <div class="offer-value"><%= abiz %></div>
                    </div>
                    
                    <div class="offer-field">
                        <div class="offer-label"><i class="fas fa-map-marker-alt"></i> Location:</div>
                        <div class="offer-value"><%= rs.getString("ofcity") %></div>
                    </div>
                    
                    <div class="offer-field">
                        <div class="offer-label"><i class="far fa-calendar-check"></i> Start Date:</div>
                        <div class="offer-value"><%= formattedStartDate %></div>
                    </div>
                    
                    <div class="offer-field">
                        <div class="offer-label"><i class="far fa-calendar-times"></i> End Date:</div>
                        <div class="offer-value"><%= formattedEndDate %></div>
                    </div>
                    
                    <div class="offer-field">
                        <div class="offer-label"><i class="fas fa-align-left"></i> Description:</div>
                        <div class="offer-value"><%= rs.getString("ofdesc") %></div>
                    </div>
                    
                    <div class="action-buttons">
                        <a href="userDashboard.jsp" class="back-button">
                            <i class="fas fa-arrow-left"></i> Back to Offers
                        </a>
                        <button class="claim-button" onclick="claimOffer()">
                            <i class="fas fa-gift"></i> Claim Offer
                        </button>
                    </div>
                    
                    <div id="claimMessage" class="claim-message">
                        <i class="fas fa-info-circle"></i> For claiming this offer, please visit the shop or their website directly.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function claimOffer() {
            document.getElementById('claimMessage').style.display = 'block';
            const btn = document.querySelector('.claim-button');
            btn.innerHTML = '<i class="fas fa-check"></i> Offer Claimed';
            btn.classList.add('claimed');
            btn.disabled = true;
        }
    </script>
</body>
</html>
<%
rs.close();
ps.close();
con.close();
%>