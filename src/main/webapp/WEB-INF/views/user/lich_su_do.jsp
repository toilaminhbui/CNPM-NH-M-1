<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<title>Lịch sử đo</title>
<div class="container-fluid p-3">
	<h3 class="text-orange mb-3">Tìm lịch sử đo</h3>

	<div class="row g-3 mb-4">
		<div class="col-12">
			<form action="/Tinhtiendien/nguoi_dung/lich_su_do/tim_kiem"
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
						<a href="/Tinhtiendien/nguoi_dung/lich_su_do"
							class="btn btn-secondary flex-grow-1 flex-md-grow-0"> <i
							class="bi bi-list-ul d-md-none me-1"></i> Tất Cả
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<h2 class="text-orange mb-3">Lịch sử đo</h2>

	<div class="table-responsive">
		<table class="table table-hover bg-white shadow">
			<thead class="table-light">
				<tr>
					<th>STT</th>
					<th>Mã đồng hồ</th>
					<th>Ngày đo</th>
					<th>Chỉ số</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty listLSDo}">
						<c:forEach var="LSDo" items="${listLSDo}" varStatus="status">
							<tr>
								<td>${status.index+1}</td>
								<td>${LSDo.dongho_id}</td>
								<td><fmt:formatDate value="${LSDo.ngay_do}"
										pattern="dd-MM-yyyy" /></td>
								<td>${LSDo.chiso}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="text-center py-4">
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
<script>
	$('#monthYearPicker').datepicker({
		format : "mm/yyyy",
		startView : "months",
		minViewMode : "months",
		autoclose : true,
		language : 'vi'
	});
</script>
