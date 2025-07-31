# 💼 OfferBazaar – Local Offers Aggregator Platform

**Tagline:**  
🌟 *"Your one-stop platform for the best promotional offers. Whether you're shopping or promoting, we've got a place for you!"*

## 📌 Project Overview

**OfferBazaar** is a Java-based web application that connects **local advertisers** with **city-based users** looking for great deals. Advertisers can register, login, and publish promotional offers. Users can explore and filter these offers based on their city. The platform includes an **Admin Panel** for managing advertisers, users, and published offers.

---

## 🧰 Tech Stack

- **Frontend**: JSP, HTML, CSS  
- **Backend**: Java Servlets (Core & Advanced Java)  
- **Database**: MySQL  
- **Database Connectivity**: JDBC  
- **Server**: Apache Tomcat  

---

## 🔑 Key Features

### 📢 Advertiser Module
- Register and login securely
- Add, update, and delete promotional offers
- View and manage submitted offers

### 👥 User Module
- Browse all available offers
- Filter offers by city or category
- View detailed offer information (discount, description, expiry date)

### 🛠️ Admin Module
- Approve or reject advertiser registrations
- Manage advertiser and user accounts
- Monitor, edit, or remove posted offers

---

## 📂 Project Structure


```text
OfferBazaar/
│
├── src/
│   └── controller/            # All Java Servlets (Admin, Advertiser, User controllers)
│
├── WebContent/
│   ├── jsp/                   # JSP Pages (login.jsp, viewOffers.jsp, postOffer.jsp, etc.)
│   ├── css/                   # CSS Stylesheets
│   └── WEB-INF/               # web.xml configuration
│
└── README.md                  # Project documentation


🧭 Project Flow

                             ┌────────────────────┐
                             │     Home Page      │
                             └────────┬───────────┘
                                      │
             ┌────────────────────────┼────────────────────────┐
             │                        │                        │
     ┌───────▼───────┐        ┌───────▼─────────┐       ┌───────▼───────┐
     │   User Login  │        │ Advertiser Login│       │   Admin Login │
     └───────┬───────┘        └────────┬────────┘       └───────┬───────┘
             │                         │                        │
     ┌───────▼─────────┐      ┌────────▼────────┐       ┌───────▼──────────┐
     │ View Offers     │      │ Post/Edit Offer │       │ Manage Users     │
     │ Filter by City  │      │ View Own Offers │       │ Manage Offers    │
     │ View Offer Info │      └─────────────────┘       │ Approve Ads      │
     └─────────────────┘                                └──────────────────┘




