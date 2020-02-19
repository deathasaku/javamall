package com.deathasaku.restcontroller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.deathasaku.entity.Brand;
import com.deathasaku.entity.Carousel;
import com.deathasaku.entity.Category;
import com.deathasaku.entity.Employee;
import com.deathasaku.entity.Order;
import com.deathasaku.entity.Product;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.entity.Property;
import com.deathasaku.entity.Review;
import com.deathasaku.service.BrandService;
import com.deathasaku.service.CarouselService;
import com.deathasaku.service.CategoryService;
import com.deathasaku.service.EmployeeService;
import com.deathasaku.service.MessageService;
import com.deathasaku.service.OrderService;
import com.deathasaku.service.ProductService;
import com.deathasaku.service.ProductSkuService;
import com.deathasaku.service.PropertyService;
import com.deathasaku.service.ReviewService;
import com.deathasaku.util.UploadUtil;

@RestController
@RequestMapping("/admin")
public class AdminRest {
//分類分的不夠細啊 都混在ADMINREST裡面這樣不好
//果然害是應該每個TABLE的REST獨立出一個類比較好 
//不該偷懶可是在改太麻煩ㄏㄏ

	EmployeeService employeeService;
	CategoryService categoryService;
	PropertyService propertyService;
	ProductService productService;
	ProductSkuService productSkuService;
	MessageService messageService;
	CarouselService carouselService;
	ReviewService reviewService;
	OrderService orderService;
	BrandService brandService;

	@Autowired
	public void setBrandService(BrandService brandService) {
		this.brandService = brandService;
	}

	@Autowired
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@Autowired
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
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
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Autowired
	public void setProductSkuService(ProductSkuService productSkuService) {
		this.productSkuService = productSkuService;
	}

	@Autowired
	public void setPropertyService(PropertyService propertyService) {
		this.propertyService = propertyService;
	}

	@Autowired
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@Autowired
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	@RequestMapping("/products")
	public List<Product> products() {
		System.out.println("products rest-----");
		return productService.findAll();
	}

	@RequestMapping("/productSkus")
	public List<ProductSku> productSkus() {

		return productSkuService.findAll();

	}

	@RequestMapping("/employeelist")
	public List<Employee> getEmployee() {

		return employeeService.findAll();
	}

	// 接收CKEDITOR 圖片上傳的rest
	@RequestMapping("/uplaodCkeditor")
	public String uplaodCkeditor(HttpServletRequest httpServletRequest, MultipartFile upload) {
		System.out.println("uploading");
		return UploadUtil.uploadJson(httpServletRequest, upload);
	}

	@RequestMapping("read_announcement")
	public String read_announcement(HttpSession session) {
		Employee employee = (Employee) session.getAttribute("admin");
		return messageService.read_announcement(employee.getId());
	}

	@RequestMapping("unread_num")
	public String unread_num(HttpSession session) {

		Employee employee = (Employee) session.getAttribute("admin");
		return String.valueOf(messageService.unread(employee.getId()));
	}

	@RequestMapping("unread_num2")
	public String unread_num2(HttpSession session) {
		Employee employee = (Employee) session.getAttribute("admin");
		return String.valueOf(messageService.unread2(employee.getId()));
	}

	@RequestMapping("/categorylist")
	public List<Category> getCagegoryList() {

		return categoryService.findAll();
	}

	@RequestMapping("/categoryjson")
	public List<Category> getCategoryJson(Integer parentId, String backParentId) {
		// 這組返回 當前PID下的所有分類
		return categoryService.findByParentId(parentId);
	}

	// 商品分類新增
	// 需要接收的參數有1.分類名稱 父分類?hmmm 傳吧 但是 前台要多一個HIDDEN? AJAX POST DATA ? 直接簡單的POST就可以了
	// NAME PID REQ
	// 要用PATHVARIABLEㄇ?

	// 給property jqgrid 撈的REST
	@RequestMapping("/propertyJqgrid")
	public List<Property> propertyJqgrid() {
		return propertyService.findAll();
	}

	// 刪除
	@RequestMapping("/delProperty")
	public String delProperty(@RequestParam("id[]") Integer[] id) {
		System.out.println(id.toString());

		try {
			propertyService.deleteById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"sucess\":false}";
		}
		return "{\"sucess\":true}";
	}

	// 修改部分屬性 先全部刪除 在SAVE
	@RequestMapping("/propertyValueModify")
	public String propertyValueModify(Integer id, @RequestParam("value") String propertyValue) {
		System.out.println("modify->" + propertyValue);
		try {
			propertyService.modifyPropertyValue(id, propertyValue);
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"sucess\":false}";
		}
		return "{\"sucess\":true}";
	}

	// 給property ajax 新增屬性的REST服務
	// 回傳簡單的JSON 成功/失敗 +訊息
	@RequestMapping("/propertyAjax")
	public String propertyAjax(Integer id, String propertyValue) {

		try {
			boolean bo = propertyService.updateProperties(id, propertyValue);
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"sucess\":false}";
		}

		return "{\"sucess\":true}";
	}

	// 修改規格的REST
	// AJAX的參數ID要一樣
	@RequestMapping("/modifyProperty")
	public String propertyAjax(Property property) {

		try {
			propertyService.modify(property);
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"sucess\":false}";
		}

		return "{\"sucess\":true}";
	}

	@RequestMapping("/addProperty")
	public String addProperty(Property property, @RequestParam("value") String propertyValue) {
		try {
			propertyService.save(property);
			System.out.println("測試PROPETY ID" + property.getId());
			propertyService.updateProperties(property.getId(), propertyValue);
		} catch (Exception e) {
			e.printStackTrace();
			return "{\"sucess\":false}";
		}
		return "{\"sucess\":true}";
	}

