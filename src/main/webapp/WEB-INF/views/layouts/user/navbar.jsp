<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
  <a class="navbar-brand ps-3 d-flex align-items-center" href="/Tinhtiendien">
    <img src="https://media.baobinhphuoc.com.vn/upload/news/7_2023/111_16184204072023.png" alt="EVN Logo" style="height: 60px">
  </a>

  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>

  <ul class="navbar-nav ms-auto me-3">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fas fa-user fa-fw"></i>
      </a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        
        <li class="px-3 py-1">
          <small class="text-muted">Họ và tên</small><br>
          <span class="fw-semibold text-dark">${info_khachhang.hovaten}</span>
        </li>

        <li class="px-3 py-1">
          <small class="text-muted">Mã khách hàng</small><br>
          <span class="fw-semibold text-dark">${info_khachhang.khachhang_id}</span>
        </li>

        <li class="px-3 py-1">
          <small class="text-muted">Địa chỉ</small><br>
          <span class="fw-semibold text-dark">${info_khachhang.diachi}</span>
        </li>

        <li class="px-3 py-1">
          <small class="text-muted">Email</small><br>
          <span class="fw-semibold text-dark">${info_khachhang.email}</span>
        </li>

        <li class="px-3 py-1">
          <small class="text-muted">Số điện thoại</small><br>
          <span class="fw-semibold text-dark">${info_khachhang.sdt}</span>
        </li>

        <li><hr class="dropdown-divider" /></li>

        <li class="text-center">
          <form action="../logout">
            <button type="submit" class="dropdown-item logout-button">
              <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
            </button>
          </form>
        </li>
        
      </ul>
    </li>
  </ul>
</nav>
 
