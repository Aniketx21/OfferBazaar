<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Register | OfferBazaar</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style>
	:root {
	  --primary: #10b981;
	  --primary-light: #81C784;
	  --primary-dark: #1f2937;
	  --secondary: #FFC107;
	  --background: #FFFFFF;
	  --surface: #FFFFFF;
	  --error: #F44336;
	  --text-primary: rgba(0, 0, 0, 0.87);
	  --text-secondary: rgba(0, 0, 0, 0.6);
	  --divider: rgba(0, 0, 0, 0.12);
	}
    
    * {
      box-sizing: border-box;
      font-family: 'Roboto', sans-serif;
    }
    
    body {
      margin: 0;
      padding: 0;
      background-color: var(--background);
      color: var(--text-primary);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }
    
    .register-container {
      width: 100%;
      max-width: 600px;
      background-color: var(--surface);
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    
    .register-header {
      background-color: var(--primary);
      color: white;
      padding: 24px;
      text-align: center;
    }
    
    .register-header h1 {
      margin: 0;
      font-weight: 500;
      font-size: 1.5rem;
    }
    
    .tabs {
      display: flex;
      background-color: var(--primary-dark);
    }
    
    .tabs button {
      flex: 1;
      padding: 16px;
      background: transparent;
      border: none;
      color: rgba(255, 255, 255, 0.7);
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      cursor: pointer;
      transition: all 0.3s;
      font-size: 0.875rem;
      position: relative;
    }
    
    .tabs button.active {
      color: white;
      background-color: rgba(255, 255, 255, 0.1);
    }
    
    .tabs button.active::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      height: 3px;
      background-color: var(--secondary);
    }
    
    .form-container {
      padding: 32px;
    }
    
    .register-form {
      display: none;
    }
    
    .register-form.active {
      display: block;
      animation: fadeIn 0.5s ease;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 16px;
    }
    
    .input-group {
      margin-bottom: 16px;
      position: relative;
    }
    
    .input-group.full-width {
      grid-column: span 2;
    }
    
    .input-group label {
      display: block;
      margin-bottom: 8px;
      font-size: 0.875rem;
      color: var(--text-secondary);
      font-weight: 500;
    }
    
    .input-group input {
      width: 100%;
      padding: 12px 16px;
      border: 1px solid var(--divider);
      border-radius: 4px;
      font-size: 1rem;
      transition: all 0.3s;
      background-color: rgba(0,0,0,0.02);
    }
    
    .input-group input:focus {
      border-color: var(--primary);
      outline: none;
      box-shadow: 0 0 0 2px rgba(76, 175, 80, 0.2);
    }
    
    .btn-register {
      width: 100%;
      padding: 14px;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      font-weight: 500;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      cursor: pointer;
      transition: background-color 0.3s;
      margin-top: 16px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .btn-register:hover {
      background-color: var(--primary-dark);
    }
    
    .form-footer {
      margin-top: 24px;
      text-align: center;
      font-size: 0.875rem;
      color: var(--text-secondary);
    }
    
    .form-footer a {
      color: var(--primary);
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;
    }
    
    .form-footer a:hover {
      color: var(--primary-dark);
      text-decoration: underline;
    }
    
    .divider {
      display: flex;
      align-items: center;
      margin: 20px 0;
      color: var(--text-secondary);
      font-size: 0.75rem;
    }
    
    .divider::before, .divider::after {
      content: "";
      flex: 1;
      border-bottom: 1px solid var(--divider);
    }
    
    .divider::before {
      margin-right: 10px;
    }
    
    .divider::after {
      margin-left: 10px;
    }
    
    @media (max-width: 768px) {
      .form-grid {
        grid-template-columns: 1fr;
      }
      
      .input-group.full-width {
        grid-column: span 1;
      }
    }
    
    @media (max-width: 600px) {
      body {
        padding: 16px;
        align-items: flex-start;
      }
      
      .register-container {
        box-shadow: none;
        border-radius: 0;
      }
    }
  </style>
  <script>
    function showForm(role) {
      document.getElementById("userForm").classList.remove("active");
      document.getElementById("advertiserForm").classList.remove("active");
      document.getElementById(role + "Form").classList.add("active");

      document.getElementById("userTab").classList.remove("active");
      document.getElementById("advertiserTab").classList.remove("active");
      document.getElementById(role + "Tab").classList.add("active");
    }

    window.onload = function () {
      const role = localStorage.getItem("registerTab");
      if (role === "advertiser") {
        showForm("advertiser");
      } else {
        showForm("user");
      }
    };
    
    function showLogin(role) {
      localStorage.setItem("loginTab", role);
      window.location.href = "login.jsp";
    }
  </script>
</head>
<body>
  <div class="register-container">
    <div class="register-header">
      <h1>Create Your Account</h1>
    </div>
    
    <div class="tabs">
      <button id="userTab" class="active" onclick="showForm('user')">User Register</button>
      <button id="advertiserTab" onclick="showForm('advertiser')">Advertiser Register</button>
    </div>

    <div class="form-container">
      <!-- User Registration Form -->
      <form id="userForm" class="register-form active" action="UserRegisterServlet" method="post">
        <input type="hidden" name="role" value="user">
        
        <div class="form-grid">
          <div class="input-group">
            <label>Full Name</label>
            <input type="text" name="uname" required placeholder="Your name">
          </div>
          
          <div class="input-group">
            <label>Contact</label>
            <input type="text" name="ucontact" required placeholder="Contact">
          </div>
          
          <div class="input-group full-width">
            <label>Address</label>
            <input type="text" name="uaddress" required placeholder="Your full address">
          </div>
          
          <div class="input-group full-width">
            <label>Email</label>
            <input type="email" name="uemail" required placeholder="your@email.com">
          </div>
          
          <div class="input-group">
            <label>Password</label>
            <input type="password" name="upassword" required placeholder="Create password">
          </div>
          
          <div class="input-group">
            <label>Confirm Password</label>
            <input type="password" name="upassword_confirm" required placeholder="Confirm password">
          </div>
        </div>
        
        <button type="submit" class="btn-register">Create Account</button>
        
        <div class="divider">OR</div>
        
        <div class="form-footer">
          Already have an account? <a href="login.jsp" onclick="event.preventDefault(); showLogin('user')">Login here</a><br>
          <a href="index.jsp">Back to Home</a>
        </div>
      </form>

      <!-- Advertiser Registration Form -->
      <form id="advertiserForm" class="register-form" action="AdvertiserRegisterServlet" method="post">
        <input type="hidden" name="role" value="advertiser">
        
        <div class="form-grid">
          <div class="input-group">
            <label>Advertiser Name</label>
            <input type="text" name="aname" required placeholder="Your name">
          </div>
          
          <div class="input-group">
            <label>Business Name</label>
            <input type="text" name="abiz" required placeholder="Your business">
          </div>
          
          <div class="input-group">
            <label>Contact</label>
            <input type="text" name="acontact" required placeholder="+1234567890">
          </div>
          
          <div class="input-group">
            <label>City</label>
            <input type="text" name="acity" required placeholder="Your city">
          </div>
          
          <div class="input-group full-width">
            <label>Email</label>
            <input type="email" name="aemail" required placeholder="business@email.com">
          </div>
          
          <div class="input-group">
            <label>Password</label>
            <input type="password" name="apass" required placeholder="Create password">
          </div>
          
          <div class="input-group">
            <label>Confirm Password</label>
            <input type="password" name="apass_confirm" required placeholder="Confirm password">
          </div>
        </div>
        
        <button type="submit" class="btn-register">Create Account</button>
        
        <div class="divider">OR</div>
        
        <div class="form-footer">
          Already have an account? <a href="login.jsp" onclick="event.preventDefault(); showLogin('advertiser')">Login here</a><br>
          <a href="index.jsp">Back to Home</a>
        </div>
      </form>
    </div>
  </div>
</body>
</html>