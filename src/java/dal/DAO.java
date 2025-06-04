/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.Booking;
import model.Revenue;
import model.Room;
import model.User;

/**
 *
 * @author Dell
 */
public class DAO extends DBContext {

    PreparedStatement stm;
    ResultSet rs;

    public ArrayList<Room> getRoom() {
        ArrayList<Room> room = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM rooms";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String roomId = String.valueOf(rs.getInt(1));
                String roomNumber = String.valueOf(rs.getInt(2));
                String roomType = rs.getString(3);
                String capacity = String.valueOf(rs.getInt(4));
                String price = String.valueOf(rs.getDouble(5));
                String status = rs.getString(6);
                String img = rs.getString(9);
                Room r = new Room(roomId, roomNumber, roomType, capacity, price, status, img);
                room.add(r);
            }
        } catch (Exception e) {
            System.out.println("get all Room" + e.getMessage());
        }

        return room;
    }

    public ArrayList<User> getUser() {
        ArrayList<User> user = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM users";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String userId = String.valueOf(rs.getInt(1));
                String userName = rs.getString(2);
                String password = rs.getString(3);
                String role = rs.getString(4);
                String email = rs.getString(5);
                String fullName = rs.getString(6);
                User u = new User(userId, userName, password, role, email, fullName);
                user.add(u);
            }
        } catch (Exception e) {
            System.out.println("Get all user: " + e.getMessage());
        }
        return user;
    }

    public ArrayList<Revenue> getRevenue() {
        ArrayList<Revenue> revenue = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM revenues";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String revenueId = String.valueOf(rs.getInt(1));
                String roomId = String.valueOf(rs.getInt(2));
                String bookingId = String.valueOf(rs.getInt(3));
                String amount = String.valueOf(rs.getDouble(4));
                String revenueDate = rs.getString(5);
                Revenue r = new Revenue(revenueId, roomId, bookingId, amount, revenueDate);
                revenue.add(r);
            }

        } catch (Exception e) {
            System.out.println("get all revenue: " + e.getMessage());
        }
        return revenue;
    }

    public ArrayList<Booking> getBooking() {
        ArrayList<Booking> booking = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM bookings";
            stm = connection.prepareStatement(strSQL);
            rs = stm.executeQuery();
            while (rs.next()) {
                String bookingId = String.valueOf(rs.getInt(1));
                String userId = String.valueOf(rs.getInt(2));
                String roomId = String.valueOf(rs.getInt(3));
                String checkInDate = rs.getString(4);
                String checkOutDate = rs.getString(5);
                String bookingStatus = rs.getString(6);
                Booking b = new Booking(bookingId, userId, roomId, checkInDate, checkOutDate, bookingStatus);
                booking.add(b);
            }
        } catch (Exception e) {
            System.out.println("Get All Booking: " + e.getMessage());
        }

        return booking;
    }

    public ArrayList<Room> SearchRoom(String searchQuery) {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            String strSQL = "SELECT * FROM rooms WHERE room_id LIKE ? OR room_type LIKE ?";
            PreparedStatement stm = connection.prepareStatement(strSQL);
            String searchPattern = "%" + searchQuery + "%";
            stm.setString(1, searchPattern);
            stm.setString(2, searchPattern);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Room room = new Room(
                        rs.getString("room_id"),
                        rs.getString("room_number"),
                        rs.getString("room_type"),
                        rs.getString("capacity"),
                        rs.getString("price"),
                        rs.getString("status"),
                        rs.getString("img")
                );
                rooms.add(room);
            }
            System.out.println("Found " + rooms.size() + " rooms");
        } catch (Exception e) {
            System.out.println("Room: " + e.getMessage());
        }
        return rooms;
    }

    public User validateUser(String username, String password) {
        User user = null;
        try {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user = new User(
                        String.valueOf(rs.getInt("user_id")),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getString("email"),
                        rs.getString("full_name")
                );

            }
        } catch (Exception e) {
            System.out.println("Error validating user: " + e.getMessage());
        }
        return user;
    }

    public boolean registerUser(String username, String password, String email, String fullName) {
        try {
            String sql = "INSERT INTO users (username, password, role, email, full_name) VALUES (?, ?, 'customer', ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.setString(3, email);
            stm.setString(4, fullName);
            stm.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error registering user: " + e.getMessage());
        }
        System.out.println("User registered successfully with username: " + username);

        return false;

    }

    public boolean addBooking(String roomId, String checkInDate, String checkOutDate, String fullName,
                          String email, String phoneNumber, String specialRequests, int userId) throws SQLException {

    return getConnection() != null
            && addBooking(getConnection(), roomId, checkInDate, checkOutDate, userId) > 0
            && addBookingDetail(getConnection(), fullName, email, phoneNumber, specialRequests,
                addBooking(getConnection(), roomId, checkInDate, checkOutDate, userId))
            && updateStatus(getConnection(), roomId);
}


    public boolean cancelBooking(String bookingId) {
        String query = "UPDATE bookings SET booking_status = 'canceled' WHERE booking_id = ?";
        String roomUpdateQuery = "UPDATE rooms SET status = 'available' WHERE room_id = (SELECT room_id FROM bookings WHERE booking_id = ?)";

        try (Connection conn = getConnection(); PreparedStatement ps1 = conn.prepareStatement(query); PreparedStatement ps2 = conn.prepareStatement(roomUpdateQuery)) {

            ps1.setString(1, bookingId);
            ps2.setString(1, bookingId);

            ps1.executeUpdate();
            ps2.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getBookingId(Connection conn) throws SQLException {
        int bookingId = 0;
        try (PreparedStatement psGetBookingId = conn.prepareStatement("SELECT SCOPE_IDENTITY() AS booking_id"); // Lấy booking_id vừa chèn
            ResultSet rs = psGetBookingId.executeQuery();){
            

            if (rs.next()) {
                bookingId = rs.getInt("booking_id");
            }
        } catch (Exception e) {
            System.out.println("Error in addBooking: " + e.getMessage());
        } finally {
            conn.close();
        }
        return bookingId;
    }

    private int addBooking(Connection conn, String roomId, String checkInDate, String checkOutDate, int userId) throws SQLException {
        int generatedId = -1; // Giá trị mặc định nếu không thể tạo booking
        String bookingQuery = "INSERT INTO bookings (user_id, room_id, check_in_date, check_out_date, booking_status) VALUES (?, ?, ?, ?, 'pending')";
        try (PreparedStatement psBooking = conn.prepareStatement(bookingQuery, Statement.RETURN_GENERATED_KEYS)) {
            // Thêm thông tin vào bảng `bookings`
            psBooking.setInt(1, userId);
            psBooking.setString(2, roomId);
            psBooking.setString(3, checkInDate);
            psBooking.setString(4, checkOutDate);
            int affectedRows = psBooking.executeUpdate();

            // Lấy ID vừa được tạo
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = psBooking.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedId = generatedKeys.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error in addBooking: " + e.getMessage());
        }
        return generatedId;
    }

    private boolean addBookingDetail(Connection conn, String fullName, String email, String phoneNumber, String specialRequests, int bookId) throws SQLException {
        try {
            String detailsQuery = "INSERT INTO booking_details (booking_id, full_name, email, phone_number, special_requests) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement psDetails = conn.prepareStatement(detailsQuery);
            // Thêm thông tin vào bảng `booking_details`
            psDetails.setInt(1, bookId);
            psDetails.setString(2, fullName);
            psDetails.setString(3, email);
            psDetails.setString(4, phoneNumber);
            psDetails.setString(5, specialRequests);
            psDetails.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error in addBooking: " + e.getMessage());
        }
        return false;
    }

    private boolean updateStatus(Connection conn, String roomId) throws SQLException {
        try {
            String updateRoomStatusQuery = "UPDATE rooms SET status = 'booked' WHERE room_id = ?";
            PreparedStatement psUpdateRoom = conn.prepareStatement(updateRoomStatusQuery);
            // Cập nhật trạng thái phòng thành 'pending'
            psUpdateRoom.setString(1, roomId);
            psUpdateRoom.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error in addBooking: " + e.getMessage());

        }
        return false;
    }

    public boolean updateRoomStatus(String roomId, String newStatus) {
        String query = "UPDATE rooms SET status = ? WHERE room_id = ?";
        try (PreparedStatement stm = connection.prepareStatement(query)) {
            stm.setString(1, newStatus);
            stm.setString(2, roomId);
            stm.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addRoom(Room room) {
        String query = "INSERT INTO rooms (room_number, room_type, capacity, price, status, img) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setString(3, room.getCapacity());
            ps.setString(4, room.getPrice());
            ps.setString(5, room.getStatus());
            ps.setString(6, room.getImg());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateRoom(Room room) {
        String query = "UPDATE rooms SET room_number = ?, room_type = ?, capacity = ?, price = ?, status = ?, img = ?, updated_at = GETDATE() WHERE room_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setString(3, room.getCapacity());
            ps.setString(4, room.getPrice());
            ps.setString(5, room.getStatus());
            ps.setString(6, room.getImg());
            ps.setString(7, room.getRoomId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteRoom(int roomId) {
        String query = "DELETE FROM rooms WHERE room_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Room getRoomById(int roomId) {
        String query = "SELECT * FROM rooms WHERE room_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Room room = new Room();
                room.setRoomId(rs.getInt("room_id") + "");
                room.setRoomNumber(rs.getString("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity") + "");
                room.setPrice(rs.getDouble("price") + "");
                room.setStatus(rs.getString("status"));
                room.setImg(rs.getString("img"));
                return room;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT user_id, username, email, full_name, role FROM users";
        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id") + "");
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("full_name"));
                user.setRole(rs.getString("role"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean updateUserStatus(int userId, String status) {
        String sql = "UPDATE users SET status = ? WHERE user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUserRole(int userId, String role) {
        String sql = "UPDATE users SET role = ? WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, role);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public double getTotalRevenue() {
        double totalRevenue = 0;
        try {
            String sql = "SELECT SUM(amount) AS total FROM revenues";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalRevenue = rs.getDouble("total");
            }
        } catch (Exception e) {
            System.out.println("Error fetching total revenue: " + e.getMessage());
        }
        return totalRevenue;
    }

    public List<Booking> getBookingHistoryByUser(String userId) {
        List<Booking> bookings = new ArrayList<>();
        try {
            // Modified the SQL query to filter by userId as well
            String sql = "SELECT * FROM bookings WHERE user_id = ? AND booking_status = 'pending'";
            PreparedStatement stm = connection.prepareStatement(sql);

            // Set the userId value in the query
            stm.setString(1, userId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getString("booking_id"),
                        rs.getString("user_id"),
                        rs.getString("room_id"),
                        rs.getString("check_in_date"),
                        rs.getString("check_out_date"),
                        rs.getString("booking_status")
                );
                bookings.add(booking);
            }

        } catch (SQLException e) {
            System.out.println("Error fetching booking history: " + e.getMessage());
        }
        return bookings;
    }

}
