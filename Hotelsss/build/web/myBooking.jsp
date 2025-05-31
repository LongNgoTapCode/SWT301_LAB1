<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh Sách Đặt Phòng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }
            th {
                background-color: #3498db;
                color: white;
            }
            .cancel-btn {
                background-color: #e74c3c;
                color: white;
                padding: 8px 12px;
                border: none;
                cursor: pointer;
                border-radius: 4px;
            }
            .cancel-btn:hover {
                background-color: #c0392b;
            }
            .message {
                text-align: center;
                color: red;
            }
        </style>
    </head>
    <body>
        <h1 style="text-align: center; color: #3498db;">Danh Sách Đặt Phòng</h1>
    <c:if test="${not empty errorMessage}">
        <p class="message">${errorMessage}</p>
    </c:if>
    <c:if test="${empty bookings}">
        <p class="message">Bạn chưa có đặt phòng nào.</p>
    </c:if>
    <c:if test="${not empty bookings}">
        <table>
            <thead>
                <tr>
                    <th>Mã Đặt Phòng</th>
                    <th>Phòng</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Trạng Thái</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${bookings}" var="booking">
                <tr>
                    <td>${booking.getBookingId()}</td>
                    <td>${booking.getRoomId()}</td>
                    <td>${booking.getCheckInDate()}</td>
                    <td>${booking.getCheckOutDate()}</td>
                    <td>${booking.getBookingStatus()}</td>
                    <td>
                <c:if test="${booking.getBookingStatus() == 'pending'}">
                    <form action="CancelBookingController" method="post">
                        <input type="hidden" name="booking_id" value="${booking.getBookingId()}">
                        <button type="submit" class="cancel-btn">Hủy Phòng</button>
                    </form>
                </c:if>
                </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
