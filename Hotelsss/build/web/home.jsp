<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Khách Sạn</title>

        <!-- CSS viết trực tiếp trong JSP -->
        <style>
            /* Reset default styles */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Arial', sans-serif;
                background-color: #f9f9f9;
                color: #333;
            }

            h1, h2, h3 {
                color: #2c3e50;
            }

            /* Header */
            header {
                background-color: #2980b9;
                padding: 20px 0;
                color: white;
                text-align: center;
            }

            header h1 {
                font-size: 40px;
                margin-bottom: 10px;
            }

            header p {
                font-size: 18px;
                font-weight: 300;
            }

            /* Navigation Menu */
            nav {
                background-color: #3498db;
                padding: 10px 0;
            }

            nav ul {
                list-style: none;
                text-align: center;
            }

            nav ul li {
                display: inline-block;
                margin: 0 20px;
            }

            nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                font-weight: 500;
            }

            nav ul li a:hover {
                text-decoration: underline;
            }

            /* Main content */
            main {
                padding: 40px 20px;
            }

            .welcome {
                text-align: center;
                margin-bottom: 40px;
                background-color: #ecf0f1;
                border-radius: 8px;
                padding: 30px;
            }

            .welcome h2 {
                font-size: 36px;
                margin-bottom: 15px;
            }

            .welcome p {
                font-size: 20px;
                color: #7f8c8d;
            }

            .service-container {
                display: flex;
                justify-content: space-around;
                margin-top: 40px;
            }

            .service-box {
                background-color: white;
                padding: 20px;
                text-align: center;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                width: 30%;
            }

            .service-box h3 {
                font-size: 24px;
                margin-bottom: 15px;
            }

            .service-box p {
                font-size: 16px;
                color: #7f8c8d;
            }

            /* Footer */
            footer {
                background-color: #2980b9;
                color: white;
                text-align: center;
                padding: 20px 0;
                position: relative;
                bottom: 0;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header>
            <h1>Khách Sạn Tomtototom</h1>

        </header>

        <!-- Navigation -->
        <nav>
            <ul>
                <li><a href="home.jsp">Trang Chủ</a></li>
                <li><a href="roomController">Phòng</a></li>
                <li><a href="<%= request.getContextPath() %>/BookingHistoryController">Lịch sử đặt phòng</a></li>
                <li><a href="about.jsp">Giới Thiệu</a></li>
                <li><a href="contact.jsp">Liên Hệ</a></li>
                <li><a href="<%= request.getContextPath() %>/logout" class="login-btn">Đăng xuất</a></li>
            </ul>
        </nav>

        <!-- Main content -->
        <main>
            <!-- Welcome Section -->
            <section class="welcome">
                <h2>Chào Mừng Bạn Đến Với Khách Sạn Tomtototom</h2>
                <p>Khách sạn của chúng tôi cung cấp các phòng nghỉ tiện nghi với dịch vụ chăm sóc khách hàng tuyệt vời. Hãy đặt phòng ngay hôm nay để có một kỳ nghỉ đáng nhớ!</p>
            </section>

            <!-- Services Section -->
            <section class="service-container">
                <div class="service-box">
                    <h3>Phòng Tiện Nghi</h3>
                    <p>Chúng tôi cung cấp các phòng nghỉ hiện đại với đầy đủ tiện nghi và thiết kế sang trọng.</p>
                </div>
                <div class="service-box">
                    <h3>Wi-Fi Miễn Phí</h3>
                    <p>Trải nghiệm tốc độ internet nhanh chóng với Wi-Fi miễn phí trong toàn bộ khuôn viên khách sạn.</p>
                </div>
                <div class="service-box">
                    <h3>Đưa Đón Sân Bay</h3>
                    <p>Dịch vụ đưa đón sân bay miễn phí giúp chuyến đi của bạn thêm thuận tiện và thoải mái.</p>
                </div>
            </section>
        </main>
        <form action="BookingHistoryController" method="get">
            <a href="BookingHistoryController" class="btn-history">Lịch Sử Đặt Phòng</a>
        </form>
        <!-- Footer -->
        <footer>
            <p>&copy; 2024 Khách Sạn Tomtototom. Tất cả quyền lợi được bảo lưu.</p>
        </footer>
    </body>
</html>
