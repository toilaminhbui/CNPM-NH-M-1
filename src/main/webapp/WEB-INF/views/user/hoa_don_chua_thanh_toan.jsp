<%@page import="com.Tinhtiendien.Models.ChiTietHoaDon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Hóa đơn chưa thanh toán</title>
<div class="container-fluid p-3">
	<!-- Alert Messages -->
	<c:if test="${not empty message}">
		<div class="alert ${isError ? 'alert-danger' : 'alert-success'} mt-3"
			role="alert">${message}</div>
		<script>
            setTimeout(() => document.querySelector('.alert').style.display = 'none', 3000);
        </script>
	</c:if>

	<h2 class="text-orange mb-3">Thông tin hóa đơn chưa thanh toán</h2>

	<div class="table-responsive">
		<table class="table table-hover bg-white shadow">
			<thead class="table-light">
				<tr>
					<th>Mã hóa đơn</th>
					<th>Tháng</th>
					<th>Năm</th>
					<th>Chỉ số cũ</th>
					<th>Chỉ số mới</th>
					<th>Kwh tiêu thụ</th>
					<th>Thành tiền</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list_hoadon}">
						<c:forEach var="hoadon" items="${list_hoadon}">
							<tr>
								<td>${hoadon.hoadon_id}</td>
								<td>${hoadon.month_bill}</td>
								<td>${hoadon.year_bill}</td>
								<td>${hoadon.chiso_cu}</td>
								<td>${hoadon.chiso_moi}</td>
								<td>${hoadon.dien_tieu_thu}</td>
								<td><fmt:formatNumber value="${hoadon.tong_tien}"
										pattern="#,###" /></td>
								<td>
									<!-- Nút xem trong bảng -->
									<button id="viewInvoiceBtn" type="button"
										class="btn btn-info btn-sm" data-bs-toggle="modal"
										data-bs-target="#viewInvoiceModal"
										data-hoadon-id="${hoadon.hoadon_id}"
										data-month="${hoadon.month_bill}"
										data-year="${hoadon.year_bill}"
										data-old-index="${hoadon.chiso_cu}"
										data-new-index="${hoadon.chiso_moi}"
										data-consumption="${hoadon.dien_tieu_thu}"
										data-so-tien="${hoadon.so_tien}"
										data-tien-thue="${hoadon.tien_thue}"
										data-thue="${hoadon.thue}"
										data-tong-tien="${hoadon.tong_tien}">
										<i class="bi bi-eye-fill"></i> Xem
									</button> <%--  <button type="button" class="btn btn-primary btn-sm btn-thanhtoan" 
                                        data-bs-toggle="modal" data-bs-target="paymentModal"
                                        data-hoadon-id="${hoadon.hoadon_id}">
                                        <i class="bi bi-pencil-fill"></i> Thanh toán
                                    </button> --%>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="text-center py-4">
								<div class="d-flex flex-column align-items-center">
									<%@include file="/WEB-INF/resource/assets/imgs/nodata.svg"%>
									<p class="mt-2">Không có dữ liệu</p>
								</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>

<!-- Payment Modal -->
<!-- <div class="modal fade" id="paymentModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thanh Toán</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="paymentForm" action="/Tinhtiendien/nguoi_dung/thong_tin_hoa_don_chua_thanh_toan/thanh_toan" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Phương thức</label>
                        <div class="d-flex gap-2">
                            <button type="button" class="btn btn-outline-primary flex-grow-1" onclick="setPaymentMethod(2)">
                                Ngân Hàng
                            </button>
                            <button type="button" class="btn btn-outline-danger flex-grow-1" onclick="setPaymentMethod(3)">
                                Ví Điện Tử
                            </button>
                        </div>
                    </div>
                    <input type="hidden" name="phuong_thuc" value="">
                    <input type="hidden" name="hoadon_id" value="">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div> -->

