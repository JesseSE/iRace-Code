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
	
	/**
	 * 组长上传阶段性提交产物
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="submit")
	@ResponseBody
	public Object uploadSubmit(@RequestParam("inputfile")MultipartFile file,
			@RequestParam("submitname")String submitName,
			@RequestParam("describle")String describle,
			@RequestParam("applyidforsubmit")int applyId,
			HttpServletRequest request) throws IOException{
		
		System.out.println("开始处理submit文件：\n"+submitName+"   "+ describle + "   " + applyId);
		
		
		
		if(file != null) {
			String originalName = file.getOriginalFilename();
			String suffix = originalName.substring(originalName.lastIndexOf('.'), originalName.length());
	        
	        if(this.isRarFile(suffix)) {
	        	//目前的文件上传大小限制为5M
	        	//if(file.getSize() < Constants.UPLOAD_FILE_SIZE_LIMIT) { 5242880
	        	if(file.getSize() < 52428800) { 
	        		try {
			        	String fileName = this.submitFileName(originalName);
			        	String filePath = this.generatePath(applyId);
			        	String fileUrl = filePath + fileName;
			        	System.out.println(fileUrl);
			        	//判断目录是否存在			        	
			        	File submitFile = new File(fileUrl);
			        	if(!submitFile.exists()){
			        		submitFile.mkdirs();
			        	}
						file.transferTo(submitFile);
						//将存储路径记录到数据库中
						this.recordSubmit(applyId, submitName, describle, fileUrl);
						
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
		
	/**
	 * 将提交路径存储到数据库中
	 * @param submitName
	 * @param describle
	 * @param fileUrl
	 */
	private void recordSubmit(int applyId, String submitName, String describle,
			String fileUrl) {
		
		
	}

	//根据小组所在的比赛，选择文件的存储位置
	private String submitFileName(String originalFileName) {		
		return originalFileName.trim();
	}
	
	//根据小组所在的比赛，选择文件的存储位置
	private String generatePath(int apply) {
		return "D:/下载/irace/submit/";
	}
	/**
	 * 判断上传文件是否是压缩包
	 * @param suffix
	 * @return
	 */
	private boolean isRarFile(String suffix) {
		boolean r = false;
		String []list = {".rar",".zip"};
		for(String s : list) {
			if(s.equalsIgnoreCase(suffix)) {
				r=true;
				break;
			}
		}
		return r;
	}
}
