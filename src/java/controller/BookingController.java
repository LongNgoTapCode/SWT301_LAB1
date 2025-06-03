/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Dell
 */
public class BookingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        String roomId = request.getParameter("room_id");
        String checkInDate = request.getParameter("check_in_date");
        String checkOutDate = request.getParameter("check_out_date");
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String specialRequests = request.getParameter("special_requests");

        // Kiểm tra ngày hợp lệ
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate today = LocalDate.now();
        LocalDate checkIn = LocalDate.parse(checkInDate, formatter);
        LocalDate checkOut = LocalDate.parse(checkOutDate, formatter);

        if (today.isAfter(checkIn) || checkIn.isAfter(checkOut)) {
//          if(today.compareTo(checkIn) < 0 || checkIn.compareTo(checkOut) < 0){

            request.setAttribute("errorMessage", "Vui lòng chọn ngày Check-in và Check-out hợp lệ.");
            request.setAttribute("fullname", fullName);
            request.setAttribute("email", email);
            request.setAttribute("phoneNumber", phoneNumber);
            request.setAttribute("specialRequests", specialRequests);
          
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            return;
        }

        // Lưu thông tin vào database
        DAO dao = new DAO();
        boolean success = false;
        try {
            int userId = Integer.parseInt(user.getUserId());
            success = dao.addBooking(roomId, checkInDate, checkOutDate, fullName, email, phoneNumber, specialRequests, userId);
        } catch (Exception ex) {
            Logger.getLogger(BookingController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Logger.getLogger(BookingController.class.getName()).log(Level.INFO, "Booking success status: {0}", success);

        if (success) {
            response.sendRedirect("roomController?action=success");
        } else {
            request.setAttribute("errorMessage", "Đặt phòng thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
