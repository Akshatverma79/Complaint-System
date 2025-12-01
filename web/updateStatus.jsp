<%-- 
    Document   : updateStatus
    Created on : 1 Dec 2025, 11:36:04?am
    Author     : aksha
--%>

<%@include file="dbConnection.jsp"%>
<%
    String id = request.getParameter("id");
    String status = request.getParameter("st");
    
    PreparedStatement ps = con.prepareStatement("UPDATE complaints SET status=? WHERE id=?");
    ps.setString(1, status);
    ps.setString(2, id);
    ps.executeUpdate();
    
    // In a real app, you would redirect back to dashboard passing the session
    out.println("Status Updated. <a href='admin_login.jsp'>Go Back (Login again for security in this demo)</a>");
%>
