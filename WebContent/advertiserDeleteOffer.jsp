<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="com.offerbazaar.app.DbConnection" %>
<%
  int ofid = Integer.parseInt(request.getParameter("ofid"));
  try {
    Connection con = DbConnection.connect();
    PreparedStatement ps = con.prepareStatement("DELETE FROM offers WHERE ofid = ?");
    ps.setInt(1, ofid);
    ps.executeUpdate();
    ps.close();
    con.close();
    response.sendRedirect("advertiserViewOffers.jsp");
  } catch (Exception e) {
    out.println("Error deleting offer.");
    e.printStackTrace();
  }
%>
