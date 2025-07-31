<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.offerbazaar.app.GetSet" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Change Password</title>
  <link rel="stylesheet" href="CSS/admin.css"> <!-- Using admin.css for consistent styling -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  
</head>
<body>
  
	 <div class="change-password-wrapper">
    <h2><i class="fas fa-key"></i> Change Password</h2>

    <!-- ✅ Show error/success messages -->
    <%
      String error = request.getParameter("error");
      String success = request.getParameter("success");

      if ("wrongold".equals(error)) {
    %>
        <p class="msg error"><i class="fas fa-exclamation-circle"></i> Old password is incorrect.</p>
    <%
      } else if ("nomatch".equals(error)) {
    %>
        <p class="msg error"><i class="fas fa-exclamation-circle"></i> New passwords do not match.</p>
    <%
      } else if ("passchanged".equals(success)) {
    %>
        <p class="msg success"><i class="fas fa-check-circle"></i> Password updated successfully!</p>
    <%
      }
    %>

    <!-- ✅ Form -->
    <form action="ChangePasswordServlet" method="post">
      <div>
        <label><i class="fas fa-lock"></i> Old Password:</label>
        <input type="password" name="oldPassword" required />
      </div>
      <div>
        <label><i class="fas fa-lock-open"></i> New Password:</label>
        <input type="password" name="newPassword" required />
      </div>
      <div>
        <label><i class="fas fa-check-circle"></i> Confirm New Password:</label>
        <input type="password" name="confirmPassword" required />
      </div>
      <button type="submit"><i class="fas fa-save"></i> Update Password</button>
    </form>
  </div>

</body>
</html>
