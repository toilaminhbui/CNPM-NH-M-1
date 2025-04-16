<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><decorator:title/></title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/css/bootstrap-datepicker.min.css">


<link rel="stylesheet" href="<c:url value='/resources/styles.css'/>">

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.vi.min.js"></script>


</head>

<style>

</style>
<body class="sb-nav-fixed">
	<%@include file="/WEB-INF/views/layouts/user/navbar.jsp" %>	
	<div id="layoutSidenav">
		<%@include file="/WEB-INF/views/layouts/user/sidebar.jsp" %>
		 <div id="layoutSidenav_content">
			 <main>
				 <div class="container-fluid px-4 py-4">
				 	<decorator:body/>
				 </div>
			 </main>
              <footer class="py-2 bg-light mt-auto">
                  <div class="container-fluid px-4">
                      <div class="d-flex align-items-center justify-content-between small">
                          <div class="text-muted">Copyright &copy; Nhóm 1 - 2025</div>
                      </div>
                  </div>
              </footer>		
		 </div>
		
			
	</div>		
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/scripts.js'/>"></script>
</html>