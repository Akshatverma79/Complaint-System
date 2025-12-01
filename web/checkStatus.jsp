<%-- 
    Document   : checkStatus
    Created on : 1 Dec 2025, 11:34:08?am
    Author     : aksha
--%>

<%@page import="java.sql.*"%>
<%@include file="dbConnection.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Status | Tracking</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            background: #f0f2f5;
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .status-card {
            background: white;
            width: 100%;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
            position: relative;
        }

        /* Header Section */
        .card-header {
            background: #2c3e50;
            padding: 25px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-header h2 { margin: 0; font-size: 20px; font-weight: 500; }
        .card-header .id-badge {
            background: rgba(255,255,255,0.2);
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 13px;
        }

        /* Content Section */
        .card-body { padding: 30px; }

        .info-row {
            display: flex;
            margin-bottom: 25px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        
        .info-icon {
            width: 40px;
            height: 40px;
            background: #eef2f7;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #2c3e50;
            margin-right: 20px;
        }

        .info-data h4 { margin: 0 0 5px 0; color: #888; font-size: 12px; text-transform: uppercase; letter-spacing: 1px; }
        .info-data p { margin: 0; color: #333; font-weight: 600; font-size: 16px; }

        /* Dynamic Status Colors */
        .status-indicator {
            padding: 8px 20px;
            border-radius: 6px;
            font-weight: bold;
            display: inline-block;
            text-transform: uppercase;
            font-size: 14px;
        }

        .st-pending { background: #fff3cd; color: #856404; border: 1px solid #ffeeba; }
        .st-resolved { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .st-rejected { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }

        /* Footer Actions */
        .card-footer {
            background: #f8f9fa;
            padding: 20px;
            text-align: center;
            border-top: 1px solid #eee;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            margin: 0 5px;
            transition: 0.3s;
            border: none;
            cursor: pointer;
        }

        .btn-home { background: #2c3e50; color: white; }
        .btn-home:hover { background: #1a252f; }
        
        .btn-print { background: #fff; color: #555; border: 1px solid #ddd; }
        .btn-print:hover { background: #eee; }

        /* Error State */
        .error-state { text-align: center; padding: 40px; }
        .error-state i { font-size: 50px; color: #ccc; margin-bottom: 20px; }
        .error-state h3 { color: #555; }
    </style>
</head>
<body>

    <div class="status-card">
        <%
            String id = request.getParameter("cid");
            boolean found = false;
            
            // Default variables
            String name = "";
            String date = "";
            String desc = "";
            String status = "";
            String statusClass = ""; // CSS class based on status

            try {
                if(id != null && !id.trim().isEmpty()){
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM complaints WHERE id=?");
                    ps.setString(1, id);
                    ResultSet rs = ps.executeQuery();

                    if(rs.next()) {
                        found = true;
                        name = rs.getString("student_name");
                        desc = rs.getString("description");
                        date = rs.getString("submission_date"); // This gets the timestamp
                        status = rs.getString("status");

                        // Determine Color Class logic
                        if(status.equalsIgnoreCase("Resolved")) {
                            statusClass = "st-resolved";
                        } else if(status.equalsIgnoreCase("Rejected")) {
                            statusClass = "st-rejected";
                        } else {
                            statusClass = "st-pending";
                        }
                    }
                }
            } catch(Exception e) { out.println(e); }

            if(found) {
        %>
        
        <div class="card-header">
            <h2><i class="fas fa-file-alt"></i> Complaint Details</h2>
            <span class="id-badge">#<%= id %></span>
        </div>

        <div class="card-body">
            
            <div class="info-row">
                <div class="info-icon"><i class="fas fa-user"></i></div>
                <div class="info-data">
                    <h4>Submitted By</h4>
                    <p><%= name %></p>
                </div>
            </div>

            <div class="info-row">
                <div class="info-icon"><i class="fas fa-calendar-alt"></i></div>
                <div class="info-data">
                    <h4>Submission Date</h4>
                    <p><%= date %></p>
                </div>
            </div>

            <div class="info-row">
                <div class="info-icon"><i class="fas fa-align-left"></i></div>
                <div class="info-data">
                    <h4>Issue Description</h4>
                    <p style="font-weight: 400; line-height: 1.5;"><%= desc %></p>
                </div>
            </div>

            <div class="info-row" style="border-bottom: none;">
                <div class="info-icon"><i class="fas fa-info-circle"></i></div>
                <div class="info-data">
                    <h4>Current Status</h4>
                    <div class="status-indicator <%= statusClass %>">
                        <%= status %>
                    </div>
                </div>
            </div>

        </div>

        <div class="card-footer">
            <a href="index.jsp" class="btn btn-home">← Back to Home</a>
            <button onclick="window.print()" class="btn btn-print"><i class="fas fa-print"></i> Print Receipt</button>
        </div>

        <% } else { %>

        <div class="error-state">
            <i class="fas fa-search-minus"></i>
            <h3>No Record Found</h3>
            <p>We couldn't find a complaint with ID: <strong><%= (id==null ? "" : id) %></strong></p>
            <br>
            <a href="index.jsp" class="btn btn-home">Try Again</a>
        </div>

        <% } %>

    </div>

</body>
</html>