package com.me.mall.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.me.mall.common.ServerResponse;

@Controller
@RequestMapping(value="/upload")
public class UploadController {
	
	@RequestMapping(value="/uploadImg")
	@ResponseBody
	public ServerResponse uploadImg(MultipartFile file){
		//防止文件因为重名而覆盖，随机生成一个名字xxxxxxxxxx
		String name = UUID.randomUUID().toString().replace("-", "");//生成的名字中间用-分隔，用空代替-
		//获得上传文件名的后缀jpg或png
		String extension = FilenameUtils.getExtension(file.getOriginalFilename());
		//拼接成最终的随机名xxxxxxx.jpg
		String fileName = name + "." + extension;
		//把文件保存到路径G:\pic
		String filePath = "G:\\pic\\" + fileName;
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return ServerResponse.createSuccess("上传成功",fileName);
	}
	
	//测试生成的随机名
	public static void main(String[] args) {
		String name = UUID.randomUUID().toString().replace("-", "");//生成的名字中间用-分隔，用空代替-
		System.out.println(name);
	}
}
