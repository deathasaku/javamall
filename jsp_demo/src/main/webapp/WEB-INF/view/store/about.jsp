<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>關於我們</title>
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
    <script src="${ctx}/store/${ctx}/assets/js/vendor/modernizr-3.7.1.min.js"></script>

</head>

<body>

    <!--header area start-->
      <c:import url="header.jsp"></c:import>
    
    <!--header area end-->

    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <h3>關於我們</h3>
                        <ul>
                            <li><a href="index">首頁</a></li>
                            <li>關於我們</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--about section area -->
    <section class="about_section"> 
       <div class="container">
            <div class="row">
                <div class="col-12">
                   <figure>
                        <div class="about_thumb">
                            <img src="${ctx}/assets/img/about/about1.jpg" alt="">
                        </div>
                        <figcaption class="about_content">
                            <h1>我們販售智慧型手機和配件，並且提供完善的服務。</h1>
                            <p>透過完善的銷售及服務網絡，提供大眾創新的產品與服務，推廣通訊和資訊科技應用，滿足客戶需求，創造社會大眾的福祉。</p>
                            <div class="about_signature">
                                <img src="${ctx}/assets/img/about/about-us-signature.png" alt="">
                            </div>
                        </figcaption>
                    </figure>
                </div>    
            </div>  
        </div> 
    </section>
    <!--about section end-->

    <!--chose us area start-->
    <div class="choseus_area" data-bgimg="${ctx}/assets/img/about/about-us-policy-bg.jpg">
        <div class="container">   
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="single_chose">
                        <div class="chose_icone">
                            <img src="${ctx}/assets/img/about/About_icon4.png" alt="">
                        </div>
                        <div class="chose_content">
                            <h3>保證維修</h3>
                            <p>保證3年免費維修</p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_chose">
                        <div class="chose_icone">
                            <img src="${ctx}/assets/img/about/About_icon2.png" alt="">
                        </div>
                        <div class="chose_content">
                            <h3>100% 全額退款</h3>
                            <p>如對商品不滿意，7日內退貨將全額退費</p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_chose">
                        <div class="chose_icone">
                            <img src="${ctx}/assets/img/about/About_icon3.png" alt="">
                        </div>
                        <div class="chose_content">
                            <h3>24小時線上客服</h3>
                            <p>365日24小時全天線上客戶服務</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </div>

    <!--chose us area end-->      

    <!--services img area-->
    <div class="about_gallery_section"> 
        <div class="container">
           <div class="about_gallery_container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <article class="single_gallery_section">
                            <figure>
                                <div class="gallery_thumb">
                                    <img src="${ctx}/assets/img/about/about2.jpg" alt="">
                                </div>
                                <figcaption class="about_gallery_content">
                                   <h3>我們在做什麼?</h3>
                                    <p>經過我們的細心挑選，銷售全球不同品牌之手機和配件</p>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <article class="single_gallery_section">
                            <figure>
                                <div class="gallery_thumb">
                                    <img src="${ctx}/assets/img/about/about3.jpg" alt="">
                                </div>
                                <figcaption class="about_gallery_content">
                                   <h3>我們的任務</h3>
                                    <p>提供完善的支援服務</p>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <article class="single_gallery_section">
                            <figure>
                                <div class="gallery_thumb">
                                    <img src="${ctx}/assets/img/about/about4.jpg" alt="">
                                </div>
                                <figcaption class="about_gallery_content">
                                   <h3>我們的歷史</h3>
                                    <p>2019年創立於台北市</p>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                </div> 
            </div>
        </div>      
    </div>
    <!--services img end-->    

    <!--testimonial area start-->
    <div class="faq-client-say-area">
        <div class="container">   
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="faq-client_title">
                        <h2>可以為您做什麼?</h2>
                    </div>
                    <div class="faq-style-wrap" id="faq-five">
                        <!-- Panel-default -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5 class="panel-title">
                                    <a id="octagon" class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse1" aria-expanded="true" aria-controls="faq-collapse1"> <span class="button-faq"></span>快速免費送達</a>
                                </h5>
                            </div>
                            <div id="faq-collapse1" class="collapse show" aria-expanded="true" role="tabpanel" data-parent="#faq-five">
                                <div class="panel-body">
                                    <p>24小時送達</p>
                                    <p></p>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <!--// Panel-default -->

                        <!-- Panel-default -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse2" aria-expanded="false" aria-controls="faq-collapse2"> <span class="button-faq"></span>到府收送維修</a>
                                </h5>
                            </div>
                            <div id="faq-collapse2" class="collapse" aria-expanded="false" role="tabpanel" data-parent="#faq-five">
                                <div class="panel-body">
                                    <p></p>
                                    <p></p>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <!--// Panel-default -->

                        <!-- Panel-default -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse3" aria-expanded="false" aria-controls="faq-collapse3"> <span class="button-faq"></span>100% 正品</a>
                                </h5>
                            </div>
                            <div id="faq-collapse3" class="collapse" role="tabpanel" data-parent="#faq-five">
                                <div class="panel-body">
                                    <p></p>
                                    <p></p>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <!--// Panel-default -->

                        <!-- Panel-default -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h5 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-target="#faq-collapse4" aria-expanded="false" aria-controls="faq-collapse4"> <span class="button-faq"></span>最好的售後服務</a>
                                </h5>
                            </div>
                            <div id="faq-collapse4" class="collapse" role="tabpanel" data-parent="#faq-five">
                                <div class="panel-body">
                                    <p></p>
                                    <p></p>
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <!--// Panel-default -->
                    </div>

                </div>
                <div class="col-lg-6 col-md-6">
                    <!--testimonial area start-->
                    <div class="testimonial_area  testimonial_about">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <div class="section_title">
                                       <h2>客戶心得</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="testimonial_container">
                                <div class="row">
                                    <div class="testimonial_carousel owl-carousel">
                                        <div class="col-12">
                                            <div class="single-testimonial">
                                                <div class="testimonial-icon-img">
                                                    <img src="${ctx}/assets/img/about/testimonials-icon.png" alt="">
                                                </div>
                                                <div class="testimonial_content">
                                                    <p>“ 真的是太好買 <br>
                                                    太爽了吧 ”</p>
                                                    <div class="testimonial_text_img">
                                                        <a href="#"><img src="${ctx}/assets/img/about/testimonial1.png" alt=""></a>
                                                    </div>
                                                    <div class="testimonial_author">
                                                        <p><a href="#">Rebecka Filson</a> / <span>CEO of CSC</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="single-testimonial">
                                                <div class="testimonial-icon-img">
                                                    <img src="${ctx}/assets/img/about/testimonials-icon.png" alt="">
                                                </div>
                                                <div class="testimonial_content">
                                                    <p>“ 很好的購物體驗 <br>
                                                    我好正 ”</p>
                                                    <div class="testimonial_text_img">
                                                        <a href="#"><img src="${ctx}/assets/img/about/testimonial2.png" alt=""></a>
                                                    </div>
                                                    <div class="testimonial_author">
                                                        <p><a href="#">Amber Laha</a> / <span>CEO of DND</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="single-testimonial">
                                                <div class="testimonial-icon-img">
                                                    <img src="${ctx}/assets/img/about/testimonials-icon.png" alt="">
                                                </div>
                                                <div class="testimonial_content">
                                                    <p>“ 不知道沒買過 <br>
                                                    來插花的 ”</p>
                                                    <div class="testimonial_text_img">
                                                        <a href="#"><img src="${ctx}/assets/img/about/testimonial3.png" alt=""></a>
                                                    </div>
                                                    <div class="testimonial_author">
                                                        <p><a href="#">Lindsy Neloms</a> / <span>CEO of SFD</span></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--testimonial area end-->
                </div>
            </div>
        </div>    
    </div>
    <!--testimonial area end-->

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
                            <a href="#"><img src="${ctx}/assets/img/brand/brand2.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand3.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand4.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand5.jpg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand6.jpeg" alt=""></a>
                        </div>
                        <div class="single_brand">
                            <a href="#"><img src="${ctx}/assets/img/brand/brand7.png" alt=""></a>
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