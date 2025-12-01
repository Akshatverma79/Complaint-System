<%-- 
    Document   : admin_dashboard
    Created on : 1 Dec 2025, 11:35:24?am
    Author     : aksha
--%>

<%@include file="dbConnection.jsp"%>
<%
    // Simple Session Check (In a real app, use Sessions properly)
    String user = request.getParameter("user");
    String pass = request.getParameter("pass");
    
    // Check credentials against DB or hardcoded for this simplified tutorial
    // Note: If accessing directly without login, this simple check fails. 
    // For production, check session attributes.
    boolean isAuthenticated = false;
    
    if(user != null && pass != null) {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, user);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) isAuthenticated = true;
    }

    if(!isAuthenticated) {
        out.println("Access Denied. <a href='admin_login.jsp'>Login Here</a>");
        return; 
    }
%>

<!DOCTYPE html>
<html>
<head>
    <style>
        table { width: 90%; margin: 20px auto; border-collapse: collapse; font-family: sans-serif; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #2c3e50; color: white; }
        tr:nth-child(even){background-color: #f2f2f2;}
        .btn { padding: 5px 10px; text-decoration: none; color: white; border-radius: 3px; }
        .btn-resolve { background-color: green; }
        .btn-reject { background-color: red; }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Admin Dashboard</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Student</th>
            <th>Description</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM complaints ORDER BY id DESC");
            while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("student_name") %></td>
            <td><%= rs.getString("description") %></td>
            <td><%= rs.getString("submission_date") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <a href="updateStatus.jsp?id=<%=rs.getInt("id")%>&st=Resolved" class="btn btn-resolve">Resolve</a>
                <a href="updateStatus.jsp?id=<%=rs.getInt("id")%>&st=Rejected" class="btn btn-reject">Reject</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
