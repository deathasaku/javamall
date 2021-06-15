package com.deathasaku.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.deathasaku.entity.Employee;
import com.deathasaku.entity.Message;
import com.deathasaku.entity.Product;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.entity.ResetPassword;
import com.deathasaku.entity.User;
import com.deathasaku.service.BrandService;
import com.deathasaku.service.CarouselService;
import com.deathasaku.service.CategoryService;
import com.deathasaku.service.EmployeeService;
import com.deathasaku.service.FriendShipService;
import com.deathasaku.service.MessageService;
import com.deathasaku.service.OrderItemService;
import com.deathasaku.service.OrderService;
import com.deathasaku.service.PaymentService;
import com.deathasaku.service.ProductService;
import com.deathasaku.service.ProductSkuService;
import com.deathasaku.service.PropertyService;
import com.deathasaku.service.ResetPasswordService;
import com.deathasaku.service.UserService;
import com.deathasaku.util.UploadUtil;

@Controller
@RequestMapping("/admin")
public class Admin {
	EmployeeService employeeService;
	PropertyService propertyService;
	ProductService productService;
	FriendShipService friendShipService;
	MessageService messageService;
	CarouselService carouselService;
	OrderService orderService;
	OrderItemService orderItemService;
	PaymentService paymentService;
	CategoryService categoryService;
	ProductSkuService productSkuService;
	BrandService brandService;
	ResetPasswordService resetPasswordService;
	UserService userService;

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setResetPasswordService(ResetPasswordService resetPasswordService) {
		this.resetPasswordService = resetPasswordService;
	}

	@Autowired
	public void setPaymentService(PaymentService paymentService) {
		this.paymentService = paymentService;
	}

	@Autowired
	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	@Autowired
	public void setProductSkuService(ProductSkuService productSkuService) {
		this.productSkuService = productSkuService;
	}

	@Autowired
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	@Autowired
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@Autowired
	public void setOrderItemService(OrderItemService orderItemService) {
		this.orderItemService = orderItemService;
	}

	@Autowired
	public void setCarouselService(CarouselService carouselService) {
		this.carouselService = carouselService;
	}

	@Autowired
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	@Autowired
	public void setFriendShipService(FriendShipService friendShipService) {
		this.friendShipService = friendShipService;
	}

	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setPropertyService(PropertyService propertyService) {
		this.propertyService = propertyService;
	}

	@Autowired
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@RequestMapping("/addgoods")
	public String addgoods() {
		return "admin/addgoods";
	}

	@RequestMapping("/property")
	public String property() {
		return "admin/property";
	}

	@RequestMapping("/userinfo")
	public String userinfo(String userInfo) {
		System.out.println(userInfo);
		return "admin/goods";
	}

	@RequestMapping("/forgot-password")
	public String forgot_password() {
		return "/admin/forgot-password";
	}

	@RequestMapping("/addgoods_s")
	public String addgoods_s(Integer categoryId, Model model) {

		model.addAttribute("propertyList", categoryService.findById(categoryId).getProperty());

		return "/admin/addgoods_s";
	}

	@PostMapping("/recover-password")
	public String recover_password(@ModelAttribute ResetPassword re, String email, HttpServletRequest request) {
		String url = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		System.out.println("url->>"+url);
		resetPasswordService.save(re, email,url);
		return "/admin/login";
	}

	@RequestMapping("/resetpwd/{uuid}")
	public String resetpwd(@PathVariable("uuid") String uuid, Model model) {
		String newpwd = resetPasswordService.resetPwd(uuid);
		model.addAttribute("newpwd", newpwd);
		return "/admin/login";
	}

	@PostMapping("/profile")
	public String resetEployee(HttpSession session, String nickName, MultipartFile file, String loginUserName,
			String telp) {
		Employee employee = (Employee) session.getAttribute("admin");

		employee.setUsername(nickName);
		employee.setImage(file.isEmpty() == true ? "/admin/nopic.jpg" : UploadUtil.upload(file));
		employee.setTel(telp);
		employeeService.update(employee);
		return "redirect:/admin/profile";
	}

	@PostMapping("/profilepwd")
	public String resetEployee(HttpSession session, String newPassword) {
		Employee employee = (Employee) session.getAttribute("admin");
		employee.setAccount(newPassword);

		employeeService.update(employee);
		return "redirect:/admin/profile";
	}

