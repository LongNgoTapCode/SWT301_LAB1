<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Kiếm Phòng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            text-align: center;
            background-color: #3498db;
            padding: 20px;
            color: white;
        }

        nav {
            background-color: #2c3e50;
            padding: 10px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        nav ul li a:hover {
            background-color: #1abc9c;
            color: #ffffff;
        }

        .search-container {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 40px;
        }

        .search-container input[type="text"] {
            width: 80%;
            padding: 12px;
            font-size: 16px;
            border: 2px solid #3498db;
            border-radius: 4px;
            outline: none;
            transition: 0.3s;
        }

        .search-container input[type="text"]:focus {
            border-color: #2980b9;
            box-shadow: 0 0 8px rgba(41, 128, 185, 0.6);
        }

        .search-container input[type="submit"] {
            padding: 12px 20px;
            font-size: 16px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: 0.3s;
        }

        .search-container input[type="submit"]:hover {
            background-color: #2980b9;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 10px;
            text-align: center;
        }

        table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table th {
            background-color: #3498db;
            color: white;
        }

        .btn-book {
            display: inline-block;
            padding: 8px 16px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: 0.3s;
        }

        .btn-book:hover {
            background-color: #27ae60;
        }

        .message {
            text-align: center;
            color: red;
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Tìm Kiếm Phòng</h1>
    </header>

    <nav>
        <ul>
            <li><a href="home.jsp">Trang Chủ</a></li>
            <li><a href="roomController">Phòng</a></li>
            <li><a href="<%= request.getContextPath() %>/BookingHistoryController">Lịch Sử Đặt Phòng</a></li>
            <li><a href="about.jsp">Giới Thiệu</a></li>
            <li><a href="contact.jsp">Liên Hệ</a></li>
            <li><a href="<%= request.getContextPath() %>/logout" class="login-btn">Đăng xuất</a></li>
        </ul>
    </nav>

    <!-- Form tìm kiếm -->
    <div class="search-container">
        <form action="roomController" method="post">
            <input type="text" name="search" id="search" placeholder="Nhập tên phòng hoặc loại phòng">
            <input type="submit" value="Tìm Kiếm">
        </form>
    </div>

    <!-- Hiển thị danh sách phòng -->
    <c:choose>
        <c:when test="${empty room}">
            <p class="message">Không tìm thấy phòng nào phù hợp với từ khóa: "${searchQuery}"</p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>Tên Phòng</th>
                        <th>Hình Ảnh</th>
                        <th>Loại Phòng</th>
                        <th>Giá</th>
                        <th>Đặt Phòng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${room}" var="item">
                        <tr>
                            <td>${item.getRoomId()}</td>
                            <td><img src="${item.getImg()}" alt="Room Image" width="150" height="150"></td>
                            <td>${item.getRoomType()}</td>
                            <td class="price">${item.getPrice()} VND/đêm</td>
                            <td>
                                <a href="booking.jsp?room_id=${item.getRoomId()}" class="btn-book">Đặt Phòng</a>
                            </td>
                         
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>
