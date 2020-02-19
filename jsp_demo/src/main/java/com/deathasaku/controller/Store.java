package com.deathasaku.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.deathasaku.entity.Brand;
import com.deathasaku.entity.Carousel;
import com.deathasaku.entity.CartItem;
import com.deathasaku.entity.Category;
import com.deathasaku.entity.Order;
import com.deathasaku.entity.OrderItem;
import com.deathasaku.entity.Product;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.entity.Review;
import com.deathasaku.entity.User;
import com.deathasaku.entity.UserResetPassword;
import com.deathasaku.service.BrandService;
import com.deathasaku.service.CarouselService;
import com.deathasaku.service.CategoryService;
import com.deathasaku.service.OrderItemService;
import com.deathasaku.service.OrderService;
import com.deathasaku.service.PaymentService;
import com.deathasaku.service.ProductService;
import com.deathasaku.service.ProductSkuService;
import com.deathasaku.service.ReviewService;
import com.deathasaku.service.ShopCartService;
import com.deathasaku.service.UserResetPasswordService;
import com.deathasaku.service.UserService;
import com.deathasaku.util.PaymentServices;
import com.deathasaku.util.UploadUtil;
import com.deathasaku.util.sendmail;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import de.triology.recaptchav2java.ReCaptcha;

@Controller
@RequestMapping("/store")
public class Store {
	// @RequestMapping("/")
	@Autowired
	UserService userService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	CarouselService carouselService;
	@Autowired
	OrderItemService orderItemService;
	@Autowired
	ProductService productService;
	@Autowired
	ProductSkuService productSkuService;
	@Autowired
	ShopCartService shopCartService;
	@Autowired
	UserResetPasswordService userresetPasswordService;
	@Autowired
	BrandService brandService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	OrderService orderservice;
	@Autowired
	PaymentService paymentservice;

	@ModelAttribute
	public void shopcart(HttpSession session) {
		if (session.getAttribute("CartList") == null) {
			session.setAttribute("CartList", new ArrayList<CartItem>());
		}

	}

	@RequestMapping("/404")
	public String fourfour() {
		return "store/404";
	}

	@RequestMapping("/about")
	public String about() {
		return "store/about";
	}

	@RequestMapping("/acoutjq2")
	public String acoutjq2() {
		return "store/acoutjq2";
	}

	@RequestMapping(value = "/cart")
	public String showCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User shopall = (User) session.getAttribute("username");
		try {
			List<CartItem> userCart = shopCartService.findByUserId(shopall.getId());
			session.setAttribute("cartList", userCart);
		} catch (Exception e) {
			return "store/login";
		}

