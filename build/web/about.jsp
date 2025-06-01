<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<a href="about.jsp"></a>
    <title>Giới Thiệu - Khách Sạn ABC</title>

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

        .about-content {
            padding: 40px 20px;
            text-align: center;
        }

        .about-content h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .about-content p {
            font-size: 18px;
            color: #7f8c8d;
            line-height: 1.6;
            max-width: 900px;
            margin: 0 auto;
        }

        .about-images {
            margin-top: 40px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .about-images img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 300px;
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
        <h1>Khách Sạn Tomtototom</h1>
        <p>Chúng tôi cam kết mang đến trải nghiệm nghỉ dưỡng tuyệt vời cho bạn</p>
    </header>

    <!-- Navigation -->
    <nav>
        <ul>
            <li><a href="home.jsp">Trang Chủ</a></li>
            <li><a href="room.jsp">Phòng</a></li>
            <li><a href="booking.jsp">Đặt Phòng</a></li>
            <li><a href="about.jsp">Giới Thiệu</a></li>
            <li><a href="contact.jsp">Liên Hệ</a></li>
        </ul>
    </nav>

    <!-- About Content -->
    <section class="about-content">
        <h2>Giới Thiệu Về Khách Sạn Tomtotototom</h2>
        <p>
            Khách Sạn Tomtototom được thành lập với mục tiêu mang lại một không gian nghỉ dưỡng thoải mái, sang trọng cho khách hàng.
            Với đội ngũ nhân viên nhiệt tình, chuyên nghiệp và các phòng nghỉ tiện nghi, chúng tôi tự hào là một trong những địa chỉ 
            đáng tin cậy tại thành phố ABC. Chúng tôi cam kết đem đến dịch vụ tốt nhất và trải nghiệm tuyệt vời cho mỗi khách hàng.
        </p>

        <!-- Hình ảnh giới thiệu khách sạn -->
        <div class="about-images">
            <img src="images/exterior.jpg" alt="Khách sạn ABC">
            <img src="images/1.jpg" alt="Phòng nghỉ khách sạn">
            <img src="images/2.jpg" alt="Khuôn viên khách sạn">
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Khách Sạn Tomtototom. Tất cả quyền lợi được bảo lưu.</p>
    </footer>
</body>
</html>