	@RequestMapping("/addcategory")
	public String addcategory(Category category,
			@RequestParam(value = "checkboxes[]", required = false) Integer[] checkboxes) {
		// 問題一 接收參數有問題ㄏㄏ 再想辦法
		// Integer[] checkboxes = new Integer[] { 1, 2 };

		System.out.println("int[]->" + checkboxes);
		System.out.println("addcategory->rest");
		System.out.println(category.toString());
		// 因為我們新增分類也只會用 AJAX做 所以我就不另外再做一個儲存的ADD了
		boolean bo = false;
		String msg = "新增成功";

		try {
			if (checkboxes != null)
				bo = categoryService.addCategory(category, checkboxes);
			else
				bo = categoryService.addCategory(category);

		} catch (Exception e) {
			e.printStackTrace();
			msg = "新增失敗";

		}

		// 回傳一個 JSON false or true JSP那邊顯示 成功或失敗
		return "{\"sucess\":" + bo + ",\"status\":\"" + msg + "\"}";
	}

	@RequestMapping("/remember")
	public void remember(Boolean remembAccount, String account, HttpServletResponse response,
			HttpServletRequest request) {
		System.out.println("COOKIE 設定成功");
		if (remembAccount == true) {
			Cookie cookie = new Cookie("rem", account);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			response.addCookie(cookie);

		} else {

			Cookie[] cookies = request.getCookies();
			if (null == cookies) {
				System.out.println("沒有cookie==============");
			} else {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("rem")) {
						cookie.setValue(null);
						cookie.setMaxAge(0);// 立即刪除cookie
						cookie.setPath("/");
						System.out.println("記住帳號已刪除");
						response.addCookie(cookie);
						break;
					}
				}
			}
		}

	}

	@RequestMapping("/editcategory")
	public String editcategory(Category category,
			@RequestParam(value = "checkboxes[]", required = false) Integer[] checkboxes) {
		boolean bo = false;
		String msg = "新增成功";

		try {

			bo = categoryService.editCategory(category, checkboxes);

		} catch (Exception e) {
			e.printStackTrace();
			msg = "新增失敗";

		}

		// 回傳一個 JSON false or true JSP那邊顯示 成功或失敗
		return "{\"sucess\":" + bo + ",\"status\":\"" + msg + "\"}";
	}

	// 接收參數為CATEGORY的PID 返回旗下的全部子ID 配合select2使用
	@RequestMapping("/categories")
	public List<Category> categories(Integer pid, String keyword) {
		System.out.println(keyword);
		if (keyword == null) {
			return categoryService.findByParentId(pid);
		} else {
			return categoryService.findByNameContainingAndParentId(keyword, pid);
		}

//NULL 則 全部
//2跟3都是PID
		// 回傳LIST JSON 這是CATEGORY

	}

	@RequestMapping("/properties")
	public List<Property> properties(Integer categoryId) {
		return categoryService.findById(categoryId).getProperty();

	}

	@PostMapping("/addcarousel")
	public String addcarousel(MultipartFile file, Carousel carousel) {

		carousel.setImageSrc(UploadUtil.upload(file));
		carouselService.save(carousel);
		return "ok";
	}

	@PostMapping("/modifycarousel")
	public String modifycarousel(MultipartFile file, String hyperlink, Integer id) {

		carouselService.modify(UploadUtil.upload(file), hyperlink, id);
		return "ok";
	}

	@PostMapping("/carousel")
	public List<Carousel> carousel() {
		return carouselService.findAll();
	}

	@PostMapping("/deletecarousel")
	public void deletecarousel(@RequestParam("row[]") Integer row[]) {
		carouselService.delete(row);

	}

	@PostMapping("/reviewlist")
	public List<Review> reviewlist() {
		return reviewService.findAll();

	}

	@PostMapping("/modifyreview")
	public void modifyreview(Integer id, String reply) {

		reviewService.modifyReview(id, reply);

	}

	@PostMapping("/deletereview")
	public void deletereview(@RequestParam("id[]") Integer id[]) {

		reviewService.deleteByIdIn(id);

	}

	@PostMapping("/deleteorder")
	public void deleteorder(@RequestParam("id[]") Integer id[]) {
		orderService.deleteByIdIn(id);
	}

	@PostMapping("/modifyorder")
	public void modifyorder(@RequestParam("id[]") Integer[] id, Integer status) {

		orderService.modifyStatus(id, status);

	}

	@PostMapping("/orderlist")
	public List<Order> orderlist() {

		return orderService.findAll();
	}

	@PostMapping("/changeStatus")
	public String changeStatus(@RequestParam("id[]") Integer id[], boolean status) {
		productSkuService.changeStatus(id, status);
		return "ok";
	}

	@RequestMapping("/brandlist")
	public List<Brand> brandlist() {
		return brandService.findAll();

	}

	@PostMapping("/addBrand")
	public String addBrand(MultipartFile file, Brand brand) {

		brand.setBrandLog(UploadUtil.upload(file));
		brandService.save(brand);
		return "ok";
	}

	@PostMapping("/deletBrand")
	public String deletBrand(@RequestParam("id[]") Integer id[]) {

		brandService.delete(id);
		return "ok";
	}

	@RequestMapping("/chartJson")
	public Map<String, Integer> chartJson(String date) {

		Map<String, Integer> map = categoryService.chartJson(date);

		return map;
	}

	@RequestMapping("/changeEmployeeStatus")
	public String banEmployee(@RequestParam("id[]") Integer[] id, Boolean status) {
		employeeService.changeStatus(id, status);
		return "ok";

	}

	@RequestMapping("/verifyEmployee")
	public String verifyEmployee(@RequestParam("id[]") Integer[] id, Boolean status) {
		employeeService.verifyStatus(id, status);
		return "ok";

	}

}
