package com.irace.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.irace.util.Constants;
import com.irace.util.InfoCode;
import com.irace.util.JsonUtil;

@Controller
@RequestMapping("/upload/*")
public class FileUploadController {

	@RequestMapping("img")
	@ResponseBody
	public Object uploadAttachment(@RequestParam("uploadFile")MultipartFile file,
			HttpServletRequest request) throws IOException {
		if(file != null) {
			String originalName = file.getOriginalFilename();
			String suffix = originalName.substring(originalName.lastIndexOf('.'), originalName.length());
	        
	        if(this.isImgFile(suffix)) {
	        	if(file.getSize() < Constants.UPLOAD_FILE_SIZE_LIMIT) {
	        		try {
			        	String fileName = this.generateFileName(originalName);
			        	String filePath = Constants.DEFAULT_FILE_ABSOLUTE_ROOT+"/"+fileName;
			        	File source = new File(filePath);
						file.transferTo(source);
						
			        	return JsonUtil.getJsonInfo(InfoCode.OK, fileName);
					} catch (IllegalStateException e1) {
						// TODO Auto-generated catch block
						//e1.printStackTrace();
						return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, e1.getMessage());
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						//e1.printStackTrace();
						return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, e1.getMessage());
					}
	        	} else {
	        		return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "文件大小超过1M的限制!");
	        	}
	        } else {
	        	return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "文件不合法!");
	        }
	        
		} else {
			return JsonUtil.getJsonInfo(InfoCode.OTHER_ERROR, "文件不能为空!");
		}
	}
	
	private String generateFileName(String originalFileName) {
		Integer r = new Random(1000).nextInt() % 1000 + 1;
		return r + "-" + originalFileName.trim();
	}
	
	private boolean isImgFile(String suffix) {
		boolean r = false;
		String []list = {".png",".jpg",".gif"};
		for(String s : list) {
			if(s.equalsIgnoreCase(suffix)) {
				r=true;
				break;
			}
		}
		return r;
	}
	
}
