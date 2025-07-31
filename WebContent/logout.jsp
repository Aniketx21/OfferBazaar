<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging Out...</title>
    <script>
        // Show confirmation popup, then redirect after a pause
        window.onload = function () {
            alert("You have been logged out successfully.");
            window.location.href = "index.jsp"; // Redirect to home or login page
        }
    </script>
</head>
<body>
</body>
</html>