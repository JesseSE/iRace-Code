/**
 * 
 */
package com.irace.util;

import java.util.List;

import com.irace.entity.IEntity;
import com.irace.entity.RaceEntity;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * @author Tracy
 *
 */
public class JsonUtil {
	
	/**
	 * 将实体对象的list转换成json串
	 * @param obj
	 * @param filterAttrs 实体中需要过滤的属性
	 * @return
	 */
	public static String listToJSONString(List list, String[] filterAttrs) {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setExcludes(filterAttrs);
		return JSONArray.fromObject(list, config).toString();
	}
	
	/**
	 * 将实体对象转换成json串
	 * @param obj
	 * @param filterAttrs 实体中需要过滤的属性
	 * @return
	 */
	public static String objectToJSONString(Object obj, String[] filterAttrs) {
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.setExcludes(filterAttrs);
		return JSONObject.fromObject(obj, config).toString();
	}
	
	/**
	 * 把带有getMap方法的实体转化成JSON串
	 * @param list
	 * @return
	 */
	public static String getJsonByMapList(List<IEntity> list) {
		JSONArray json = new JSONArray();
		for(IEntity entity:list) {
			json.add(entity.getMap());
		}
		return json.toString();
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
	
	public static String getJsonLoginTimeOut() {
		return getJsonInfo(InfoCode.LOGIN_TIMEOUT,"登录超时");
	}
	
	public static String getJsonOtherError(String info) {
		return getJsonInfo(InfoCode.OTHER_ERROR,info);
	}
	
}
