# 💼 OfferBazaar – Local Offers Aggregator Platform

**Tagline:**  
🌟 *"Your one-stop platform for the best promotional offers. Whether you're shopping or promoting, we've got a place for you!"*

## 📌 Project Overview

**OfferBazaar** is a Java-based web application that connects **local vendors** with **city-based users** looking for great deals. Vendors can register, login, and publish promotional offers. Users can explore and filter these offers based on their city. The platform includes an **Admin Panel** for managing vendors, users, and published offers.

---

## 🧰 Tech Stack

- **Frontend**: JSP, HTML, CSS  
- **Backend**: Java Servlets (Core & Advanced Java)  
- **Database**: MySQL  
- **Database Connectivity**: JDBC  
- **Server**: Apache Tomcat  

---

## 🔑 Key Features

### 👤 Vendor Module
- Register and login securely
- Add, update, and delete offers
- View a list of submitted offers

### 👥 User Module
- Browse all available offers
- Filter offers by city or category
- View detailed offer information (discount, description, expiry date)

### 🛠️ Admin Module
- Approve or reject vendor registrations
- Manage vendor and user accounts
- Monitor, edit, or remove offers

---

## 📂 Project Structure

OfferBazaar/
│
├── src/
│ ├── controller/ # Java Servlets (AdminController, VendorController, etc.)
│ ├── dao/ # JDBC Database access (UserDao, OfferDao, etc.)
│ └── model/ # JavaBeans for User, Vendor, Offer, etc.
│
├── WebContent/
│ ├── jsp/ # All JSP pages (login.jsp, viewOffers.jsp, etc.)
│ ├── css/ # Stylesheets
│ ├── images/ # Static assets
│ └── WEB-INF/ # web.xml configuration
│
└── README.md
