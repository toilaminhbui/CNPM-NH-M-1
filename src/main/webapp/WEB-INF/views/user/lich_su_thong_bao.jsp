<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<title>Lịch sử thông báo</title>
<div class="container-fluid p-3">
    <h2 class="text-orange mb-3">Lịch sử thông báo</h2>
    
    <div class="table-responsive">
        <table class="table table-hover bg-white shadow">
            <thead class="table-light">
                <tr>
                    <th>STT</th>
                    <th>Ngày gửi</th>
                    <th>Nội dung</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty list_thongbao}">
                        <c:forEach var="thongbao" items="${list_thongbao}" varStatus="status">
                            <tr>
                                <td>${status.index+1}</td>
                                <td>${thongbao.ngay_gui}</td>
                                <td>${thongbao.noi_dung}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" class="text-center py-4">
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