<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đặt Phòng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }
            .booking-container {
                width: 100%;
                max-width: 500px;
                margin: 50px auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #3498db;
            }
            input, textarea, select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            input[type="submit"] {
                background-color: #3498db;
                color: white;
                border: none;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #2980b9;
            }
            .error-message {
                color: red;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="booking-container">
            <h1>Đặt Phòng</h1>
            <c:if test="${errorMessage ne null}">
                <p class="error-message">${errorMessage}</p>
            </c:if>
            <form action="bookingController" method="post">
                <label for="full_name">Họ và tên:</label>
                <input type="text" id="full_name" name="full_name" required value="<%= request.getAttribute("fullname")!= null ? request.getAttribute("fullname") : "" %>" >

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required value="<%= request.getAttribute("email") != null ? request.getAttribute("email"): "" %>" >

                <label for="phone_number">Số điện thoại:</label>
                <input type="text" id="phone_number" name="phone_number" required value="<%= request.getAttribute("phoneNumber") != null ? request.getAttribute("phoneNumber"): "" %>" >

                <label for="check_in_date">Ngày Check-in:</label>
                <input type="date" id="check_in_date" name="check_in_date" required>

                <label for="check_out_date">Ngày Check-out:</label>
                <input type="date" id="check_out_date" name="check_out_date" required>

                <label for="special_requests">Yêu cầu đặc biệt:</label>
                <textarea id="special_requests" name="special_requests"></textarea>

                <input type="hidden" name="room_id" value="${param.room_id}">

                <input  type="submit" value="Đặt Phòng">
            </form>
        </div>
    </body>
</html>
