package com.deathasaku.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class UploadUtil {
	public static String storeupload(MultipartFile multipartFile) {
		if (!multipartFile.isEmpty()) {
			try {
				// 路徑直接從SERVLETCONTEXT 裡面去找出WEBINF的位置 在底下檢查有沒有UPLOAD的資料夾
				// 沒有就創 未來位置要再調整過 跟前台可能要做區別分開 或是偷懶直接塞再一起? 寫得不錯可惜要放棄ㄏㄏ
				// 因為ECLIPSE每次部屬都會清空窩ㄉ資料夾 糙

				// String url = httpServletRequest.getServletContext().getRealPath("/WEB-INF") +
				// File.separator + "upload";
				String url = "/upload";
				// System.out.println("url- >" + url);
				// UploadUtil.class.getClassLoader().getResource("").getPath() + File.separator
				// + "upload";// File.separator
				// +
				// "upload";
				// 存放目錄檢查
				File dir = new File(url);

				if (!dir.exists())
					dir.mkdirs();
				// 寫文件到服務器

				File serverFile = new File(url);
				// CTEATETEMPFILE 可以保證 他一定是創一個絕對唯一的資料
				serverFile = File.createTempFile("img", multipartFile.getOriginalFilename()
						.substring(multipartFile.getOriginalFilename().lastIndexOf(".")), serverFile);
				System.out.println(serverFile.getName());
//new File(dir.getAbsolutePath() + File.separator + multipartFile.getOriginalFilename());
				System.out.println(dir.getAbsolutePath());
				multipartFile.transferTo(serverFile);

				System.out.println(url + "/" + serverFile.getName());

				// 返回路徑只會 用固定的相對路徑 不管項目怎麼取名 路徑都不會錯 +名稱
				return "/admin/upload/" + serverFile.getName();
			} catch (Exception e) {

				return "You failed to upload " + multipartFile.getOriginalFilename() + " => " + e.getMessage();
			}
		} else {

			return "/admin/upload/nouse.png";
		}

	}

	// 商品圖片上傳 返回路徑 給SRC=""用
	public static String upload(MultipartFile multipartFile) {
		if (!multipartFile.isEmpty()) {
			try {
				// 路徑直接從SERVLETCONTEXT 裡面去找出WEBINF的位置 在底下檢查有沒有UPLOAD的資料夾
				// 沒有就創 未來位置要再調整過 跟前台可能要做區別分開 或是偷懶直接塞再一起? 寫得不錯可惜要放棄ㄏㄏ
				// 因為ECLIPSE每次部屬都會清空窩ㄉ資料夾 糙

				// String url = httpServletRequest.getServletContext().getRealPath("/WEB-INF") +
				// File.separator + "upload";
				String url = "/upload";
				// System.out.println("url- >" + url);
				// UploadUtil.class.getClassLoader().getResource("").getPath() + File.separator
				// + "upload";// File.separator
				// +
				// "upload";
				// 存放目錄檢查
				File dir = new File(url);

				if (!dir.exists())
					dir.mkdirs();
				// 寫文件到服務器

				File serverFile = new File(url);
				// CTEATETEMPFILE 可以保證 他一定是創一個絕對唯一的資料
				serverFile = File.createTempFile("img", multipartFile.getOriginalFilename()
						.substring(multipartFile.getOriginalFilename().lastIndexOf(".")), serverFile);
				System.out.println(serverFile.getName());
				// new File(dir.getAbsolutePath() + File.separator +
				// multipartFile.getOriginalFilename());
				System.out.println(dir.getAbsolutePath());
				multipartFile.transferTo(serverFile);

				System.out.println(url + "/" + serverFile.getName());

				// 返回路徑只會 用固定的相對路徑 不管項目怎麼取名 路徑都不會錯 +名稱
				return "/upload/" + serverFile.getName();
			} catch (Exception e) {

				return "You failed to upload " + multipartFile.getOriginalFilename() + " => " + e.getMessage();
			}
		} else {

			return "You failed to upload " + multipartFile.getOriginalFilename() + " because the file was empty.";
		}

	}

	// 一般上傳 返回路徑 給SRC=""用
	public static String upload(MultipartFile multipartFile, HttpServletRequest httpServletRequest) {
		if (!multipartFile.isEmpty()) {
			try {
				// 路徑直接從SERVLETCONTEXT 裡面去找出WEBINF的位置 在底下檢查有沒有UPLOAD的資料夾
				// 沒有就創 未來位置要再調整過 跟前台可能要做區別分開 或是偷懶直接塞再一起? 寫得不錯可惜要放棄ㄏㄏ
				// 因為ECLIPSE每次部屬都會清空窩ㄉ資料夾 糙

				// String url = httpServletRequest.getServletContext().getRealPath("/WEB-INF") +
				// File.separator + "upload";
				String url = "/upload";
				// System.out.println("url- >" + url);
				// UploadUtil.class.getClassLoader().getResource("").getPath() + File.separator
				// + "upload";// File.separator
				// +
				// "upload";
				// 存放目錄檢查
				File dir = new File(url);

				if (!dir.exists())
					dir.mkdirs();
				// 寫文件到服務器

				File serverFile = new File(url);
				// CTEATETEMPFILE 可以保證 他一定是創一個絕對唯一的資料
				serverFile = File.createTempFile("img", multipartFile.getOriginalFilename()
						.substring(multipartFile.getOriginalFilename().lastIndexOf(".")), serverFile);
				System.out.println(serverFile.getName());
//new File(dir.getAbsolutePath() + File.separator + multipartFile.getOriginalFilename());
				System.out.println(dir.getAbsolutePath());
				multipartFile.transferTo(serverFile);

				System.out.println(url + "/" + serverFile.getName());

				// 返回路徑只會 用固定的相對路徑 不管項目怎麼取名 路徑都不會錯 +名稱
				return "/admin/upload/" + serverFile.getName();
			} catch (Exception e) {

				return "You failed to upload " + multipartFile.getOriginalFilename() + " => " + e.getMessage();
			}
		} else {

			return "You failed to upload " + multipartFile.getOriginalFilename() + " because the file was empty.";
		}

	}

	// 返回JSON 給CKEDITOR用的
	public static String uploadJson(HttpServletRequest httpServletRequest, MultipartFile multipartFile) {
		if (!multipartFile.isEmpty()) {
			try {
				// 路徑直接從SERVLETCONTEXT 裡面去找出WEBINF的位置 在底下檢查有沒有UPLOAD的資料夾
				// 沒有就創 未來位置要再調整過 跟前台可能要做區別分開 或是偷懶直接塞再一起? 寫得不錯可惜要放棄ㄏㄏ
				// 因為ECLIPSE每次部屬都會清空窩ㄉ資料夾 糙

				// String url = httpServletRequest.getServletContext().getRealPath("/WEB-INF") +
				// File.separator + "upload";
				String url = "/upload";
				// System.out.println("url- >" + url);
				// UploadUtil.class.getClassLoader().getResource("").getPath() + File.separator
				// + "upload";// File.separator
				// +
				// "upload";
				// 存放目錄檢查
				File dir = new File(url);

				if (!dir.exists())
					dir.mkdirs();
				// 寫文件到服務器

				File serverFile = new File(url);
				// CTEATETEMPFILE 可以保證 他一定是創一個絕對唯一的資料
				serverFile = File.createTempFile("img", multipartFile.getOriginalFilename()
						.substring(multipartFile.getOriginalFilename().lastIndexOf(".")), serverFile);
				System.out.println(serverFile.getName());
//new File(dir.getAbsolutePath() + File.separator + multipartFile.getOriginalFilename());
				System.out.println(dir.getAbsolutePath());
				multipartFile.transferTo(serverFile);

				System.out.println(url + "/" + serverFile.getName());

				// 返回路徑只會 用固定的相對路徑 不管項目怎麼取名 路徑都不會錯 +名稱
				// 笑死 手動返回JSON 牛逼嗎 這邊有點寫死 不過反正他只是一格戰存而已? 喔不對內 他會寫到HTML裡面 鄵機芭樂 難道這邊不能寫成ELㄇ 不能好ㄇ
				// 前端有解嗎
				// 其實意思一樣吧 如果端是用CTX 那跟這裡的意思也是一樣啊 兩邊童意思而已 所以到底要步要留部屬路徑 要先想好 不然到時候資料 會死一片
				// 死在專案名上 ㄏㄏ
				return "{\"uploaded\":1,\"url\":" + "\"" + httpServletRequest.getContextPath() + "/admin/upload/"
						+ serverFile.getName() + "\"}";
			} catch (Exception e) {

				return null;
			}
		} else {
			return null;
		}

	}

}
