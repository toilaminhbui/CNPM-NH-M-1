<%@page import="com.Tinhtiendien.Models.ChiTietHoaDon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid p-3">
    <h2 class="text-orange mb-4">Quản lý tài khoản</h2>
    
    <!-- Customer Information Section -->
    <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
            <p class="fw-bold">Họ và tên:</p>
            <p>${info_khachhang.hovaten}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Mã khách hàng:</p>
            <p>${info_khachhang.khachhang_id}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Số điện thoại:</p>
            <p>${info_khachhang.sdt}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Mã đồng hồ điện:</p>
            <p>${ma_dongho}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Căn cước công dân:</p>
            <p>${info_khachhang.cccd}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Username:</p>
            <p>${info_khachhang.username}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Email:</p>
            <p>${info_khachhang.email}</p>
        </div>
        <div class="col-6 col-md-3">
            <p class="fw-bold">Địa chỉ:</p>
            <p>${info_khachhang.diachi}</p>
        </div>
    </div>

    <!-- Change Password Section -->
    <div class="row mt-5">
        <div class="col-lg-9">
            <h4 class="text-orange mb-3">Thay đổi mật khẩu</h4>
            <form action="quan_ly_tai_khoan" method="POST">
                <div class="mb-3">
                    <label class="form-label">Mật khẩu cũ</label>
                    <input type="password" name="oldpassword" class="form-control" placeholder="Nhập mật khẩu cũ" required>
                    <div class="text-danger">${oldpassmessage}</div>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Mật khẩu mới</label>
                    <input type="password" name="newpassword" class="form-control" placeholder="Nhập mật khẩu mới" required>
                    <div class="text-danger">${newpassmessage}</div>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Nhập lại mật khẩu mới</label>
                    <input type="password" name="renewpassword" class="form-control" placeholder="Nhập lại mật khẩu mới" required>
                    <div class="text-danger">${renewpassmessage}</div>
                </div>
                
                <p class="text-muted">Mật khẩu bao gồm tối thiểu 06 ký tự, có ít nhất một chữ in hoa (A-Z), một chữ in thường (a-z), một chữ số (0-9) và một ký tự đặc biệt (#?.!@$%^&*-). Ví dụ: Matkhau@123</p>
                
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </form>
            <%
						// Lấy giá trị của biến passwordChanged từ model
						Boolean passwordChanged = (Boolean) request.getAttribute("passwordChanged");
						// Kiểm tra xem biến passwordChanged có tồn tại và có giá trị true không
						if (passwordChanged != null && passwordChanged) {
						%>
            
            
                <div id="successMessage" class="alert alert-success mt-3" role="alert">
                    Mật khẩu đã được cập nhật thành công!
                </div>
                <script>
                    setTimeout(function() {
                        document.getElementById("successMessage").style.display = "none";
                    }, 3000);
                </script>
           <%}%>
        </div>
    </div>
</div>
						