<%-- 
    Document   : index
    Created on : 1 Dec 2025, 11:32:44 am
    Author     : aksha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Voice | Complaint Portal</title>
    <!-- Import Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Import Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Poppins', sans-serif; }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .main-container {
            background: white;
            width: 900px;
            height: 600px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            display: flex;
            overflow: hidden;
        }

        /* Left Side - Welcome Graphic */
        .left-panel {
            width: 40%;
            background: #fdfdfd;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            text-align: center;
            border-right: 1px solid #eee;
        }
        
        .left-panel h2 { color: #333; margin-bottom: 10px; font-weight: 600; }
        .left-panel p { color: #666; font-size: 14px; margin-bottom: 30px; }
        .icon-graphic { font-size: 80px; color: #764ba2; margin-bottom: 20px; }
        
        .admin-link {
            margin-top: auto;
            text-decoration: none;
            color: #764ba2;
            font-weight: 600;
            border: 2px solid #764ba2;
            padding: 10px 25px;
            border-radius: 50px;
            transition: 0.3s;
        }
        .admin-link:hover { background: #764ba2; color: white; }

        /* Right Side - Forms */
        .right-panel {
            width: 60%;
            padding: 40px;
            position: relative;
            background: white;
            overflow-y: auto; /* Allow scrolling if content is long */
        }

        h3 { color: #333; margin-bottom: 20px; font-weight: 600; }

        /* Form Styling */
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; color: #555; font-size: 13px; margin-bottom: 5px; font-weight: 500; }
        
        .input-field {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
            background: #f9f9f9;
        }
        
        .input-field:focus { border-color: #764ba2; background: #fff; box-shadow: 0 0 8px rgba(118, 75, 162, 0.1); }
        
        textarea.input-field { resize: none; height: 100px; }

        .btn-submit {
            width: 100%;
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }
        
        .btn-submit:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(118, 75, 162, 0.3); }

        /* Status Section Divider */
        .divider {
            margin: 30px 0;
            border-top: 1px dashed #ccc;
            position: relative;
        }
        .divider span {
            position: absolute;
            top: -12px;
            left: 50%;
            transform: translateX(-50%);
            background: white;
            padding: 0 10px;
            color: #888;
            font-size: 12px;
        }

        .status-form { display: flex; gap: 10px; }
        .btn-check { background: #333; color: white; border: none; border-radius: 8px; padding: 0 20px; cursor: pointer; }
    </style>
</head>
<body>

    <div class="main-container">
        <!-- Left Panel: Info & Admin Link -->
        <div class="left-panel">
            <i class="fas fa-university icon-graphic"></i>
            <h2>Campus Voice</h2>
            <p>We value your feedback. Submit your complaints or suggestions anonymously or openly to help us improve.</p>
            <a href="admin_login.jsp" class="admin-link"><i class="fas fa-user-shield"></i> Admin Access</a>
        </div>

        <!-- Right Panel: Submission Form -->
        <div class="right-panel">
            <h3>📝 Submit New Complaint</h3>
            <form action="submitAction.jsp" method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" class="input-field" placeholder="John Doe" required>
                </div>
                
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" class="input-field" placeholder="john@student.edu" required>
                </div>
                
                <div class="form-group">
                    <label>Description of Issue</label>
                    <textarea name="desc" class="input-field" placeholder="Please describe the issue in detail..." required></textarea>
                </div>

                <button type="submit" class="btn-submit">Submit Report</button>
            </form>

            <div class="divider"><span>OR</span></div>

            <!-- Mini Status Check Section -->
            <h3>🔍 Check Status</h3>
            <form action="checkStatus.jsp" method="get" class="status-form">
                <input type="text" name="cid" class="input-field" placeholder="Enter Complaint ID" required>
                <button type="submit" class="btn-check">Search</button>
            </form>
        </div>
    </div>

</body>
</html>