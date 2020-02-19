/**
 * PaymentServices class - encapsulates PayPal payment integration functions.
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package com.deathasaku.util;

import java.util.ArrayList;
import java.util.List;

import com.deathasaku.entity.CartItem;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaymentServices {
	private static final String CLIENT_ID = "ARl5ufSK8LIEcy9wW8lxlGN9C0AiwWeV19lKBLQYTd7v_txNljwTNm7539a_sg9XKnQXCBr4Ze-wzX1W";
	private static final String CLIENT_SECRET = "EJZEIf1z2XsMpT7nQnZC9jTI-C4Gc2JAGxjbqqkKvDdeijIVs7grLIv8nf521jZblYuxmG1hEThV-PwL";
	private static final String MODE = "sandbox";

	public String authorizePayment(List<CartItem> cartItems ,String url) throws PayPalRESTException {

		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectURLs(url);
		List<Transaction> listTransaction = getTransactionInformation(cartItems);// 改這

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);//
		requestPayment.setRedirectUrls(redirectUrls);//
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		System.out.println("=== CREATED PAYMENT: ====");
		System.out.println(approvedPayment);

		return getApprovalLink(approvedPayment);

	}

	private Payer getPayerInformation() {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("William").setLastName("Peterson").setEmail("sb-0ot1v996440@personal.example.com");

		payer.setPayerInfo(payerInfo);

		return payer;
	}

	private RedirectUrls getRedirectURLs(String url) {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl(url+"/view/store/cancel.jsp");
		redirectUrls.setReturnUrl(url+"/store/review_payment");
		return redirectUrls;
	}

	public Integer cartlistTotal(List<CartItem> cartItems) {
		int sum = 0;
//打折後總價
		for (CartItem cartItem : cartItems) {
			sum = sum + cartItem.getBuyNumber() * (int) (cartItem.getProductsku().getOriginalPrice()
					* (cartItem.getProductsku().getSellingPrice() / 100F));

		}
		System.out.println("total" + sum);
		return sum;
	}

	private List<Transaction> getTransactionInformation(List<CartItem> cartItems) {
		
		Integer total= cartlistTotal(cartItems);
		Integer tax=(int) (cartlistTotal(cartItems) * 0.05F);
		Integer all=cartlistTotal(cartItems)+tax+60;
		Details details = new Details();
		details.setShipping("60");// 運費固定
		details.setSubtotal(String.valueOf(total));// 稅前 5%
		details.setTax(String.valueOf(tax));// 總價*稅率

		Amount amount = new Amount();
		amount.setCurrency("TWD");
		amount.setTotal(String.valueOf(all));// 總價
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription("鴨鴨商城商品訂單");// 交易的描述

		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<>();

		for (CartItem cartItem : cartItems) {
			System.out.println(cartItem.toString());
			Item item = new Item();
			item.setCurrency("TWD");
			item.setName(
					cartItem.getProductsku().getProduct().getProductName() + ":" + cartItem.getProductsku().getSpec());
			System.out.println("prict->"
					+ cartItem.getProductsku().getOriginalPrice() * cartItem.getProductsku().getSellingPrice() / 100);
			item.setPrice(String.valueOf(
					cartItem.getProductsku().getOriginalPrice() * cartItem.getProductsku().getSellingPrice() / 100));//
			// item.setTax();
			item.setQuantity(String.valueOf(cartItem.getBuyNumber()));
			items.add(item);
		}

		itemList.setItems(items);

		transaction.setItemList(itemList);

		List<Transaction> listTransaction = new ArrayList<>();
		listTransaction.add(transaction);

		return listTransaction;
	}

	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;

		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}

		return approvalLink;
	}

	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);
	}

	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}

}
