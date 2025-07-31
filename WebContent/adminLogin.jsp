<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Login | OfferBazaar</title>
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
    
    .login-container {
      width: 100%;
      max-width: 480px;
      background-color: var(--surface);
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    }
    
    .login-header {
      background-color: var(--primary);
      color: white;
      padding: 24px;
      text-align: center;
    }
    
    .login-header h1 {
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
    
    .input-group {
      margin-bottom: 24px;
      position: relative;
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
      box-shadow: 0 0 0 2px rgba(16, 185, 129, 0.2);
    }
    
    .btn-login {
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
      margin-top: 8px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    
    .btn-login:hover {
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
    
    @media (max-width: 600px) {
      body {
        padding: 16px;
        align-items: flex-start;
      }
      
      .login-container {
        box-shadow: none;
        border-radius: 0;
      }
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="login-header">
      <h1>Admin Portal</h1>
    </div>

    <div class="form-container">
      <form id="adminForm" action="AdminLoginServ" method="post">
        <div class="input-group">
          <label for="adminEmail">Email Address</label>
          <input type="email" id="adminEmail" name="email" required placeholder="Enter admin email">
        </div>
        
        <div class="input-group">
          <label for="adminPassword">Password</label>
          <input type="password" id="adminPassword" name="password" required placeholder="Enter password">
        </div>
        
        <button type="submit" class="btn-login">Login</button>
        
        <div class="form-footer">
          <a href="index.jsp">Back to Home</a>
        </div>
      </form>
    </div>
  </div>
</body>
</html>