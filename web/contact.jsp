<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - Khách Sạn ABC</title>

    <!-- CSS viết trực tiếp trong JSP -->
    <style>
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

        header {
            background-color: #2980b9;
            padding: 20px 0;
            text-align: center;
            color: white;
        }

        header h1 {
            font-size: 40px;
            margin-bottom: 10px;
        }

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

        .contact-content {
            padding: 40px 20px;
            text-align: center;
        }

        .contact-content h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .contact-form {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .contact-form input, .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .contact-form button {
            background-color: #2980b9;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #3498db;
        }

        footer {
            background-color: #2980b9;
            color: white;
            text-align: center;
            padding: 20px 0;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <h1>Khách Sạn ABC</h1>
        <p>Chúng tôi luôn sẵn sàng hỗ trợ bạn</p>
    </header>

    <!-- Navigation -->
    <nav>
        <ul>
            <li><a href="index.jsp">Trang Chủ</a></li>
            <li><a href="room.jsp">Phòng</a></li>
            <li><a href="booking.jsp">Đặt Phòng</a></li>
            <li><a href="about.jsp">Giới Thiệu</a></li>
            <li><a href="contact.jsp">Liên Hệ</a></li>
        </ul>
    </nav>

    <!-- Contact Content -->
    <section class="contact-content">
        <h2>Liên Hệ Với Chúng Tôi</h2>
        <div class="contact-form">
            <form action="submit_contact.jsp" method="post">
                <input type="text" name="name" placeholder="Họ và Tên" required>
                <input type="email" name="email" placeholder="Email" required>
                <textarea name="message" placeholder="Lời nhắn" rows="5" required></textarea>
                <button type="submit">Gửi</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Khách Sạn ABC. Tất cả quyền lợi được bảo lưu.</p>
    </footer>
</body>
</html>
