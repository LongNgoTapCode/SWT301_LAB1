package controller;

import dal.DAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import model.Room;

public class RoomManagementController extends HttpServlet {

    private DAO roomDAO;

    @Override
    public void init() throws ServletException {
        roomDAO = new DAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                ArrayList<Room> rooms = roomDAO.getRoom();
                request.setAttribute("rooms", rooms);
                request.getRequestDispatcher("roomManagement.jsp").forward(request, response);
                break;
            case "edit":
                int roomId = Integer.parseInt(request.getParameter("roomId"));
                Room room = roomDAO.getRoomById(roomId);
                request.setAttribute("room", room);
                request.getRequestDispatcher("editRoom.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("roomManagementController?action=list");
        }

        DAO dao = new DAO();

        // Lấy tổng doanh thu
        double totalRevenue = dao.getTotalRevenue();

        // Gửi tổng doanh thu đến JSP
        request.setAttribute("totalRevenue", totalRevenue);

        // Chuyển tiếp đến trang RoomManagement.jsp
        request.getRequestDispatcher("RoomManagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("update")) {
            Room room = new Room();
            room.setRoomId(request.getParameter("roomId"));
            room.setRoomNumber(request.getParameter("roomNumber"));
            room.setRoomType(request.getParameter("roomType"));
            room.setCapacity(request.getParameter("capacity"));
            room.setPrice(request.getParameter("price"));
            room.setStatus(request.getParameter("status"));
            room.setImg(request.getParameter("img"));
            roomDAO.updateRoom(room);
        } else if (action.equals("delete")) {
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            roomDAO.deleteRoom(roomId);
        } else if (action.equals("create")) {
            Room room = new Room();
            room.setRoomNumber(request.getParameter("roomNumber"));
            room.setRoomType(request.getParameter("roomType"));
            room.setCapacity(request.getParameter("capacity"));
            room.setPrice(request.getParameter("price"));
            room.setStatus(request.getParameter("status"));
            room.setImg(request.getParameter("img"));
            roomDAO.addRoom(room);
        } else if (action.equals("updateStatus")) {
            roomDAO.updateRoomStatus(request.getParameter("room_id"), request.getParameter("status"));
        }
        response.sendRedirect("roomManagementController?action=list");
    }
}