	@RequestMapping({ "/chat/{id}" })
	public String mainpage3(HttpServletRequest request, @PathVariable("id") Integer id, Model model) {
		// 判斷，如果沒有session，則跳到登錄頁面
		// 預設ID給誰?
		// 進入這邊 TOUSER 就是以讀
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("admin");
		// 進入這邊要以毒
		model.addAttribute("msglist", messageService.findUserMessages(employee.getId(), id));
		// 這是左邊 RECENT的資料
		Map<Employee, List<Message>> map = messageService.showList(employee.getId());

		model.addAttribute("toUser", id);
		model.addAttribute("toUserserBean", employeeService.getOne(id));
		model.addAttribute("mapmsg", map);

		return "/admin/chat";
	}

	@RequestMapping({ "/chat" })
	public String chat(HttpServletRequest request, Model model) {
		// 判斷，如果沒有session，則跳到登錄頁面
		// 預設ID給誰?
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("admin");

		Map<Employee, List<Message>> map = messageService.showList(employee.getId());
		model.addAttribute("mapmsg", map);

		return "/admin/chat";
	}

	@RequestMapping({ "/chat_msg/{id}" })
	public String chat_msg(HttpServletRequest request, @PathVariable("id") Integer id, Model model) {
		// 判斷，如果沒有session，則跳到登錄頁面
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("admin");
		model.addAttribute("msglist", messageService.findUserMessages(employee.getId(), id));
		Map<Employee, List<Message>> map = messageService.showList(employee.getId());

		model.addAttribute("toUser", id);

		model.addAttribute("toUserserBean", employeeService.getOne(id));

		model.addAttribute("mapmsg", map);

		return "/admin/chat_msg";
	}

	// 用來搜尋
	@RequestMapping({ "/chat_list" })
	public String chat_list(HttpServletRequest request, Model model,
			@RequestParam(value = "username", required = false) String username, Integer toUser) {
		// 判斷，如果沒有session，則跳到登錄頁面
		HttpSession session = request.getSession();
		Employee employee = (Employee) session.getAttribute("admin");
		Map<Employee, List<Message>> map = null;

		if (username == null) {
			map = messageService.showList(employee.getId());
		} else {
			map = messageService.serachList(employee.getId(), username);
		}

		model.addAttribute("toUser", toUser);

		model.addAttribute("mapmsg", map);

		return "/admin/chat_list";
	}

	@RequestMapping("/addgoods.do")
	public String addgoodsdo(Product product, ProductSku productSku, @RequestParam("description") String description,
			Integer cg, @RequestParam("imgs") MultipartFile[] imgs, @RequestParam("img") MultipartFile img,
			Integer brandId, Integer categoryId) {
		// 把圖檔丟下去
		product.setProductName(product.getProductName().trim());
		product.setBrand(brandService.getOne(brandId));
		productService.save(product, productSku, imgs, img, categoryId);
		return "redirect:/admin/goods";
	}

	@RequestMapping("/editgoods.do")
	public String editgoodsdo(Product product, ProductSku productSku, @RequestParam("description") String description,
			Integer cg, @RequestParam("imgs") MultipartFile[] imgs, @RequestParam("img") MultipartFile img,
			Integer skuid) {
		// 把圖檔丟下去

		productSku.setId(skuid);
		productService.edit(product, productSku, imgs, img, null);
		return "redirect:/admin/goods";
	}

	@RequestMapping("/editgoods")
	public String editgoods(Model model, Integer id) {
		// 把圖檔丟下去
		model.addAttribute("productSku", productSkuService.findById(id));

		return "/admin/editgoods";
	}

	@RequestMapping("/footer")
	public String footer() {
		return "admin/footer";
	}

	@RequestMapping("/adduser")
	public String adduser() {

		return "admin/adduser";
	}

	@RequestMapping("/editEmployee")
	public String editEmployee(Integer id, Model model) {
		model.addAttribute("em", employeeService.getOne(id));
		return "admin/editEmployee";
	}

	@PostMapping("/editEmployee")
	public String PosteditEmployee(Integer id, Model model, MultipartFile file, Employee employee) {
		employee.setImage(file.isEmpty()?"/admin/nopic.jpg":UploadUtil.upload(file));
		employeeService.update(employee);
		return "redirect:/admin/admin_user";
	}

