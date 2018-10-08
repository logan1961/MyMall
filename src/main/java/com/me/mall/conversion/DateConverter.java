package com.me.mall.conversion;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 日期转换的Converter,从前台转换
 * String表示页面穿过来的类型
 * Date表示转换后的类型
 * @author LLLLogan
 *
 */
public class DateConverter implements Converter<String, Date>{

	@Override
	public Date convert(String source) {
		if (null != source) {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				// 将字符串日期格式转换成Date
				return format.parse(source);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
}
