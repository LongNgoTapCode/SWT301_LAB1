<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: #3498db;
            padding: 10px 0;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            padding: 0;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }

        nav ul li a:hover {
            text-decoration: underline;
        }

        .dashboard-container {
            padding: 20px;
        }

        .dashboard-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #2c3e50;
        }

        .dashboard-section {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

        .dashboard-card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 30%;
        }

        .dashboard-card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: #3498db;
        }

        .dashboard-card p {
            font-size: 14px;
            color: #7f8c8d;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1></h1>
    </header>

    <nav>
        <ul>
            <li><a href="dashBoard.jsp">Dashboard</a></li>
           
            <li><a href="<%= request.getContextPath() %>/logout">Đăng Xuất</a></li>
        </ul>
    </nav>

    <div class="dashboard-container">
        <h2 class="dashboard-title">Chào Mừng Đến Với Trang Quản Trị</h2>

        <div class="dashboard-section">
            <div class="dashboard-card">
                <h3>Phòng</h3>
                <p>Quản lý danh sách và trạng thái phòng.</p>
                <a href="roomManagementController">Xem Chi Tiết</a>
            </div>

            <div class="dashboard-card">
                <h3>Đặt Phòng</h3>
                <p>Kiểm tra và quản lý các đơn đặt phòng.</p>
                <a href="bookingManagement.jsp">Xem Chi Tiết</a>
            </div>

            <div class="dashboard-card">
                <h3>Người Dùng</h3>
                <p>Quản lý tài khoản và thông tin người dùng.</p>
                <a href="ManageUserController">Xem Chi Tiết</a>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Quản Lý Khách Sạn. Tất cả quyền được bảo lưu.</p>
    </footer>
</body>
</html>
