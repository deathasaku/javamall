<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>404</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/assets/img/favicon.ico">
    
    <!-- CSS 
    ========================= -->
    <!--bootstrap min css-->
    <link rel="stylesheet" href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!--owl carousel min css-->
    <link rel="stylesheet" href="${ctx}/assets/css/owl.carousel.min.css">
    <!--slick min css-->
    <link rel="stylesheet" href="${ctx}/assets/css/slick.css">
    <!--magnific popup min css-->
    <link rel="stylesheet" href="${ctx}/assets/css/magnific-popup.css">
    <!--font awesome css-->
    <link rel="stylesheet" href="${ctx}/assets/css/font.awesome.css">
    <!--animate css-->
    <link rel="stylesheet" href="${ctx}/assets/css/animate.css">
    <!--jquery ui min css-->
    <link rel="stylesheet" href="${ctx}/assets/css/jquery-ui.min.css">
    <!--slinky menu css-->
    <link rel="stylesheet" href="${ctx}/assets/css/slinky.menu.css">
    <!--plugins css-->
    <link rel="stylesheet" href="${ctx}/assets/css/plugins.css">
    
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${ctx}/assets/css/style.css">
    
    <!--modernizr min js here-->
    <script src="${ctx}/assets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>

     <!--header area start-->
    
    <!--offcanvas menu area start-->
    <c:import url="header.jsp"></c:import>
    <!--header area end-->
    
     <!--error section area start-->
    <div class="error_section">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="error_form">
                        <h1>404</h1>
                        <h2>噢喔！！！頁面找不到。</h2>
                        <p>請重新開機<br> 或者不要來</p>
                        <form action="#">
                            <input placeholder="Search..." type="text">
                            <button type="submit"><i class="icon-search"></i></button>
                        </form>
                        <a href="index">回到首頁</a>
                    </div>
                </div>
            </div>
        </div>    
    </div>
    <!--error section area end--> 
    
     <!--brand area start-->
    <div class="brand_area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="brand_container owl-carousel">
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand1.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand2.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand3.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand4.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand5.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand6.png" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand2.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--brand area end-->
    
    <!--footer area start-->
    <c:import url="footer.jsp"></c:import>
    <!--footer area end-->

<!-- JS
============================================ -->
<!--jquery min js-->
<script src="${ctx}/assets/js/vendor/jquery-3.4.1.min.js"></script>
<!--popper min js-->
<script src="${ctx}/assets/js/popper.js"></script>
<!--bootstrap min js-->
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!--owl carousel min js-->
<script src="${ctx}/assets/js/owl.carousel.min.js"></script>
<!--slick min js-->
<script src="${ctx}/assets/js/slick.min.js"></script>
<!--magnific popup min js-->
<script src="${ctx}/assets/js/jquery.magnific-popup.min.js"></script>
<!--counterup min js-->
<script src="${ctx}/assets/js/jquery.counterup.min.js"></script>
<!--jquery countdown min js-->
<script src="${ctx}/assets/js/jquery.countdown.js"></script>
<!--jquery ui min js-->
<script src="${ctx}/assets/js/jquery.ui.js"></script>
<!--jquery elevatezoom min js-->
<script src="${ctx}/assets/js/jquery.elevatezoom.js"></script>
<!--isotope packaged min js-->
<script src="${ctx}/assets/js/isotope.pkgd.min.js"></script>
<!--slinky menu js-->
<script src="${ctx}/assets/js/slinky.menu.js"></script>
<!-- Plugins JS -->
<script src="${ctx}/assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="${ctx}/assets/js/main.js"></script>



</body>

</html>