<!-- Modal Xem Hóa Đơn -->
<div class="modal fade" id="viewInvoiceModal" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-primary text-white">
				<h5 class="modal-title">
					<i class="fas fa-file-invoice me-2"></i>Chi Tiết Hóa Đơn
				</h5>
				<button type="button" class="btn-close btn-close-white"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<!-- Thông tin chung -->
					<div class="row mb-2">
						<div class="col-md-6">
							<div class="card h-100">
								<div class="card-header bg-light">
									<h6 class="mb-0">
										<i class="fas fa-info-circle me-2"></i>Thông Tin Chung
									</h6>
								</div>
								<div class="card-body">
									<div class="row mb-2">
										<div class="col-6 fw-bold">Mã hóa đơn:</div>
										<div class="col-6" id="modalHoadonId"></div>
									</div>
									<div class="row mb-2">
										<div class="col-6 fw-bold">Kỳ thanh toán:</div>
										<div class="col-6" id="modalPeriod"></div>
									</div>
									<div class="row">
										<div class="col-6 fw-bold">Trạng thái:</div>
										<div class="col-6">
											<span class="badge bg-warning text-dark">Chưa thanh
												toán</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card h-100">
								<div class="card-header bg-light">
									<h6 class="mb-0">
										<i class="fas fa-calculator me-2"></i>Chỉ Số Điện
									</h6>
								</div>
								<div class="card-body">
									<div class="row mb-2">
										<div class="col-6 fw-bold">Chỉ số cũ:</div>
										<div class="col-6" id="modalOldIndex"></div>
									</div>
									<div class="row mb-2">
										<div class="col-6 fw-bold">Chỉ số mới:</div>
										<div class="col-6" id="modalNewIndex"></div>
									</div>
									<div class="row">
										<div class="col-6 fw-bold">Điện tiêu thụ:</div>
										<div class="col-6" id="modalConsumption"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Chi tiết thanh toán -->
					<div class="card mb-2">
						<div class="card-header bg-light">
							<h6 class="mb-0">
								<i class="fas fa-money-bill-wave me-2"></i>Chi Tiết Thanh Toán
							</h6>
						</div>
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table table-bordered mb-0">
									<thead class="table-light">
										<tr>
											<th>Mô tả</th>
											<th>Thành tiền</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Tiền điện sinh hoạt</td>
											<td><p id="modalSoTien"></p></td>
										</tr>
										<tr>
											<td>Thuế VAT (<span id="ptthue"></span>%)</td>
											<td><p id="modalTienThue"></p></td>
										</tr>
										<tr>
											<td class="fw-bold">Tổng cộng</td>
											<td class="fw-bold"><p id="modalTongTien"></p></td>
										</tr>
										<!-- Dữ liệu sẽ được thêm bằng JS -->
									</tbody>
								</table>
							</div>
						</div>

						<!-- Thông tin chuyển khoản và QR code -->
						<div class="row mt-2">
							<div class="col-md-6">
								<div class="card h-100">
									<div class="card-header bg-light">
										<h6 class="mb-0">
											<i class="fas fa-university me-2"></i>Thông Tin Chuyển Khoản
										</h6>
									</div>
									<div class="card-body">
										<div class="row mb-2">
											<div class="col-12 fw-bold">
												Ngân hàng: <span class="fw-normal">Vietcombank</span>
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-12 fw-bold">
												Tên tài khoản: <span class="fw-normal">CÔNG TY ĐIỆN
													LỰC MIỀN NAM</span>
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-12 fw-bold">
												Số tài khoản: <span class="fw-normal">1234567890123</span>
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-12 fw-bold">
												Nội dung CK: <span class="fw-normal">MHD<span
													id="makhck"></span> Thanh toán tiền điện
												</span>
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<small class="text-muted">Vui lòng ghi đúng nội dung
													chuyển khoản</small>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card h-100">
									<div class="card-header bg-light">
										<h6 class="mb-0">
											<i class="fas fa-qrcode me-2"></i>Thanh Toán QR Code
										</h6>
									</div>
									<div class="card-body text-center">
										<!-- Placeholder cho QR code - thay bằng QR code thực tế -->
										<div class="mb-3" id="qrCodePlaceholder"
											style="width: 200px; height: 200px; margin: 0 auto; background-color: #f8f9fa; display: flex; align-items: center; justify-content: center;">
											<img style="width: 100%"
												src="https://img.upanh.tv/2025/04/10/qrcodeba573db20e061031.png"
												alt="qrcode.png" border="0">

										</div>
										<p class="mb-1">Quét mã để thanh toán</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">
					<i class="fas fa-times me-1"></i> Đóng
				</button>
			</div>
		</div>
	</div>
</div>




<script>
//Xử lý khi click vào nút xem hóa đơn
document.getElementById('viewInvoiceBtn').addEventListener('click', function() {
    // Lấy dữ liệu từ data attributes của nút
    var button = this;
    var hoadonId = button.getAttribute('data-hoadon-id');
    var month = button.getAttribute('data-month');
    var year = button.getAttribute('data-year');
    var oldIndex = button.getAttribute('data-old-index');
    var newIndex = button.getAttribute('data-new-index');
    var consumption = button.getAttribute('data-consumption');
    var soTien = button.getAttribute('data-so-tien');
    var tienThue = button.getAttribute('data-tien-thue');
    var tongTien = button.getAttribute('data-tong-tien');
    var thue = button.getAttribute('data-thue');
    
    console.log('Dữ liệu hóa đơn:', {
        consumption: consumption,
        soTien: soTien,
        tienThue: formatCurrency(tienThue) + ' VND',
        tongTien: tongTien
    });
    
    // Điền dữ liệu vào modal
    document.getElementById('modalHoadonId').textContent = hoadonId;
    document.getElementById('makhck').textContent = hoadonId;
    document.getElementById('modalPeriod').textContent = 'Tháng ' + month + '/' + year;
    document.getElementById('modalOldIndex').textContent = oldIndex + ' kWh';
    document.getElementById('modalNewIndex').textContent = newIndex + ' kWh';
    document.getElementById('modalConsumption').textContent = consumption + ' kWh';
    document.getElementById('modalSoTien').textContent = formatCurrency(soTien) + ' VND';
    document.getElementById('modalTienThue').textContent = formatCurrency(tienThue) + ' VND';
    document.getElementById('modalTongTien').textContent = formatCurrency(tongTien) + ' VND';
    document.getElementById('ptthue').textContent = thue;
    
});

// Hàm định dạng tiền tệ
function formatCurrency(amount) {
    return parseInt(amount).toLocaleString('vi-VN');
}

// Xử lý nút in hóa đơn
document.getElementById('printInvoiceBtn').addEventListener('click', function() {
    window.print();
});
</script>