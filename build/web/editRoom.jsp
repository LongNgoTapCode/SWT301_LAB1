<%-- 
    Document   : editRoom
    Created on : Dec 10, 2024, 11:53:03 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Room</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Edit Room</h1>
            <form action="roomManagementController?action=update" method="post">
                <input type="hidden" name="roomId" value="${room.roomId}">
                <div class="mb-3">
                    <label for="roomNumber" class="form-label">Room Number</label>
                    <input type="text" name="roomNumber" id="roomNumber" class="form-control" value="${room.roomNumber}" required>
                </div>
                <div class="mb-3">
                    <label for="roomType" class="form-label">Room Type</label>
                    <input type="text" name="roomType" id="roomType" class="form-control" value="${room.roomType}" required>
                </div>
                <div class="mb-3">
                    <label for="capacity" class="form-label">Capacity</label>
                    <input type="number" name="capacity" id="capacity" class="form-control" value="${room.capacity}" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" step="0.01" name="price" id="price" class="form-control" value="${room.price}" required>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select name="status" id="status" class="form-select" required>
                        <option value="available" ${room.status == 'available' ? 'selected' : ''}>Available</option>
                        <option value="booked" ${room.status == 'booked' ? 'selected' : ''}>Booked</option>
                        <option value="maintenance" ${room.status == 'maintenance' ? 'selected' : ''}>Maintenance</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="img" class="form-label">Image URL</label>
                    <input type="text" name="img" id="img" class="form-control" value="${room.img}">
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-success">Update Room</button>
                    <a href="roomManagementController?action=list" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </body>
</html>
