<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Invalid Credentials</title>
<!-- Using a more modern font from Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    /* Defining the color palette as CSS variables */
    :root {
        --primary: #10b981;
        --primary-light: #81C784;
        --primary-dark: #1f2937;
        --secondary: #FFC107;
        --secondary-dark: #FFA000;
        --light: #F1F8E9;
        --dark: #212121;
        --gray: #757575;
        --background: #FFFFFF;
        --surface: #FFFFFF;
        --error: #F44336;
        --text-primary: rgba(0, 0, 0, 0.87);
        --text-secondary: rgba(0, 0, 0, 0.6);
        --divider: rgba(0, 0, 0, 0.12);
    }

    /* Basic reset and body styling */
    body {
        font-family: 'Poppins', sans-serif;
        background-color: var(--light); /* Using a light background from the theme */
        color: var(--text-primary);
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* The main container with a card-like design */
    .status-container {
        text-align: center;
        background-color: var(--surface);
        padding: 40px 50px;
        border-radius: 12px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        width: 90%;
        border-top: 5px solid var(--secondary); /* Using secondary color */
    }

    /* Icon styling */
    .status-icon {
        font-size: 50px;
        color: var(--secondary); /* Matches the border-top color */
        margin-bottom: 20px;
    }

    /* Header styling */
    .status-container h2 {
        font-size: 24px;
        font-weight: 600;
        color: var(--text-primary);
        margin-top: 0;
        margin-bottom: 15px;
    }

    /* Paragraph/message styling */
    .status-container p {
        font-size: 16px;
        line-height: 1.6;
        color: var(--text-secondary);
        margin-bottom: 30px;
    }

    /* Button-like link styling */
    .home-link {
        display: inline-block;
        background-color: var(--primary); /* Using green for the home button */
        color: #ffffff;
        padding: 12px 25px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .home-link:hover {
        background-color: var(--primary-dark); /* Using a darker shade on hover */
        transform: translateY(-2px);
    }
</style>
</head>
<body>
    <div class="status-container">
        <div class="status-icon">
            <i class="fas fa-triangle-exclamation"></i>
        </div>
        <h2>Invalid Credentials !</h2>
        <p>
            please enter valid credentials.
        </p>
        <a href="index.jsp" class="home-link">
            <i class="fas fa-home"></i> Go to Homepage
        </a>
    </div>
</body>
</html>
