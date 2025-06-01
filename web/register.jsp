<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>??ng Ký</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .register-container {
            width: 100%;
            max-width: 400px;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .register-container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #3498db;
        }
        .register-container form {
            display: flex;
            flex-direction: column;
        }
        .register-container input[type="text"],
        .register-container input[type="password"],
        .register-container input[type="email"] {
            padding: 10px;
            font-size: 16px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
        }
        .register-container input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: 0.3s;
        }
        .register-container input[type="submit"]:hover {
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
    <div class="register-container">
        <h1>??ng Ký</h1>
        <form action="register" method="post">
            <input type="text" name="username" placeholder="Tên Đăng Nhập" required>
            <input type="password" name="password" placeholder="Mật Khẩu" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="fullName" placeholder="Họ và tên" required>
            <input type="submit" value="Đăng Ký">
        </form>
    </div>
</body>
</html>
