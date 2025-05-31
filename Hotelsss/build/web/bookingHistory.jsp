<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Lịch Sử Đặt Phòng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .history-container {
                width: 90%;
                max-width: 1200px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            .history-container h1 {
                text-align: center;
                color: #3498db;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table th, table td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: center;
            }

            table th {
                background-color: #3498db;
                color: white;
            }

            table tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .no-history {
                text-align: center;
                margin: 20px 0;
                font-size: 18px;
                color: #888;
            }
        </style>
    </head>
    <body>
        <div class="history-container">
            <h1>Lịch Sử Đặt Phòng</h1>

            <!-- Kiểm tra danh sách đặt phòng -->
            <c:choose>
                <c:when test="${not empty by}">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Đặt Phòng</th>
                                <th>ID Phòng</th>
                                <th>Ngày Nhận Phòng</th>
                                <th>Ngày Trả Phòng</th>
                                <th>Trạng Thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${by}" var="bo">
                                <tr>
                                    <td>${bo.bookingId}</td>
                                    <td>${bo.roomId}</td>
                                    <td>${bo.checkInDate}</td>
                                    <td>${bo.checkOutDate}</td>
                                    <td>${bo.bookingStatus}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="no-history">Hiện tại bạn chưa có lịch sử đặt phòng nào.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>