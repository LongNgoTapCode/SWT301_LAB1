<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng Nhập</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .login-container {
                width: 100%;
                max-width: 400px;
                margin: 100px auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .login-container h1 {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px;
                color: #3498db;
            }

            .login-container form {
                display: flex;
                flex-direction: column;
            }

            .login-container input[type="text"],
            .login-container input[type="password"] {
                padding: 10px;
                font-size: 16px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                outline: none;
            }

            .login-container input[type="submit"] {
                padding: 10px;
                font-size: 16px;
                background-color: #3498db;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: 0.3s;
            }

            .login-container input[type="submit"]:hover {
                background-color: #2980b9;
            }

            .error-message {
                color: red;
                font-size: 14px;
                text-align: center;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h1>Đăng Nhập</h1>
            <c:if test="${not empty errorMessage}">
                <p class="error-message">${errorMessage}</p>
            </c:if>
            <form action="login" method="post">
                <input type="text" name="username" placeholder="Tên đăng nhập" required>
                <input type="password" name="password" placeholder="Mật khẩu" required>
                <input type="submit" value="Đăng Nhập">
            </form>
            <p style="text-align: center;">Chưa có tài khoản? <a href="register.jsp">Đăng Ký</a></p>
            <c:if test="${not empty param.success}">
                <p style="color: green; text-align: center;">${param.success}</p>
            </c:if>
            <c:if test="${not empty param.error}">
                <p style="color: red; text-align: center;">${param.error}</p>
            </c:if>
        </div>
    </body>
</html>
