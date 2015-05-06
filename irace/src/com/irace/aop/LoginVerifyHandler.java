/**
 * 
 */
package com.irace.aop;

import java.lang.reflect.Method;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;  

import com.irace.util.JsonUtil;
import com.irace.view.View;

/**
 * @author Tracy
 *
 */
@Aspect
@Component
public class LoginVerifyHandler {

	
	@Around("@annotation(cn.edu.bjtu.zsw.wx.aop.LoginVerify)") 
	public Object verifyAround(ProceedingJoinPoint joinPoint) throws Throwable {
		
        String methodName = joinPoint.getSignature().getName();  
        Object target = joinPoint.getTarget();
        Method method = this.getMethodByClassAndName(target.getClass(), methodName); //得到拦截的方法  
        Object[] args = joinPoint.getArgs();	//方法的参数 
        boolean hasSessionArgument = false;
        HttpSession session = null;
        for(Object arg : args) {
        	if(arg != null) {
        		if(arg.getClass().getName().equals("org.apache.catalina.session.StandardSessionFacade")) {
            		hasSessionArgument = true;
            		session = (HttpSession) arg;
            		break;
            	}
        	}
        }
        
        if(!hasSessionArgument) {
        	throw new Exception("没有检测到HttpSession参数！");
        } else {
        	if(session.getAttribute("aid") != null) { //当aid不为空的时候  视为已经登录
                return joinPoint.proceed();
        	} else {
                Class returnType = method.getReturnType();//得到方法返回值类型  
                if(returnType == String.class) { //如果返回值为Stirng  
                    return JsonUtil.getJsonLoginTimeOut();
                } else if(returnType == View.class) {
                	return new View("home","user","login","登录"); 
                } else {  //当使用Ajax的时候 可能会出现这种情况  
                    
                	throw new Exception("错误的返回类型，此注解适用的方法返回值需为View或者是String！");
                	//return null;
                }
        	}
        }
            
        
	}
	
	
	/** 
     * 根据类和方法名得到方法 
     */  
    public Method getMethodByClassAndName(Class c , String methodName){  
        Method[] methods = c.getDeclaredMethods();  
        for (Method method : methods) {  
            if(method.getName().equals(methodName)){  
                return method ;  
            }  
        }
        return null;  
    }
	
}
