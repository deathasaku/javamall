package com.deathasaku.websocket;

import java.lang.reflect.Type;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.deathasaku.dao.EmployeeRepository;
import com.deathasaku.entity.Message;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

//gson的工具類
@Component
public class GsonUtils {
	// 我要開掛了各位


	// 線程安全的
	private static final Gson GSON;
	static {
		GSON = new GsonBuilder()
				//.registerTypeAdapter(Message.class, new DefineDeserializer())
//	            .setVersion(2.0)  //需要結合註解使用，有的字段在1。0的版本的時候解析，但0。1版本不解析
				.create();
	}

	//改天吧各位 為了要用AUTOWIRED 去拿DAO 只能拆出去QQ
//	public static class DefineDeserializer implements JsonDeserializer<Message> {
//
//		@Override
//		public Message deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) {
//
//			Message message = new Message();
//
//			JsonObject jsonObject = json.getAsJsonObject();
//
//			JsonElement name = jsonObject.get("name");
//			JsonElement text = jsonObject.get("text");
//			message.setText(text.getAsString());
//			
//
//			JsonElement from = jsonObject.get("fromUser");
//			//employeeRepository.getOne(from.getAsInt());
//			return message;
//		}
//	}
	

	// 獲取gson解析器
	public static Gson getGson() {
		return GSON;
	}

	// 對象轉換為json
	public static String toJson(Object object) {
		return GSON.toJson(object);
	}

	// 反序列化
	// JSON轉換為對象1--普通類型
	public static <T> T fromJson(String json, Class<T> classOfT) {
		return GSON.fromJson(json, classOfT);
	}

	// JSON轉換為對象-針對泛型的類型
	public static <T> T fromJson(String json, Type typeOfT) {
		return GSON.fromJson(json, typeOfT);
	}

}
