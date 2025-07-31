<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>OfferBazaar - Home</title>
  <link rel="stylesheet" href="CSS/style.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary: #10b981;       /* Updated to match login/registration */
      --primary-light: #81C784;  /* Updated to match login/registration */
      --primary-dark: #1f2937;  /* Updated to match login/registration */
      --secondary: #FFC107;     /* Amber - kept same as both have this */
      --secondary-dark: #FFA000; /* Optional, you can keep or remove */
      --light: #F1F8E9;        /* Optional background color */
      --dark: #212121;         /* Optional dark color */
      --gray: #757575;         /* Optional gray color */
      --background: #FFFFFF;   /* Added to match login/registration */
      --surface: #FFFFFF;     /* Added to match login/registration */
      --error: #F44336;       /* Added to match login/registration */
      --text-primary: rgba(0, 0, 0, 0.87);  /* Added to match */
      --text-secondary: rgba(0, 0, 0, 0.6); /* Added to match */
      --divider: rgba(0, 0, 0, 0.12);      /* Added to match */
    }
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    
    body {
      background-color: #F9FBE7;
      color: var(--dark);
    }
    
    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0.8rem 5%;
      background-color: white;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
      position: sticky;
      top: 0;
      z-index: 100;
      height: 65px;
    }
    
    .logo {
      font-weight: 700;
      font-size: 1.7rem;
      color: var(--primary);
      display: flex;
      align-items: center;
      gap: 0.4rem;
      margin-right: auto;
    }
    
    .logo::before {
      content: "🏷️";
      font-size: 1.5rem;
      margin-right: 0.2rem;
    }
    
    .nav-links {
      display: flex;
      gap: 1.5rem;
      align-items: center;
      margin-left: 2rem;
    }
    
    .nav-links a {
      color: var(--gray);
      font-weight: 500;
      text-decoration: none;
      transition: all 0.3s ease;
      position: relative;
      font-size: 0.95rem;
      white-space: nowrap;
    }
    
    .nav-links a:hover {
      color: var(--primary);
    }
    
    .nav-links a::after {
      content: '';
      position: absolute;
      width: 0;
      height: 2px;
      bottom: -3px;
      left: 0;
      background-color: var(--primary);
      transition: width 0.3s ease;
    }
    
    .nav-links a:hover::after {
      width: 100%;
    }
    
    .hero-container {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: calc(100vh - 65px);
      background: linear-gradient(rgba(76, 175, 80, 0.1), rgba(76, 175, 80, 0.05)), 
                  url('https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1600&q=80') no-repeat center center/cover;
      padding: 2rem;
    }
    
    .hero-card {
      background-color: rgba(255, 255, 255, 0.98);
      padding: 3rem;
      border-radius: 12px;
      text-align: center;
      max-width: 600px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      backdrop-filter: blur(5px);
      border: 1px solid rgba(255, 255, 255, 0.3);
      transform: translateY(0);
      animation: float 3s ease-in-out infinite;
    }
    
    @keyframes float {
      0% { transform: translateY(0px); }
      50% { transform: translateY(-8px); }
      100% { transform: translateY(0px); }
    }
    
    .hero-card h1 {
      font-size: 2.8rem;
      margin-bottom: 1.2rem;
      //color: var(--primary);
      color: var(--primary-dark);
      line-height: 1.2;
    }
    
    .hero-card .highlight {
      //color: var(--primary-dark);
      color: var(--primary);
      font-weight: 700;
    }
    
    .hero-card p {
      font-size: 1.1rem;
      color: var(--gray);
      margin-bottom: 2rem;
      line-height: 1.6;
    }
    
    .btn-group {
      display: flex;
      justify-content: center;
      gap: 1.2rem;
    }
    
    .btn {
      padding: 0.8rem 1.8rem;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: 6px;
      font-weight: 600;
      text-decoration: none;
      transition: all 0.3s ease;
      cursor: pointer;
      font-size: 1rem;
      box-shadow: 0 4px 8px rgba(76, 175, 80, 0.3);
    }
    
    .btn.secondary {
      background-color: var(--secondary);
      box-shadow: 0 4px 8px rgba(255, 193, 7, 0.3);
    }
    
    .btn:hover {
      background-color: var(--primary-dark);
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(76, 175, 80, 0.4);
    }
    
    .btn.secondary:hover {
      background-color: var(--secondary-dark);
      transform: translateY(-2px);
      box-shadow: 0 6px 12px rgba(255, 160, 0, 0.4);
    }
    
    @media (max-width: 768px) {
      .navbar {
        padding: 0.8rem 1rem;
        height: auto;
        flex-wrap: wrap;
      }
      
      .logo {
        width: 100%;
        justify-content: center;
        margin-bottom: 0.5rem;
      }
      
      .nav-links {
        width: 100%;
        justify-content: center;
        margin-left: 0;
        gap: 1rem;
        flex-wrap: wrap;
      }
      
      .hero-card {
        padding: 1.5rem;
      }
      
      .hero-card h1 {
        font-size: 2.2rem;
      }
      
      .btn-group {
        flex-direction: column;
        gap: 0.8rem;
      }
      
      .btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <div class="navbar">
    <div class="logo">OfferBazaar</div>
    <div class="nav-links">
      <a href="#">Home</a>
      <a href="#">About Us</a>
      <a href="#">Offers</a>
      <a href="adminLogin.jsp">Admin</a>
      <a href="login.jsp">Login</a>
      <a href="register.jsp">Register</a>
    </div>
  </div>

  <!-- Hero Section -->
  <div class="hero-container">
    <div class="hero-card">
      <h1>Welcome to <span class="highlight">OfferBazaar</span></h1>
      <p>
        Your one-stop platform for the best promotional offers. Whether you're shopping or promoting, we've got a place for you!
      </p>
      <div class="btn-group">
        <a href="login.jsp" class="btn">Login</a>
        <a href="register.jsp" class="btn secondary">Register</a>
      </div>
    </div>
  </div>
</body>
</html>