	@RequestMapping("/adduser/action")
	public String adduserAction(Model model, MultipartFile file, Employee employee,
			HttpServletRequest httpServletRequest) {
		// 這邊要再做過調整 因為 業務邏輯不要放到CONTROLLER 另外 SAVE跟UPLOAD還是拆開比較好
		// 這邊要先檢查帳號不存在

		employee.setImage(file.isEmpty() ? "/admin/nopic.jpg" : UploadUtil.upload(file));

		if (employeeService.save(employee)) {
			model.addAttribute("msg", "帳號新增成功");
		} else {
			model.addAttribute("msg", "帳號新增失敗");
		}

		return "redirect:/admin/admin_user";
	}

	@RequestMapping("/admin_user")
	public String admin_user() {
		return "admin/employee";
	}

	@RequestMapping("/category")
	public String category(Model model, Integer categoryLevel, Integer parentId, Integer backParentId) {
		// 這property 是用來做CHECKBOX的
		if (categoryLevel == 2)
			model.addAttribute("properties", propertyService.findAll());

		model.addAttribute("categoryLevel", categoryLevel);
		model.addAttribute("parentId", parentId);
		model.addAttribute("backParentId", backParentId);
		return "admin/category";
	}

	@RequestMapping("/chart")
	public String chart(Model model) {

		// model.addAttribute("chart", categoryService.chartJson());
		return "admin/chart";
	}

	@RequestMapping("/contact")
	public String contact(Model model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "username", required = false) String username) {

		if (page == null) {
			page = 1;
		}
		if (username == null) {
			model.addAttribute("employees", employeeService.findAllPage(page, 9));
		} else {
			model.addAttribute("employees", employeeService.findByUsernamePage(username, page, 9));
			model.addAttribute("searchName", username);
		}

		return "admin/contact";
	}

	@RequestMapping("/index_config")
	public String index_config() {
		return "admin/index_config";
	}

	@RequestMapping("/goods")
	public String goods() {
		return "admin/goods";
	}

	@RequestMapping("/index_carousel")
	public String index_carousel(Model model) {
		model.addAttribute("carousel", carouselService.findAll());
		return "admin/index_carousel";
	}

	@RequestMapping("/index")
	public String index() {
		return "admin/index";
	}

	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {

		System.out.println("進入LOGIN葉面");
		Cookie[] cookies = request.getCookies();
		if (null == cookies) {
			System.out.println("沒有cookie==============");
		} else {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("remadmin")) {
					Integer employeeid = Integer.valueOf(cookie.getValue());
					model.addAttribute("remadmin", employeeService.getOne(employeeid));
				}
			}
		}

		return "admin/login";
	}

	@PostMapping("/login")
	public String loginPost() {

		return "admin/login";
	}

	@RequestMapping("/login.do")
	public String login_do() {
		System.out.println("login_do");
		return "admin/login";
	}

	@RequestMapping("/logout.action")
	public String logout_action(HttpServletRequest request, HttpServletResponse response) {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		System.out.println("測試有沒有進入這裡");
		Cookie[] cookies = request.getCookies();
		if (null == cookies) {
			System.out.println("沒有cookie==============");
		} else {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("remadmin")) {
					cookie.setValue(null);
					cookie.setMaxAge(0);// 立即刪除cookie
					cookie.setPath("/");
					System.out.println("自動登入已刪除");
					response.addCookie(cookie);
					break;
				}
			}
		}
		// 要馬時做LOGOUT FILTER 不然就在這邊寫

		return "admin/login";
	}