		return "store/cart";
	}

	@RequestMapping("/checkout")
	public String checkout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		User shopall = (User) session.getAttribute("username");
		if (shopall == null) {
			return "store/login";
		} else {

			List<CartItem> findcart = shopCartService.checkout(shopall.getId());

			session.setAttribute("shopcheck", findcart);
//		List <Caritem> = session.getAttribute("");

			return "store/checkout";
		}
	}

	@RequestMapping("/contact")
	public String contact() {
		return "store/contact";
	}

	@RequestMapping("/faq")
	public String faq() {
		return "store/faq";
	}

	// 訪問登入
	@GetMapping("/login")
	public String login() {
		return "store/login";
	}

	// 用POST驗證 SHIRO 會區分 GET跟POST
	// GET是訪問 POST是驗證
	@PostMapping("/login")
	public String postlogin() {
		return "store/login";
	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {

		List<Carousel> carouselAll = carouselService.getALL();
		Page<Product> producta = productService.findCategoryIdLevelOnePage(0, 2);
		List<Product> productAll = producta.getContent();
		List<Product> orderItem = orderItemService.findHotProduct();
		// List<Product> productDiscount =productService.findDiscountPrice();
		List<ProductSku> productDiscount = productSkuService.findDiscountPrice();
		HttpSession session = request.getSession();
		model.addAttribute("birthhh", session.getAttribute("birthhh"));
		session.removeAttribute("birthhh");

//		session.setAttribute("productAll", productAll);
//		session.setAttribute("carouselAll", carouselAll);
//		session.setAttribute("orderItem", orderItem);	
//		session.setAttribute("priductDiscount", productDiscount);

		model.addAttribute("productAll", productAll);
		model.addAttribute("carouselAll", carouselAll);
		model.addAttribute("orderItem", orderItem);
		model.addAttribute("priductDiscount", productDiscount);

		return "store/index";
	}

	@RequestMapping("/header")
	public String header() {
		return "store/header";
	}

	@RequestMapping("/footer")
	public String footer() {
		return "store/footer";
	}

	@RequestMapping("/my-account")
	public String myaccount(Model model, String account, String email, String password,
			@ModelAttribute("user") User user, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		User abc =  (User) session.getAttribute("username");
//		System.out.println(abc);
//		user.getAccount();

//		List<User> userone = userService.findAll();

//		model.addAttribute("email",finduser);
//		model.addAttribute("email", finduser);
//		model.addAttribute("password", finduser);
		HttpSession session = request.getSession();
		User shopall = (User) session.getAttribute("username");
		try {
			List<Order> userOrder = orderservice.findByUser(shopall);
			session.setAttribute("orderList", userOrder);
		} catch (Exception e) {
			return "store/login";
		}
		return "store/my-account";
	}

	@RequestMapping("/product-details")
	public String productdetails(@RequestParam("id") Integer id, Model model) {
		Product productOne = productService.findOne(id);
		List<Review> reviewall = reviewService.findAll(id);
		model.addAttribute("product", productOne);
		model.addAttribute("reviewall", reviewall);
		return "store/product-details";
	}

	@RequestMapping("/product-grouped")
	public String productgrouped() {
		return "store/product-grouped";
	}

	@RequestMapping("/product-sidebar")
	public String productsidebar() {
		return "store/product-sidebar";
	}

	@RequestMapping("/services")
	public String services() {
		return "store/services";
	}

	@RequestMapping("/shop")
	public String shopfind(@RequestParam("page") Integer pageint, String searchContent,
			@RequestParam(value = "brand", required = false) Integer brand,
			@RequestParam(value = "categoryId", required = false) Integer categoryId,
			@RequestParam(value = "categoryLevelId", required = false) Integer categoryLevelId,
			@RequestParam(value = "price", required = false) String price,
			@RequestParam(value = "sort", required = false) Integer sort, Model model) {
		Page<Product> page = null;

		try {
			if (price != null && price != "") {
				String p1 = price.substring(price.indexOf("$") + 1, price.indexOf("-"));
				String p2 = price.substring(price.indexOf("-") + 2, price.length());
				int mix = Integer.parseInt(p1);
				int max = Integer.parseInt(p2);
				page = productService.findPrice(pageint, mix, max);
				model.addAttribute("prices", "&price=" + price);
			} else {
				if (categoryId != null) {
					page = productService.findCategoryIdPage(pageint, categoryId);
					model.addAttribute("brand", "&brand=" + brand);
					model.addAttribute("categoryId", "&categoryId=" + categoryId);
				} else {
					if (categoryLevelId != null) {
						page = productService.findCategoryIdLevelOnePage(pageint, categoryLevelId);
						model.addAttribute("categoryLevelId", "&categoryLevelId=" + categoryLevelId);
					} else {
					if (brand != null) {
						page = productService.findAllPageBybrand(pageint, brand);
						model.addAttribute("brand", "&brand=" + brand);
					} else {
						if (searchContent != null && searchContent != "") {
							page = productService.findKeyWordPage(pageint, searchContent);
							System.out.println("查詢商品"+searchContent);
							model.addAttribute("searchContent", "&searchContent=" + searchContent);
						} else {
							if (sort != null) {
								page = productService.findAllPageSort(pageint, sort);
								model.addAttribute("sort", "&sort=" + sort);
								model.addAttribute("sel", sort);
							} else {
								page = productService.findAllPage(pageint);
							}
						}
					}
				}
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<Product> product = page.getContent();
		List<Product> orderItem = orderItemService.findHotProduct();
		List<Brand> brandAll = brandService.findAll();
		List<Category> categoryAll = categoryService.findByParentId(0);

		model.addAttribute("page", page);
		model.addAttribute("allProduct", product);
		model.addAttribute("orderItem", orderItem);
		model.addAttribute("brandAll", brandAll);
		model.addAttribute("categoryAll", categoryAll);
		return "store/shop";
	}

	@RequestMapping("/shop-list")
	public String shoplist() {
		return "store/shop-list";
	}

	@RequestMapping("/variable-product")
	public String variableproduct() {
		return "store/variable-product";
	}

	@RequestMapping("/wishlist")
	public String wishlist() {
		return "store/wishlist";
	}

	@RequestMapping(value = "/addNewMember", method = RequestMethod.POST)
	public String addNewMember(Model model, @ModelAttribute("user") User user, String year, String month, String day,
			MultipartFile file) {

		user.setImage(UploadUtil.storeupload(file));

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		try {
			user.setBirthdate(date.parse(year + "-" + month + "-" + day));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userService.save(user)) {
			model.addAttribute("msgg", "ok");
		} else {
			model.addAttribute("msgg", "no");
		}

		return "store/login";
	}

	@SuppressWarnings("unused")
	@RequestMapping(value = "/loginDo", method = RequestMethod.POST)
	public String loginDo(Model model, String email, String password, String name, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value = "par1", required = false) String abc) {
		HttpSession session = request.getSession();
		boolean recaptcha = new ReCaptcha("6LfQZscUAAAAAFZfe9FJ2cKxy4h604Jf2bKfpOkY")
				.isValid(request.getParameter("g-recaptcha-response"));
		if (null == email || "".equals(email)) {
			model.addAttribute("errmsg", "email不能為空");
			return "store/login";
		}
		if (null == password || "".equals(password)) {
			model.addAttribute("errmsg", "密碼不能為空");
			return "store/login";
		}

		try {
			if (userService.login(email, password) != null) {
				session.setAttribute("useremail", email);
				String abb = (String) session.getAttribute("useremail");
				User finduser = userService.finduser(abb);
				session.setAttribute("username", finduser);
				session.setAttribute("LoginOK", "ok");
				String remember = request.getParameter("remember");
				if (recaptcha == true) {
					return "store/login";
				}
				System.out.println(recaptcha);
				int count = 0;
				if (count == 0) {
					session.setAttribute("birthhh", "本月壽星");
					count++;
//					if(count==1) {
//						session.setAttribute("birthhh", null);
//					}
				}
				if (finduser.getBlock() == false) {
					model.addAttribute("errmsg", "此帳號已被禁用");
					Enumeration em = request.getSession().getAttributeNames();
					while (em.hasMoreElements()) {
						request.getSession().removeAttribute(em.nextElement().toString());
					}
					return "store/login";
				}

				if ("true".equals(remember)) {
//					System.out.println("以進去");
					Cookie ck1 = new Cookie("remember", remember);
					ck1.setMaxAge(60 * 60);
					response.addCookie(ck1);
					Cookie ck2 = new Cookie("email", email);
					ck2.setMaxAge(60 * 60);
					response.addCookie(ck2);
					Cookie ck3 = new Cookie("password", password);
					ck3.setMaxAge(60 * 60);
					response.addCookie(ck3);
				}

				else {
					Cookie[] cks = request.getCookies();
					if (cks != null) {
						for (Cookie c : cks) {
							c.setMaxAge(0);
							response.addCookie(c);
						}
					}
				}
				// 購物車合併
				List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");

				List<CartItem> DBlist = shopCartService.findByUserId(finduser.getId());
				Iterator<CartItem> it = list.iterator();
				List<CartItem> list3 = new ArrayList<>();
				while (it.hasNext()) {
					CartItem cartItem = (CartItem) it.next();
					boolean flag = false;

					for (CartItem cartItemtmp : DBlist) {

						if (cartItemtmp.getProductsku().getId().equals(cartItem.getProductsku().getId())) {
							cartItemtmp.setBuyNumber(cartItem.getBuyNumber() + cartItemtmp.getBuyNumber());
							flag = true;
						}

					}
					if (flag == false) {
						cartItem.setUser(finduser);
						list3.add(cartItem);
					}
				}

				DBlist.addAll(list3);

				shopCartService.savaAll(DBlist);
				session.setAttribute("CartList", DBlist);

				return "redirect:index";
			} else {
				model.addAttribute("errmsg", "email或密碼錯誤");
				return "store/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errmsg", "222email或密碼錯誤");
			return "store/login";
		}

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Enumeration em = request.getSession().getAttributeNames();
		while (em.hasMoreElements()) {
			request.getSession().removeAttribute(em.nextElement().toString());
		}

//		HttpSession session = request.getSession();
//		session.invalidate();
//		session.setAttribute("username", null);
//		session.setAttribute("LoginOK", null);
		return "redirect:index";
	}

	@PostMapping("/editMember")
	public String editMember(String email, String name, String password, String tel, String address,
			HttpServletRequest request, HttpServletResponse response, MultipartFile file) {

		userService.editMember(email, name, password, tel, UploadUtil.storeupload(file), address);
		HttpSession session = request.getSession();
		session.setAttribute("useremail", email);
		String abc = (String) session.getAttribute("useremail");
		User finduser = userService.finduser(abc);
		session.setAttribute("username", finduser);

		return "store/my-account";
	}
//	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
//		HttpSession session = request.getSession();
//		Map<String, String> errorMsgMap =new HashMap<String,String>();
//		request.setAttribute("ErrorMsgKey", errorMsgMap);
//		String account = request.getParameter("account");
//		
//	}

	@PostMapping("/sendemail")
	public String sendemail(String name, String email, String mailsubject, String mailmessage) {

		sendmail.send(name, email, mailsubject, mailmessage);

		return "store/contact";
	}

	@RequestMapping(value = "/googleVerify", method = RequestMethod.POST)
	public String verifyToken(String idtokenstr, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(idtokenstr);
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(),
				JacksonFactory.getDefaultInstance())
						.setAudience(Collections.singletonList(
								"867101020440-cvofp0bq6a8jekij5fcdpc9favgoh449.apps.googleusercontent.com"))
						.build();
		GoogleIdToken idToken = null;
		String userId = null;
		String email = null;
		String name = null;
		Date birth = null;

		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		if (idToken != null) {
			System.out.println("驗證成功.");
			Payload payload = idToken.getPayload();
			userId = payload.getSubject();
//			System.out.println("User ID: " + userId);
			email = payload.getEmail();
//			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			name = (String) payload.get("name");
//			String pictureUrl = (String) payload.get("picture");
//			String locale = (String) payload.get("locale");
//			String familyName = (String) payload.get("family_name");
//			String givenName = (String) payload.get("given_name");
			birth = (Date) payload.get("birthday");

		} else {
			System.out.println("Invalid ID token.");
		}
//		User us = new User();
//		us.setOpenid(userId);
//		us.setName(name);
//		us.setEmail(email);
		User user = userService.saveOpenId(userId, name, email, birth);
		session.setAttribute("username", user);

		List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");

		List<CartItem> DBlist = shopCartService.findByUserId(user.getId());
		Iterator<CartItem> it = list.iterator();
		List<CartItem> list3 = new ArrayList<>();
		while (it.hasNext()) {
			CartItem cartItem = (CartItem) it.next();
			boolean flag = false;

			for (CartItem cartItemtmp : DBlist) {

				if (cartItemtmp.getProductsku().getId().equals(cartItem.getProductsku().getId())) {
					cartItemtmp.setBuyNumber(cartItem.getBuyNumber() + cartItemtmp.getBuyNumber());
					flag = true;
				}

			}
			if (flag == false) {
				cartItem.setUser(user);
				list3.add(cartItem);
			}
		}

		DBlist.addAll(list3);

		shopCartService.savaAll(DBlist);
		session.setAttribute("CartList", DBlist);

		session.setAttribute("LoginOK", "ok");
		return "store/index";
	}

	@PostMapping("/userrecover-password")
	public String userrecover_password(@ModelAttribute UserResetPassword re, String email,HttpServletRequest request) {
		System.out.println(email);
		String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		System.out.println("url->>"+url);
		userresetPasswordService.save(re, email,url);

		return "/store/login";
	}

	@RequestMapping("/userresetpwd/{uuid}")
	public String userresetpwd(@PathVariable("uuid") String uuid, Model model) {
		String newpwd = userresetPasswordService.resetPwd(uuid);
		model.addAttribute("newpwd", newpwd);
		return "/store/login";
	}

	@RequestMapping("/forgot-password")
	public String forgot_password() {
		return "/store/forgot-password";
	}

//------------------------霍霍霍霍霍霍霍霍霍霍霍霍
	@RequestMapping(value = { "/authorize_payment", "/sendcheckout" }, method = RequestMethod.POST) // 1
	public void toPayPal(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		System.out.println("url->>"+url);
		try {
			PaymentServices paymentServices = new PaymentServices();
			String approvalLink = paymentServices.authorizePayment((List<CartItem>) session.getAttribute("CartList"),url);

			response.sendRedirect(approvalLink);

		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error").forward(request, response);
		}
	}

	@RequestMapping("/execute_payment") // 3
	protected void doPost(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@ModelAttribute Order order) throws ServletException, IOException {

		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		try {
			User user = (User) session.getAttribute("username");
			List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");
			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.executePayment(paymentId, payerId);
			// 這裡啦 == 訂單生出來

			com.deathasaku.entity.Payment paymentSql = new com.deathasaku.entity.Payment();
//			// payment.
			Payer payer = payment.getPayer();

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			paymentSql.setPaymentId(payment.getId());
			paymentSql.setPayerID(payerInfo.getPayerId());
			paymentSql.setStatus(payer.getStatus());
			paymentSql.setPayeremail(payerInfo.getEmail());
			paymentSql.setPayerFirstName(payerInfo.getFirstName());
			paymentSql.setPayerLastName(payerInfo.getLastName());
			paymentSql.setShipping_address(payerInfo.getShippingAddress().toJSON());

//			// 生ORDER
			orderservice.save(order, user.getId(), list, paymentSql);
			// paymentservice.save(paymentSql); 去ORDER存好了

			// 在這裡建立ORDER
			// 先建立PAYMENT 然後再丟給ORDER

			System.out.println(payerInfo.getShippingAddress().toString());
			System.out.println(payerInfo.toJSON());
			Transaction transaction = payment.getTransactions().get(0);

			// 清掉 購物車

			shopCartService.deleteByUserId(user.getId());
			// SESSION清掉

			list.clear();
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);

			request.getRequestDispatcher("receipt").forward(request, response);

		} catch (PayPalRESTException ex) {

			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error").forward(request, response);
		}
	}

	@RequestMapping("/review_payment") // 2
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		try {
			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.getPaymentDetails(paymentId);

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			request.setAttribute("shippingAddress", shippingAddress);

			String url = "review?paymentId=" + paymentId + "&PayerID=" + payerId;

			request.getRequestDispatcher(url).forward(request, response);

		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error").forward(request, response);
		}
	}

	@RequestMapping("/checkout-PayPal")
	public String checkoutPayPal() {
		return "store/checkout-PayPal";
	}

	@RequestMapping("/error")
	public String error() {
		return "store/error";
	}

	@RequestMapping("/cancel")
	public String cancel() {
		return "store/cancel";
	}

	@RequestMapping("/receipt")
	public String receipt() {
		return "store/receipt";
	}

	@RequestMapping("/review")
	public String review() {
		return "store/review";
	}

	// -----------------------------------------------------
	@RequestMapping("/ordertable1")
	public String ordertable1(Integer id, Model model) {
		model.addAttribute("order", orderItemService.findByOrderId(id));
		return "admin/order_table1";
	}

}