<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>    
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Lukani - shop list</title>
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

    
    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <h3>Shop</h3>
                        <ul>
                            <li><a href="index">home</a></li>
                            <li>shop list</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--shop  area start-->
    <div class="shop_area shop_reverse mt-100 mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-12">
                   <!--sidebar widget start-->
                    <aside class="sidebar_widget">
                        <div class="widget_inner">
                            <div class="widget_list widget_categories">
                                <h3>Women</h3>
                                <ul>
                                    <li class="widget_sub_categories sub_categories1"><a href="javascript:void(0)">Shoes</a>
                                        <ul class="widget_dropdown_categories dropdown_categories1">
                                            <li><a href="#">Document</a></li>
                                            <li><a href="#">Dropcap</a></li>
                                            <li><a href="#">Dummy Image</a></li>
                                            <li><a href="#">Dummy Text</a></li>
                                            <li><a href="#">Fancy Text</a></li>
                                        </ul>
                                    </li>
                                    <li class="widget_sub_categories sub_categories2"><a href="javascript:void(0)">Bags</a>
                                        <ul class="widget_dropdown_categories dropdown_categories2">
                                            <li><a href="#">Flickr</a></li>
                                            <li><a href="#">Flip Box</a></li>
                                            <li><a href="#">Cocktail</a></li>
                                            <li><a href="#">Frame</a></li>
                                            <li><a href="#">Flickrq</a></li>
                                        </ul>
                                    </li>
                                    <li class="widget_sub_categories sub_categories3"><a href="javascript:void(0)">Clothing</a>
                                        <ul class="widget_dropdown_categories dropdown_categories3">
                                            <li><a href="#">Platform Beds</a></li>
                                            <li><a href="#">Storage Beds</a></li>
                                            <li><a href="#">Regular Beds</a></li>
                                            <li><a href="#">Sleigh Beds</a></li>
                                            <li><a href="#">Laundry</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="widget_list widget_filter">
                                <h3>Filter by price</h3>
                                <form action="#"> 
                                    <div id="slider-range"></div>   
                                    <button type="submit">Filter</button>
                                    <input type="text" name="text" id="amount" />   

                                </form> 
                            </div>
                            <div class="widget_list widget_color">
                                <h3>Select By Color</h3>
                                <ul>
                                    <li>
                                        <a href="#">Black  <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> Blue <span>(8)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">Brown <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> Green <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">Pink <span>(4)</span></a> 
                                    </li>
                                  
                                </ul>
                            </div>
                            <div class="widget_list widget_color">
                                <h3>Select By SIze</h3>
                                <ul>
                                    <li>
                                        <a href="#">S  <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> M <span>(8)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">L <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> XL <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">XLL <span>(4)</span></a> 
                                    </li>
                                  
                                </ul>
                            </div>
                            <div class="widget_list widget_manu">
                                <h3>Manufacturer</h3>
                                <ul>
                                    <li>
                                        <a href="#">Brake Parts <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">Accessories <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">Engine Parts <span>(4)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">hermes <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">louis vuitton <span>(8)</span></a> 
                                    </li>
                                
                                </ul>
                            </div>
                            <div class="widget_list tags_widget">
                                <h3>Product tags</h3>
                                <div class="tag_cloud">
                                    <a href="#">Men</a>
                                    <a href="#">Women</a>
                                    <a href="#">Watches</a>
                                    <a href="#">Bags</a>
                                    <a href="#">Dress</a>
                                    <a href="#">Belt</a>
                                    <a href="#">Accessories</a>
                                    <a href="#">Shoes</a>
                                </div>
                            </div>
                            <div class="widget_list">
                                <h3>Compare</h3>
                                <div class="shop_sidebar_product">
                                    <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product10.jpg" alt=""></a>
                                                    <a class="secondary_img" href="product-details"><img src="${ctx}/assets/img/product/product2.jpg" alt=""></a>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name"><a href="product-details">Donec Non Est</a></h4>
                                                    <div class="product_rating">
                                                       <ul>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                       </ul>
                                                    </div>
                                                    <div class="price_box"> 
                                                        <span class="current_price">$80.00</span>
                                                        <span class="old_price">$20.00</span> 
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                    <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product9.jpg" alt=""></a>
                                                    <a class="secondary_img" href="product-details"><img src="${ctx}/assets/img/product/product3.jpg" alt=""></a>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name"><a href="product-details">Cas Meque Metus</a></h4>
                                                    <div class="product_rating">
                                                       <ul>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                       </ul>
                                                    </div>
                                                    <div class="price_box"> 
                                                        <span class="current_price">$70.00</span>
                                                        <span class="old_price">$40.00</span> 
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                    <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product8.jpg" alt=""></a>
                                                    <a class="secondary_img" href="product-details"><img src="${ctx}/assets/img/product/product4.jpg" alt=""></a>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name"><a href="product-details"> commodo augue</a></h4>
                                                    <div class="product_rating">
                                                       <ul>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                           <li><a href="#"><i class="icon-star"></i></a></li>
                                                       </ul>
                                                    </div>
                                                    <div class="price_box"> 
                                                        <span class="current_price">$80.00</span>
                                                        <span class="old_price">$20.00</span> 
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                </div>
                            </div>
                        </div>
                    </aside>
                    <!--sidebar widget end-->
                </div>
                <div class="col-lg-9 col-md-12">
                    <!--shop wrapper start-->
                    <!--shop toolbar start-->
                    <div class="shop_toolbar_wrapper">
                        <div class="shop_toolbar_btn">

                            <button data-role="grid_3" type="button" class=" btn-grid-3" data-toggle="tooltip" title="3"></button>

                            <button data-role="grid_4" type="button"  class=" btn-grid-4" data-toggle="tooltip" title="4"></button>

                            <button data-role="grid_list" type="button"  class="active btn-list" data-toggle="tooltip" title="List"></button>
                        </div>
                        <div class=" niceselect_option">
                            <form class="select_option" action="#">
                                <select name="orderby" id="short">

                                    <option selected value="1">Sort by average rating</option>
                                    <option  value="2">Sort by popularity</option>
                                    <option value="3">Sort by newness</option>
                                    <option value="4">Sort by price: low to high</option>
                                    <option value="5">Sort by price: high to low</option>
                                    <option value="6">Product Name: Z</option>
                                </select>
                            </form>
                        </div>
                        <div class="page_amount">
                            <p>Showing 1–9 of 21 results</p>
                        </div>
                    </div>
                     <!--shop toolbar end-->
                     <div class="row shop_wrapper grid_list">
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product1.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-7%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">commodo augue nisi</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">commodo augue nisi</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product2.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-8%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">adipiscing cursus</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">adipiscing cursus</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product3.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-9%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">adipiscing elit</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">adipiscing elit</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product4.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-6%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">Donec eu cook</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">Donec eu cook</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product5.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-9%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">Duis pulvinar cook</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">Duis pulvinar cook</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product6.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-5%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">eget sagittis</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">eget sagittis</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product7.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-8%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">fringilla augue</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">commodo augue nisi</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product8.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-6%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">gravida semper</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">gravida semper</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product9.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-8%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">hendrerit est</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">hendrerit est</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product10.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-4%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">massa massa</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">massa massa</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product11.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-6%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">Morbi ornare</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">Morbi ornare</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <a class="primary_img" href="product-details"><img src="${ctx}/assets/img/product/product12.jpg" alt=""></a>
                                        <div class="label_product">
                                            <span class="label_sale">-9%</span>
                                        </div>
                                        <div class="action_links">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart"><i class="icon-shopping-bag"></i></a></li>
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>    
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="action_links list_action">
                                            <ul>  
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_price_rating">
                                            <div class="product_rating">
                                               <ul>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                                   <li><a href="#"><i class="icon-star"></i></a></li>
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details">placerat vestibulum</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">£69.00</span>
                                                <span class="old_price">£74.00</span>
                                            </div>
                                       </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                               <li><a href="#"><i class="icon-star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details">placerat vestibulum</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">£69.00</span>
                                            <span class="old_price">£74.00</span>
                                        </div>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco…</p>
                                        </div>
                                        <div class="action_links list_action_right">
                                            <ul>
                                                <li class="add_to_cart"><a href="cart" title="Add to cart">Add to cart</a></li>
                                                 <li class="wishlist"><a href="wishlist" title="Add to Wishlist"><i class="icon-heart"></i></a></li>   
                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon-sliders"></i></a></li> 

                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                    </div>

                    <div class="shop_toolbar t_bottom">
                        <div class="pagination">
                            <ul>
                                <li class="current">1</li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li class="next"><a href="#">next</a></li>
                                <li><a href="#">>></a></li>
                            </ul>
                        </div>
                    </div>
                    <!--shop toolbar end-->
                    <!--shop wrapper end-->
                </div>
            </div>
        </div>
    </div>
    <!--shop  area end-->
    
   <!--footer area start-->
    <c:import url="footer.jsp"></c:import>
    <!--footer area end-->
    
    <!-- modal area start-->
    <div class="modal fade" id="modal_box" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="icon-x"></i></span>
                </button>
                <div class="modal_body">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12">
                                <div class="modal_tab">  
                                    <div class="tab-content product-details-large">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel" >
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${ctx}/assets/img/product/productbig1.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab2" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${ctx}/assets/img/product/productbig2.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab3" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${ctx}/assets/img/product/productbig3.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab4" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${ctx}/assets/img/product/productbig4.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal_tab_button">    
                                        <ul class="nav product_navactive owl-carousel" role="tablist">
                                            <li >
                                                <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="${ctx}/assets/img/product/product1.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                 <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="${ctx}/assets/img/product/product2.jpg" alt=""></a>
                                            </li>
                                            <li>
                                               <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="${ctx}/assets/img/product/product3.jpg" alt=""></a>
                                            </li>
                                            <li>
                                               <a class="nav-link" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><img src="${ctx}/assets/img/product/product8.jpg" alt=""></a>
                                            </li>

                                        </ul>
                                    </div>    
                                </div>  
                            </div> 
                            <div class="col-lg-7 col-md-7 col-sm-12">
                                <div class="modal_right">
                                    <div class="modal_title mb-10">
                                        <h2>Donec Ac Tempus</h2> 
                                    </div>
                                    <div class="modal_price mb-10">
                                        <span class="new_price">$64.99</span>    
                                        <span class="old_price" >$78.99</span>    
                                    </div>
                                    <div class="modal_description mb-15">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam, reiciendis maiores quidem aperiam, rerum vel recusandae </p>    
                                    </div> 
                                    <div class="variants_selects">
                                        <div class="variants_size">
                                           <h2>size</h2>
                                           <select class="select_option">
                                               <option selected value="1">s</option>
                                               <option value="1">m</option>
                                               <option value="1">l</option>
                                               <option value="1">xl</option>
                                               <option value="1">xxl</option>
                                           </select>
                                        </div>
                                        <div class="variants_color">
                                           <h2>color</h2>
                                           <select class="select_option">
                                               <option selected value="1">purple</option>
                                               <option value="1">violet</option>
                                               <option value="1">black</option>
                                               <option value="1">pink</option>
                                               <option value="1">orange</option>
                                           </select>
                                        </div>
                                        <div class="modal_add_to_cart">
                                            <form action="#">
                                                <input min="1" max="100" step="2" value="1" type="number">
                                                <button type="submit">add to cart</button>
                                            </form>
                                        </div>   
                                    </div>
                                    <div class="modal_social">
                                        <h2>Share this product</h2>
                                        <ul>
                                            <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                            <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        </ul>    
                                    </div>      
                                </div>    
                            </div>    
                        </div>     
                    </div>
                </div>    
            </div>
        </div>
    </div>
    <!-- modal area end-->


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