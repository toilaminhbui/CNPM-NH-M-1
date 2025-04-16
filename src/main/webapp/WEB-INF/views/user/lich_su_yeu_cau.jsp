<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
	<title>Lịch sử yêu cầu</title>
	<div class="container-fluid p-3">
    <h2 style="color:#f6621c; margin-bottom: 20px;">Gửi Yêu Cầu</h2>
    <form action="/Tinhtiendien/nguoi_dung/lich_su_yeu_cau/gui" method="POST">
        <div class="mb-3">
            <label for="tittle" class="form-label">Tựa đề</label>
            <input type="text" class="form-control" id="tittle" name="tittle" required>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">Nội dung</label>
            <textarea class="form-control" id="content" rows="6" name="content" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary float-end">Gửi</button>
    </form>
    
    <%-- Hiển thị thông báo --%>
    <%
    String mess = (String) session.getAttribute("message");
    Boolean isError = (Boolean) session.getAttribute("isError");

    if (mess != null && !isError) {
    %>
    <div id="successMessage" class="alert alert-success mt-3" role="alert"><%= mess %></div>
    <script>
        setTimeout(function() {
            document.getElementById("successMessage").style.display = "none";
        }, 3000);
    </script>
    <%
        session.removeAttribute("message");
        session.removeAttribute("isError");
    } else if (mess != null && isError) {
    %>
    <div id="errorMessage" class="alert alert-danger mt-3" role="alert"><%= mess %></div>
    <script>
        setTimeout(function() {
            document.getElementById("errorMessage").style.display = "none";
        }, 3000);
    </script>
    <%
        session.removeAttribute("message");
        session.removeAttribute("isError");
    }
    %>
    
    <%-- Bảng lịch sử yêu cầu --%>
    <div class="mt-4">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 style="color:#f6621c; margin-bottom: 20px;">Lịch sử yêu cầu</h2>
        </div>
        
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Ngày gửi</th>
                        <th>Giờ gửi</th>
                        <th>Tựa đề</th>
                        <th>Nội dung</th>
                        <th>Trạng Thái</th>
                        <th>Chi tiết</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lsyc" items="${listYeuCau}">
                    <tr>
                        <td><fmt:formatDate value="${lsyc.ngay_gui}" pattern="dd-MM-yyyy"/></td>
                        <td>${lsyc.gio_gui}</td>
                        <td>${lsyc.tua_de}</td>
                        <td>${lsyc.noi_dung_rut_gon}</td>
                        <td>${lsyc.trang_thai}</td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm btn-view" 
                                    data-bs-toggle="modal" data-bs-target="#viewModal"
                                    data-tittle="${lsyc.tua_de}"
                                    data-content="${lsyc.noi_dung}">
                                <i class="bi bi-info-circle-fill"></i> Xem
                            </button>
                        </td>
                        
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%-- Modal Xem chi tiết --%>
<div class="modal fade" id="viewModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xem chi tiết yêu cầu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Tựa đề</label>
                    <input type="text" class="form-control" id="viewTittle" readonly>
                </div>
                <div class="mb-3">
                    <label class="form-label">Nội dung</label>
                    <textarea class="form-control" id="viewContent" rows="6" readonly></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<%-- Modal Sửa --%>
<div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Chỉnh sửa yêu cầu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/Tinhtiendien/nguoi_dung/lich_su_yeu_cau/sua" method="POST">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="editTittle" class="form-label">Tựa đề</label>
                        <input type="text" class="form-control" id="editTittle" name="tittle" required>
                    </div>
                    <div class="mb-3">
                        <label for="editContent" class="form-label">Nội dung</label>
                        <textarea class="form-control" id="editContent" rows="6" name="content" required></textarea>
                    </div>
                    <input type="hidden" id="editId" name="yeucau_id">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%-- Modal Xóa --%>
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thu hồi yêu cầu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc muốn thu hồi yêu cầu này không?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <form action="/Tinhtiendien/nguoi_dung/lich_su_yeu_cau/xoa" method="POST">
                    <input type="hidden" id="deleteId" name="yeucau_id">
                    <button type="submit" class="btn btn-danger">Thu hồi</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
// Xử lý modal xem chi tiết
document.querySelectorAll('.btn-view').forEach(button => {
    button.addEventListener('click', () => {
        document.getElementById('viewTittle').value = button.dataset.tittle;
        document.getElementById('viewContent').value = button.dataset.content;
    });
});

// Xử lý modal sửa
document.querySelectorAll('.btn-edit').forEach(button => {
    button.addEventListener('click', () => {
        document.getElementById('editId').value = button.dataset.id;
        document.getElementById('editTittle').value = button.dataset.tittle;
        document.getElementById('editContent').value = button.dataset.content;
    });
});

// Xử lý modal xóa
document.querySelectorAll('.btn-delete').forEach(button => {
    button.addEventListener('click', () => {
        document.getElementById('deleteId').value = button.dataset.id;
    });
});
</script>