<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Room Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Room Management</h1>
            <div class="text-end mb-3">
                <a href="addRoom.jsp" class="btn btn-primary">Add New Room</a>
            </div>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Room Number</th>
                        <th>Type</th>
                        <th>Capacity</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="room" items="${rooms}">
                        <tr>
                            <td>${room.roomId}</td>
                            <td>${room.roomNumber}</td>
                            <td>${room.roomType}</td>
                            <td>${room.capacity}</td>
                            <td>${room.price}</td>
                            <td>${room.status}</td>
                            <td>
                                <img src="${room.img}" alt="Room Image" style="width: 100px; height: 100px;">
                            </td>
                            <td>
                                <a href="roomManagementController?action=edit&roomId=${room.roomId}" class="btn btn-warning btn-sm">Edit</a>
                                <form action="roomManagementController?action=delete" method="post" class="d-inline">
                                    <input type="hidden" name="roomId" value="${room.roomId}">
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                                <form action="roomManagementController" method="post">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <select name="status">
                                        <option value="available" ${room.status == 'available' ? 'selected' : ''}>Available</option>
                                        <option value="booked" ${room.status == 'booked' ? 'selected' : ''}>Booked</option>
                                        <option value="pending" ${room.status == 'pending' ? 'selected' : ''}>Pending</option>
                                    </select>
                                    <input type="hidden" name="room_id" value="${room.roomId}">
                                    <button type="submit">Cập nhật</button>
                                </form>


                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="total-revenue">
            Tổng Doanh Thu: ${totalRevenue}
        </div>
    </body>
</html>
