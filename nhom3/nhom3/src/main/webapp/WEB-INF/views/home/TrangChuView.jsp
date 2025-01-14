﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="<c:url value="/resources/css/fontawesome-free-5.13.0-web/css/all.css"/>"
	rel='stylesheet' type='text/css' />
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"
	rel='stylesheet' type='text/css' />
<link href="<c:url value="/resources/css/bootstrap.css"/>"
	rel='stylesheet' type='text/css' />
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link href="<c:url value="/resources/css/css.css"/>" rel='stylesheet'
	type='text/css' />
<title>Thế giới xe điện</title>
</head>

<body>
	<input type="hidden" value="${tk.tenTaiKhoan }" name="tenTaiKhoan">
	<c:set var="tentk" value="${tk.tenTaiKhoan }" scope="session"></c:set>
	<div class="container-fluid">
		<!-- _header.jsp  -->
		<div>
			<jsp:include page="../include/_header.jsp"></jsp:include>
		</div>
	</div>
	<div class="header_nav_main section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<!-- Menu -->
					<div>
						<jsp:include page="../include/_menu.jsp"></jsp:include>
					</div>
				</div>
			</div>
			<div class="col-xl-12 col-lg-12">
				<div class="row">
					<c:forEach items="${listDanhMuc }" var="dm">
						<div class="title-modules">
							<h2 class="title_h2">
								<a href="#">${dm.tenDanhMuc }</a>
							</h2>
						</div>
						<c:forEach items="${listSanPham }" var="sp">
							<c:if test="${dm.maDanhMuc == sp.maDanhMuc  }">
								<div class="col-xl-4 clo-lg-4" style="text-align: center;">
									<form action="/nhom3/home/dathang" method="POST">
										<img style="width:340px; height: 403px;" src="${sp.urlHinh}" class="img-responsive"
											style="width: 100%">
										<p class="text-danger">${sp.tenSanPham }</p>
										<span class="product_price"> <fmt:setLocale
															value="vi_VN" /> <fmt:formatNumber value="${sp.donGia}"
															type="currency" />
													</span>
										
										<p>
											<input type="hidden" name="maSanPham" value="${sp.maSanPham}">
											<input type="hidden" name="tenSanPham" value="${sp.tenSanPham}"> 
											<input type="hidden" name="urlHinh" value="${sp.urlHinh}" >
											 <input type="hidden" name="donGia" value="${sp.donGia}">
											 <input type="hidden" name="soLuong" value="1"> 
											<input type="hidden" name="action" value="add">
										</p>
										<p>
											<a
												href="<c:url value="/home/xemthongtinsanpham?maSanPham=${sp.maSanPham}"/>"><input
												type="button" class="btn btn-primary" value="Xem hàng" />
												</a> <input
												type="submit" class="btn btn-primary" value="Mua hàng" />
										</p>
									</form>
								</div>

							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- _footer.jsp -->
	<div>
		<jsp:include page="../include/_footer.jsp"></jsp:include>
	</div>

</body>

</html>