<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--  -->
<div id="layoutSidenav_nav">
               <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                   <!-- Nội dung sidebar -->
                                     <div class="sb-sidenav-menu">
                       <div class="nav">
                           <div class="sb-sidenav-menu-heading">Chức năng</div>
                           <a class="nav-link" href="/Tinhtiendien/nguoi_dung/quan_ly_chung">
                               <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                               Quản lý chung
                           </a>
                           
                           <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                               <div class="sb-nav-link-icon"><i class="fas fa-receipt"></i></div>
                               Lịch sử hóa đơn
                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                           </a>
                           <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                               <nav class="sb-sidenav-menu-nested nav">
                                   <a class="nav-link" href="/Tinhtiendien/nguoi_dung/tra_cuu_hoa_don">Tra cứu hóa đơn</a>
                                   <a class="nav-link" href="/Tinhtiendien/nguoi_dung/thong_tin_hoa_don">Thông tin hóa đơn</a>
                                   <a class="nav-link" href="/Tinhtiendien/nguoi_dung/lich_su_thanh_toan">Lịch sử thanh toán</a>
                               </nav>
                           </div>


                           <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                               <div class="sb-nav-link-icon"><i class="fas fa-search"></i></div>
                               Tra cứu
                               <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                           </a>
                           <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                               <nav class="sb-sidenav-menu-nested nav">
                                   <a class="nav-link" href="/Tinhtiendien/nguoi_dung/thong_tin_hoa_don_chua_thanh_toan">Hóa đơn chưa thanh toán</a>
                                   <a class="nav-link" href="/Tinhtiendien/nguoi_dung/lich_su_do">Lịch sử đo</a>
                               </nav>
                           </div>
                       
                           <a class="nav-link" href="/Tinhtiendien/nguoi_dung/lich_su_thong_bao">
                               <div class="sb-nav-link-icon"><i class="fas fa-bell"></i></div>
                               Lịch sử thông báo
                           </a>
                           <a class="nav-link" href="/Tinhtiendien/nguoi_dung/lich_su_yeu_cau">
                               <div class="sb-nav-link-icon"><i class="fas fa-list-alt"></i></div>
                               Lịch sử yêu cầu
                           </a>
                           <a class="nav-link" href="/Tinhtiendien/nguoi_dung/quan_ly_tai_khoan">
                               <div class="sb-nav-link-icon"><i class="fas fa-user-shield"></i></div>
                               Quản lý tài khoản
                           </a>
                       </div>
                   </div>
               </nav>
           </div>
<!--  -->



