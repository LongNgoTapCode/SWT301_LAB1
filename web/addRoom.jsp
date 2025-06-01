<%-- 
    Document   : addRoom
    Created on : Dec 10, 2024, 11:52:45 AM
    Author     : HP
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Room</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center">Add New Room</h1>
            <form action="roomManagementController?action=create" method="post">
                <div class="mb-3">
                    <label for="roomNumber" class="form-label">Room Number</label>
                    <input type="text" name="roomNumber" id="roomNumber" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="roomType" class="form-label">Room Type</label>
                    <input type="text" name="roomType" id="roomType" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="capacity" class="form-label">Capacity</label>
                    <input type="number" name="capacity" id="capacity" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" step="0.01" name="price" id="price" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Status</label>
                    <select name="status" id="status" class="form-select" required>
                        <option value="available">Available</option>
                        <option value="booked">Booked</option>
                        <option value="maintenance">Maintenance</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="img" class="form-label">Image URL</label>
                    <input type="text" name="img" id="img" class="form-control">
                </div>
                <div class="text-end">
                    <button type="submit" class="btn btn-success">Add Room</button>
                    <a href="roomManagementController?action=list" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </body>
</html>

