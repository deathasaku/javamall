package com.deathasaku.restcontroller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.deathasaku.entity.CartItem;
import com.deathasaku.entity.Category;
import com.deathasaku.entity.Order;
import com.deathasaku.entity.OrderItem;
import com.deathasaku.entity.Product;
import com.deathasaku.entity.ProductSku;
import com.deathasaku.entity.Review;
import com.deathasaku.entity.User;
import com.deathasaku.service.CategoryService;
import com.deathasaku.service.OrderItemService;
import com.deathasaku.service.OrderService;
import com.deathasaku.service.ProductService;
import com.deathasaku.service.ProductSkuService;
import com.deathasaku.service.ReviewService;
import com.deathasaku.service.ShopCartService;

@RestController
@RequestMapping("/store")
public class StoreRest {
	@Autowired
	private ProductSkuService productSkuService;
	@Autowired
	ShopCartService shopCartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;

	@RequestMapping("/prodkus")
	public ProductSku getProdKus(Integer productSkuId) {
		return productSkuService.getOne(productSkuId);
	}

	@RequestMapping("/deleteCartItem")
	public String deleteCartItem(Integer userId, Integer productId, HttpSession session) {
		List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");

		// 刪掉LIST裡面的 物品
		Iterator<CartItem> it = list.iterator();
		while (it.hasNext()) {

			if (it.next().getProductsku().getId().equals(productId)) {
				it.remove();
			}
		}

		// 如果有登入 去資料庫刪除 但是港決這樣會有一些同步問題 可能用整個LIST去更新會比較好?
		if (session.getAttribute("username") != null) {

			shopCartService.deleteByUserIdAndProductskuId(userId, productId);
		}
		return "OK";
	}

	@RequestMapping("/addCartItem")
	public String addCartItem(Integer userId, Integer productId, Integer BuyNumber, HttpSession session) {
		System.out.println("新增購物車");
		List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");

		boolean flag = false;
		// 先在購物歌LIST裡面找有沒有 購買過此商品
		// 如果有的話就++
		for (CartItem cartItem : list) {
			if (cartItem.getProductsku().getId().equals(productId)) {
				cartItem.setBuyNumber(cartItem.getBuyNumber() + BuyNumber);
				flag = true;
				break;
			}
		}
		// 沒有的話就NEW出來再插進去
		CartItem cartItem = null;
		if (flag == false) {
			cartItem = new CartItem();
			cartItem.setProductsku(productSkuService.getOne(productId));
			cartItem.setBuyNumber(BuyNumber);
			list.add(cartItem);
		}

		// 如果有登入 就儲存全部
		// 因為 登錄過的話 LIST會被整合 裡面的東西都會被SETID
		// 所以如果遇到新的東西 或是被變更數量
		// DATA JPA會自動判斷 要INSERT還是UPDATE
		if (session.getAttribute("username") != null) {
			// 感覺不用這樣做 浪費效率
			for (CartItem cartItemtmp : list) {
				cartItemtmp.setUser((User) session.getAttribute("username"));
			}
			// 這樣看起來舒服多了
//			if (cartItem!=null) {
//				cartItem.setUser((User)session.getAttribute("username"));
//			}

			shopCartService.savaAll(list);
		}
		return "ok";
	}

	@RequestMapping("/productView")
	public Product getProductView(Integer view) {
		return productService.findOne(view);
	}
	@RequestMapping("/ordView")
	public List<OrderItem> getOrdView(Integer orderId) {
		return orderItemService.findByOrderId(orderId);
	}

	@RequestMapping("/addReview")
	@ResponseBody
	public Review addProductReview(Integer users, Integer products, Review review) {
		reviewService.save(review, users, products);
		return review;
	}
	@RequestMapping("/delectReview")
	public String delectProductReview(Integer reviewId) {
		return reviewService.deleteReview(reviewId);
	}

	@RequestMapping("/categoryAll")
	public List<Category> getCategoryJson(Integer parentId) {
		return categoryService.findByParentId(parentId);
	}


	@RequestMapping("/productCat")
	public List<Product> getProductCat(Integer categoryId) {
		Page<Product> product = productService.findCategoryIdLevelOnePage(0,categoryId);
		return product.getContent();
			}

	// ------------------------------------有問題
	@RequestMapping("/showCart")
	public List<CartItem> getshowcart(@RequestParam(required = false) Integer userId, HttpSession session) {
		// return (List<CartItem>) session.getAttribute("CartList");
		// 這裡要注意 如果布分別有沒有沒登錄 都回傳 SESION LIST 會導致覽加載問題
		// 我們SESSION裡面的CARTITEM LIST 有兩種 一種是我們自己撈的
		// 一種是自己NEW出來的 (未登入) 此時 JACKSON可以順利地轉換為 JSON 我們自己NEW的沒有設值就是NULL 所以不會有問題
		// 如果是 撈出來的因為有些 懶加載的數據 SESSION早就關閉了 即使你用 SPRING 的 延遲加載 FILTER 也沒用
		// 因為已經不是同一個REQUEST RESPONSE了
		// 因為覽加載的數據會先被換成PROXY類 等到要加載實在初始化
		// == 無解 只能用JACKSON 未加載的就不轉換了
		// 不是線蛙的生鮮資料就無解RRRRRRRRRRRㄐ到底 這種混合的要怎撈
		System.out.println("進入SHOWCART");

		if (session.getAttribute("username") == null)
			return shopCartService.mergeCartSku((List<CartItem>) session.getAttribute("CartList"));
		else {
			return shopCartService.findByUserId(((User) session.getAttribute("username")).getId());
		}

	}

	@RequestMapping("/updateCart")
	public Integer updateCart(Integer cartItemId, Integer buyNumber, HttpSession session) {
		List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");
		// 進到這裡時 可以保證已經登陸了
		for (CartItem cartItem : list) {

			if (cartItemId.equals(cartItem.getId())) {
				cartItem.setBuyNumber(buyNumber);
				break;
			}
		}

		shopCartService.savaAll(list);
		return buyNumber;
	}

	// OK
	@RequestMapping("/deletCart")
	public Integer deletCart(@RequestParam(required = false) Integer userId, Integer skuId, HttpSession session) {
		System.out.println("刪除購物車");
		List<CartItem> list = (List<CartItem>) session.getAttribute("CartList");
		Integer cartItemId = null;
		Iterator<CartItem> it = list.iterator();
		while (it.hasNext()) {
			CartItem cartItem = it.next();
			if (cartItem.getProductsku().getId().equals(skuId)) {
				cartItemId = cartItem.getId();
				it.remove();
			}
		}
		if (session.getAttribute("username") != null) {
			shopCartService.deleteByUserAndId(userId, cartItemId);
		}

		return cartItemId;
	}

	@RequestMapping("/orderlist")
	public List<Order> orderlist(HttpSession session) {
		User user = (User) session.getAttribute("username");

		return orderService.findById(user.getId());

	}
}
