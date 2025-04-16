<%@page import="com.Tinhtiendien.Models.ChiTietHoaDon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Lịch sử thanh toán</title>
<%-- 	<%@include file="/WEB-INF/views/layouts/user/navbar.jsp" %>	 --%>
<%-- 	<%@include file="/WEB-INF/views/layouts/user/sidebar.jsp" %> --%>
<div class="container-fluid p-3">
	<h2 class="text-orange mb-3">Tìm lịch sử thanh toán</h2>
	
	
	<div class="row g-3 mb-4">
		<div class="col-12">
			<form action="/Tinhtiendien/nguoi_dung/lich_su_thanh_toan/tim_kiem"
				method="GET" class="row align-items-end">
				<!-- Ô input - chiếm toàn bộ width trên mobile, 1 phần trên desktop -->
				<div class="col-md-3 col-12 mb-2 mb-md-0">
					<label for="monthYearPicker" class="form-label">Chọn tháng
						& năm</label> <input type="text" class="form-control" name="monthAndYear"
						id="monthYearPicker" placeholder="MM/YYYY">
				</div>

				<!-- Nhóm nút - luôn nằm ngang nhưng xuống dòng trên mobile -->
				<div class="col-md-6 col-12">
					<div class="d-flex flex-wrap gap-2">
						<!-- Nút tìm kiếm -->
						<button type="submit"
							class="btn btn-primary flex-grow-1 flex-md-grow-0">
							<i class="bi bi-search d-md-none me-1"></i> Tìm kiếm
						</button>

						<!-- Nút tất cả -->
						<a href="/Tinhtiendien/nguoi_dung/thong_tin_hoa_don"
							class="btn btn-secondary flex-grow-1 flex-md-grow-0"> <i
							class="bi bi-list-ul d-md-none me-1"></i> Tất Cả
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>

	<h2 class="text-orange mb-3">Lịch sử thanh toán</h2>

	<div class="table-responsive">
		<table class="table table-hover bg-white shadow">
			<thead class="table-light">
				<tr>
					<th>Tháng</th>
					<th>Năm</th>
					<th>Tiền thanh toán</th>
					<th>Ngày thanh toán</th>
					<th>Phương thức thanh toán</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lstt" items="${list_lstt}">
					<tr>
						<td>${lstt.month_bill}</td>
						<td>${lstt.year_bill}</td>
						<td><fmt:formatNumber value="${lstt.tong_tien}"
								pattern="#,###" /></td>
						<td>${lstt.ngay_thanhtoan}</td>
						<td>${lstt.ten_phuongthuc}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	$('#monthYearPicker').datepicker({
		format : "mm/yyyy",
		startView : "months",
		minViewMode : "months",
		autoclose : true,
		language : 'vi'
	});
</script>
