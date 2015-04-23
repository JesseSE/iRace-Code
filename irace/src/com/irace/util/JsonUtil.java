/**
 * 
 */
package com.irace.util;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author Tracy
 *
 */
public class JsonUtil {

	/**
	 * 将实体对象的list转换成json串
	 * @param list
	 * @return
	 */
	public static String listToJSONString(List list) {
		JSONArray arr = new JSONArray();
		for(Object obj : list) {
			arr.add(JSONObject.fromObject(obj));
		}
		return arr.toString();
	}
	
	/**
	 * 将实体对象转换成json串
	 * @param obj
	 * @return
	 */
	public static String objectToJSONString(Object obj) {
		return JSONObject.fromObject(obj).toString();
	}
	
	/**
	 * 返回一个操作的结果，用json串表示
	 * @param code
	 * @param info
	 * @return
	 */
	public static String getJsonInfo(Integer code, String info) {
		return "{\"code\": "+code+", \"msg\": \""+info+"\"}";
	}
	
	/**
	 * 返回一个操作正确的结果，用json串表示
	 * @return
	 */
	public static String getJsonInfoOK() {
		return getJsonInfo(InfoCode.OK,"OK");
	}
}
