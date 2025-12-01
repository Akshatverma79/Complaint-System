<%-- 
    Document   : dbConnection
    Created on : 1 Dec 2025, 11:31:22?am
    Author     : aksha
--%>

<%@page import="java.sql.*"%>
<%
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // CHANGE 'root' and 'your_password' to your actual MySQL credentials
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint_system", "root", "akshat");
    } catch (Exception e) {
        out.println("Connection Failed: " + e);
    }
%>