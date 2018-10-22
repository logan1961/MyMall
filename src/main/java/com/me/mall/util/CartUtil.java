package com.me.mall.util;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.me.mall.constant.MallConstant;
import com.me.mall.vo.CartVO;

public class CartUtil {
	
	/**
	 * 将Cookie中的购物车信息转换为cartvo对象
	 * @param request
	 * @return
	 */
	public static CartVO getCartVOFromCookie(HttpServletRequest request){
		CartVO cartVO = null;
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		// 将客户端中购物车cookie拿出来
		Cookie[] cookies = request.getCookies();
		if (null != cookies && cookies.length != 0) {
			for (Cookie cookie : cookies) {
				if (MallConstant.CART_COOKIE.equals(cookie.getName())) {
					// 找到了客户端cookie中购物车信息
					// "{\"cartItemVOList\":[{\"product\":{\"id\":278},\"amount\":10,\"isChecked\":1},{\"product\":{\"id\":183},\"amount\":2,\"isChecked\":0}]}"
					String value = cookie.getValue();
					try {
						// 将json字符串转换为Java对象
						cartVO = objectMapper.readValue(value,CartVO.class);
					} catch (JsonParseException e) {
						e.printStackTrace();
					} catch (JsonMappingException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return cartVO;
	}
	
	/**
	 * 将CartVO对象设置到Cookie中
	 * @param cartVO
	 * @param response
	 */
	public static void setCartVOToCookie(CartVO cartVO,HttpServletResponse response){
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象中不为null才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		// 将cartVo对象以json形式放到cookie
		StringWriter stringWriter = new StringWriter();
		try {
			objectMapper.writeValue(stringWriter, cartVO);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 将购物车json放到cookie
		Cookie cookie = new Cookie(MallConstant.CART_COOKIE, stringWriter.toString());
		// 设置cookie的存储时间
		cookie.setMaxAge(60 * 60 * 24);// 单位秒
		// 设置cookie路径
		cookie.setPath("/");
		// 将cookie发送到浏览器
		response.addCookie(cookie);
		
	}
}
