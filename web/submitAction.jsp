<%-- 
    Document   : submitAction
    Created on : 1 Dec 2025, 11:33:24?am
    Author     : aksha
--%>

<%@include file="dbConnection.jsp"%>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String desc = request.getParameter("desc");

    if(name != null && desc != null) {
        PreparedStatement ps = con.prepareStatement("INSERT INTO complaints(student_name, email, description) VALUES(?,?,?)", Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, desc);
        ps.executeUpdate();
        
        // Get the generated ID to show the user
        ResultSet rs = ps.getGeneratedKeys();
        if(rs.next()){
            int id = rs.getInt(1);
            out.println("<script>alert('Complaint Submitted Successfully! Your Complaint ID is: " + id + "'); window.location='index.jsp';</script>");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>