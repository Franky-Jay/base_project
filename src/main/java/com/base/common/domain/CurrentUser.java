package com.base.common.domain;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.base.common.util.SpringUtil;
import com.base.user.domain.UserVO;

@Component
@Scope("session")
public class CurrentUser {
	public static CurrentUser getInstance(){
		return SpringUtil.getBean(CurrentUser.class);
	}
	
	@Autowired
	private HttpSession session;
	
	/**
	 * 获取当前用户对象，登录成功或设置到session
	 * @return
	 */
	public UserVO getCurrentUser(){
		UserVO user=(UserVO)session.getAttribute("s_user");
		return user;
	}
	/**
	 * 获取当前登录用户ID
	 * @return
	 */
	public String getUserId(){
		UserVO user=getCurrentUser();
		if(user!=null){
			return user.getId();
		}
		return null;
	}
	
	/**
	 * 获取当前登录用户name
	 * @return
	 */
	public String getUserName(){
		UserVO user=getCurrentUser();
		if(user!=null){
			return user.getName();
		}
		return null;
	}
	
	/**
	 * 获取当前登录账号
	 * @return
	 */
	public String getAccount(){
		UserVO user=getCurrentUser();
		if(user!=null){
			return user.getAccount();
		}
		return null;
	}
	
	
	
}
