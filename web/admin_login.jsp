<%-- 
    Document   : admin_login
    Created on : 1 Dec 2025, 11:34:44?am
    Author     : aksha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Portal | Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #4ca1af 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            margin: 0;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 50px 40px;
            border-radius: 15px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
            width: 350px;
            text-align: center;
        }

        .login-header { margin-bottom: 30px; }
        .login-header h2 { color: #333; font-weight: 600; margin: 10px 0; }
        .login-header i { font-size: 50px; color: #2c3e50; }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 14px;
            color: #888;
        }

        .input-field {
            width: 100%;
            padding: 12px 15px 12px 45px; /* Padding left for icon */
            border: 2px solid #eee;
            border-radius: 25px;
            outline: none;
            box-sizing: border-box;
            transition: 0.3s;
            font-size: 14px;
        }

        .input-field:focus {
            border-color: #4ca1af;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            border: none;
            background: #2c3e50;
            color: white;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 10px;
        }

        .btn-login:hover {
            background: #4ca1af;
            transform: scale(1.05);
        }

        .back-link {
            display: block;
            margin-top: 20px;
            color: #888;
            text-decoration: none;
            font-size: 13px;
        }
        .back-link:hover { color: #333; text-decoration: underline; }
    </style>
</head>
<body>

    <div class="login-card">
        <div class="login-header">
            <i class="fas fa-user-circle"></i>
            <h2>Admin Login</h2>
        </div>
        
        <form action="admin_dashboard.jsp" method="post">
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="user" class="input-field" placeholder="Username" required>
            </div>

            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="pass" class="input-field" placeholder="Password" required>
            </div>

            <button type="submit" class="btn-login">SECURE LOGIN</button>
        </form>

        <a href="index.jsp" class="back-link">← Back to Student Portal</a>
    </div>

</body>
</html>