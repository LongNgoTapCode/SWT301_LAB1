<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản lý đơn đặt phòng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin: 20px 0;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        select, button {
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            background-color: #e74c3c;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h1>Quản lý đơn đặt phòng</h1>
    <table>
        <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Người đặt</th>
                <th>Phòng</th>
                <th>Check-in</th>
                <th>Check-out</th>
                <th>Trạng thái</th>
                <th>Cập nhật trạng thái</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="booking" items="${bookings}">
                <tr>
                    <td>${booking.bookingId}</td>
                    <td>${booking.userId}</td>
                    <td>${booking.roomId}</td>
                    <td>${booking.checkInDate}</td>
                    <td>${booking.checkOutDate}</td>
                    <td>${booking.bookingStatus}</td>
                    <td>
                        <form action="BookingManagementController" method="post">
                            <select name="status">
                                <option value="confirmed" ${booking.bookingStatus == 'confirmed' ? 'selected' : ''}>Confirmed</option>
                                <option value="canceled" ${booking.bookingStatus == 'canceled' ? 'selected' : ''}>Canceled</option>
                                <option value="pending" ${booking.bookingStatus == 'pending' ? 'selected' : ''}>Pending</option>
                            </select>
                            <input type="hidden" name="booking_id" value="${booking.bookingId}">
                            <button type="submit">Cập nhật</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