//	@RequestMapping("/login.do")
//	public String login_do(Model model, String userName, String password,
//			@RequestParam(value = "g-recaptcha-response", required = false) String recaptcha) {
////		if (null == userName || "".equals(userName)) {
////			model.addAttribute("errmsg", "帳號不能為空");
////			return null;
////		}
////
////		if (null == password || "".equals(password)) {
////			model.addAttribute("errmsg", "密碼不能為空");
////			return null;
////		}
////
////		try {
////			if (employeeService.login(userName, password) != null)
////				return "admin/index";
////			else {
////				model.addAttribute("errmsg", "帳號或密碼錯誤");
////				return "admin/login";
////			}
////		} catch (Exception e) {
////			model.addAttribute("errmsg", "帳號或密碼錯誤");
////			return "admin/login";
////		}
//
//		return "admin/index";
//	}

	@RequestMapping("/orders")
	public String orders() {
		return "admin/orders";
	}

	@RequestMapping("/profile")
	public String profile() {
		return "admin/profile";
	}

	@RequestMapping("/review")
	public String review() {
		return "admin/review";
	}

	@RequestMapping("/sidebar")
	public String sidebar(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("admin");
		model.addAttribute("dropmsg", messageService.showList(employee.getId()));
		// 這裡也要排
		model.addAttribute("unread", messageService.unread(employee.getId()));

		model.addAttribute("unread2", messageService.unread2(employee.getId()));
		model.addAttribute("announcement", messageService.announcement(employee.getId(), -1));

		return "admin/sidebar";
	}

	@RequestMapping("/sidebar_drop1")
	public String sidebar_drop1(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("admin");
		model.addAttribute("dropmsg", messageService.showList(employee.getId()));
		// 這裡也要排
		model.addAttribute("unread", messageService.unread(employee.getId()));
		return "admin/sidebar_drop1";
	}

	@RequestMapping("/sidebar_drop2")
	public String sidebar_drop2(Model model, HttpSession session) {
		Employee employee = (Employee) session.getAttribute("admin");
		model.addAttribute("unread2", messageService.unread2(employee.getId()));
		model.addAttribute("announcement", messageService.announcement(employee.getId(), -1));
		return "admin/sidebar_drop2";
	}

	@RequestMapping("/user")
	public String user() {
		return "admin/user";
	}

	@RequestMapping("/about")
	public String about() {
		return "admin/classtwo/about";
	}

	@RequestMapping("/friend/{id}")
	public String friend(@PathVariable("id") Integer id, HttpSession session) {
		System.out.println("shoe->>>>>" + id);
		friendShipService.addFriendShip((Employee) session.getAttribute("admin"), id);
		return "redirect:/admin/contact";
	}

	@RequestMapping("/ordertable1")
	public String ordertable1(Integer id, Model model) {
		model.addAttribute("order", orderItemService.findByOrderId(id));
		return "admin/order_table1";
	}

	@RequestMapping("/ordertable2")
	public String ordertable2(Integer id, Model model) {
		model.addAttribute("payment", paymentService.getOne(id));
		return "admin/order_table2";
	}

	@RequestMapping("/brand")
	public String brand() {

		return "/admin/brand";
	}

	@RequestMapping("/announcement")
	public String announcement(Model model, HttpSession session) {
		model.addAttribute("msglist",
				messageService.announcementAsc(null, ((Employee) session.getAttribute("admin")).getId()));
		return "/admin/announcement";
	}

	@RequestMapping("/announcement2")
	public String announcement2(Model model, HttpSession session) {
		model.addAttribute("msglist",
				messageService.announcementAsc(null, ((Employee) session.getAttribute("admin")).getId()));
		return "/admin/announcement2";
	}

	// -------------------------立言 看起來只有顧客

	@RequestMapping("banuser")
	public String banuser(Integer userId, Boolean block) {
		userService.changeBlock(userId, block);
		return "redirect:/admin/getMemberByName";
	}

	@RequestMapping("/getMemberByName")
	public String getMemberByName(Model model) {
		model.addAttribute("users", userService.findAll());
		return "admin/user";
	}

	@RequestMapping("/deletemb")
	public String deletemb(@RequestParam("id") Integer id) {
		System.out.println("id=" + id);
		userService.deleteById(id);
		// model.addAttribute("mb",memberService.delete(id));

		return "redirect:/admin/user";
	}

	@RequestMapping(value = "/getOne")
	public String getOne(@RequestParam("id") Integer id, Model model, User user) {
		model.addAttribute("one", userService.getOne(id));
		System.out.println("Id=" + id);

		return "admin/getOne";
	}

	@RequestMapping(value = "/update")
	public String update(Model model, MultipartFile file, User user, HttpServletRequest httpServletRequest) {
		user.setImage(UploadUtil.upload(file, httpServletRequest));
		userService.update(user);
		System.out.println("update");
		return "redirect:/admin/getMemberByName";
	}
	// ------------------------------------結束
	// ------------------霍笙墉

	@RequestMapping("/register")
	public String register() {

		return "/admin/register";
	}

	@PostMapping("/register")
	public String regiterPost(Employee employee, MultipartFile file, RedirectAttributes redirectAttributes) {

		employee.setImage(file.isEmpty() ? "/admin/nopic.jpg" : UploadUtil.upload(file));

		try {
			employeeService.register(employee);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
			redirectAttributes.addFlashAttribute("admin_login_error", e.getMessage());
		}
		return "redirect:/admin/login";
	}

}
