package com.deathasaku.util;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import com.deathasaku.dao.UserRepository;
import com.deathasaku.entity.User;

public class forgetpassword {
	public static void send(String name, String email, String mailsubject, String mailmessage,User user1) {
		UserRepository Userrepository = null;
		
		String user = "eeit11019@gmail.com";// user
		String pwd = "Do!ng123";// password
		String to = email;
		String from = "eeit11019@gmail.com";// 寄件人的email
		
	 	User agg = Userrepository.findByEmail(email);
	 	System.out.println(agg.getPassword());
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "你的密碼";
//		try {
//			subject=MimeUtility.encodeText(subject,
//			        "UTF-8", null);
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		String body = "智障兒你的密碼:"+user1.getPassword();

		// 建立一個Properties來設定Properties
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", host);
		properties.setProperty("mail.smtp.port", "465");

		properties.put("mail.smtp.auth", "true");// 需要驗證帳號密碼
		// SSL authentication
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// 建立一個Session物件，並把properties傳進去
		Session mailSession = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
		});

		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			// 設定郵件
			message.setFrom(new InternetAddress(from)); // 設定寄件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
			message.setSubject(subject, "UTF-8"); // 設定主旨

			// 宣告一個multipart , 它可以使內文有不同的段落，
			// 使其可以用用來夾帶內文及檔案
			Multipart multipart = new MimeMultipart();
			// 第一個段落
			BodyPart messageBodyPart = new MimeBodyPart(); // 宣告一個BodyPart用以夾帶內文
			messageBodyPart.setContent(body, "text/html; charset=UTF-8");
			multipart.addBodyPart(messageBodyPart); // 把BodyPart加入Multipart
			// 第二個段落
//            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
//            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
//            DataSource source = new FileDataSource(filename);//讀取檔案
//            fileBodyPart.setDataHandler(new DataHandler(source));
//            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
//            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）

			message.setContent(multipart); // 設定eMultipart為messag的Content
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, user, pwd);
			// 傳送信件
			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("發送成功");
			// 關閉連線
			transport.close();

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}
}

