package com.base.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.base.user.domain.UserVO;
import com.base.user.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	/**
	 * 跳转到登录页面
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpSession session) {
		if (session.getAttribute("s_user") != null) {// 已经登录
			return "redirect:main.action";
		} else {// 未登录
			return "login";
		}

	}

	/**
	 * 登录处理
	 * 
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping("/doLogin")
	public String doLogin(HttpSession session, @RequestParam(required = true) String account,
			@RequestParam(required = true) String pwd, ModelMap map) throws Throwable {
		UserVO user = userService.checkLogin(account, pwd);
		if (user != null) {// 登录成功
			// 设置当前用户到session
			session.setAttribute("s_user", user);

			// 跳转到后台主页
			return "redirect:main.action";

		} else {// 登录失败
			map.addAttribute("msg", "账号或密码错误！");
			return "login";
		}

	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	/**
	 * 注销
	 * 
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "redirect:login.action";
	}

}
