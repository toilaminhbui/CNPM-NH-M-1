<%@page import="com.Tinhtiendien.Models.ChiTietHoaDon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>Tra cứu hóa đơn</title>
<%-- 	<%@include file="/WEB-INF/views/layouts/user/navbar2.jsp" %>	 --%>
<%-- 	<%@include file="/WEB-INF/views/layouts/user/sidebar2.jsp" %> --%>
<div class="container-fluid p-3">
    <!-- Customer Info Section -->
    <div class="mb-4">
        <h2 class="text-orange mb-3">Thông tin khách hàng</h2>
        <div class="bg-white p-3 shadow">
            <div class="row g-3">
                <div class="col-6 col-md-3">
                    <p><strong>Họ và tên:</strong></p>
                    <p>${info_khachhang.hovaten}</p>
                </div>
                <div class="col-6 col-md-3">
                    <p><strong>Mã khách hàng:</strong></p>
                    <p>${info_khachhang.khachhang_id}</p>
                </div>
                <div class="col-6 col-md-3">
                    <p><strong>Số điện thoại:</strong></p>
                    <p>${info_khachhang.sdt}</p>
                </div>
                <div class="col-6 col-md-3">
                    <p><strong>Mã đồng hồ:</strong></p>
                    <p>${dongho_id}</p>
                </div>
                <div class="col-6 col-md-3">
                    <p><strong>Căn cước công dân:</strong></p>
                    <p>${info_khachhang.cccd}</p>
                </div>
                <div class="col-6 col-md-3">
                    <p><strong>Địa chỉ:</strong></p>
                    <p>${info_khachhang.diachi}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bill Lookup Section -->
    <h2 class="text-orange mb-3">Tra cứu hóa đơn</h2>
    
    <form method="POST" class="mb-4">
        <div class="row g-3 align-items-end">
            <div class="col-6 col-md-2">
            <label for="monthYearPicker" class="form-label">Chọn tháng & năm</label>
            <input type="text" class="form-control" name="monthAndYear" id="monthYearPicker" placeholder="MM/YYYY">
                <%-- <label class="form-label">Tháng</label>
                <select class="form-select" name="month">
                    <c:forEach var="i" begin="1" end="12">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select> --%>
				
            </div>
           <!--  <div class="col-6 col-md-2"> -->
                <%-- <label class="form-label">Năm</label>
                <select class="form-select" name="year">
                    <c:forEach var="i" begin="${nam_dangky}" end="2024">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select> --%>
           <!--  </div> -->
            <div class="col-12 col-md-2">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </div>
    </form>
    
    <!-- Bill Table -->
    <div class="table-responsive">
        <table class="table table-hover bg-white shadow">
            <thead class="table-light">
                <tr>
                    <th>Mã hóa đơn</th>
                    <th>Mã khách hàng</th>
                    <th>Loại hóa đơn</th>
                    <th>Từ ngày</th>
                    <th>Đến ngày</th>
                    <th>Số tiền</th>
                    <th>Tiền thuế</th>
                    <th>Tổng tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty hoadon.hoadon_id}">
                        <tr>
                            <td>${hoadon.hoadon_id}</td>
                            <td>${hoadon.khachhang_id}</td>
                            <td>${hoadon.loai_hoadon}</td>
                            <td>${hoadon.ngay_batdau}</td>
                            <td>${hoadon.ngay_ketthuc}</td>
                            <td><fmt:formatNumber value="${hoadon.so_tien}" pattern="#,###"/></td>
                            <td><fmt:formatNumber value="${hoadon.tien_thue}" pattern="#,###"/></td>
                            <td><fmt:formatNumber value="${hoadon.tong_tien}" pattern="#,###"/></td>
                        </tr>
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

<script>
  $('#monthYearPicker').datepicker({
    format: "mm/yyyy",
    startView: "months",
    minViewMode: "months",
    autoclose: true,
    language: 'vi'
  });
</script>
