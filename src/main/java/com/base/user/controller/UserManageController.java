package com.base.user.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import com.base.common.domain.CurrentUser;
import com.base.common.domain.JsonResult;
import com.base.common.util.MD5Util;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.user.domain.UserVO;
import com.base.user.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserManageController {
	@Autowired
	private UserService service;

	/**
	 * 跳转到列表页面
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	public String list() {
		//System.out.println("uri:" + request.getRequestURI());
		return "user/list";
	}

	@RequestMapping("/rest/doSearch")
	public @ResponseBody DataTablesResponse<UserVO> pageSearch(@RequestBody DataTablesRequest request)
			throws Throwable {

		return service.list(request);
	}

	/**
	 * 跳转到编辑页面
	 * 
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping("/edit")
	public ModelAndView add(String id) throws Throwable {
		ModelAndView model = new ModelAndView("user/edit");
		if (id != null) {// 修改
			model.addObject("user", service.getUserById(id));
		}
		return model;
	}

	/**
	 * 保存编辑
	 * 
	 * @param user
	 * @return
	 * @throws Throwable
	 */
	@RequestMapping("/doEdit")
	public ModelAndView doAdd(UserVO user, String[] roleId) throws Throwable {
		ModelAndView model = new ModelAndView("user/list");
		if (user.getId() != null && service.getUserById(user.getId()) != null) {// 修改
			service.updateUser(user);
		} else {// 新增
			service.addUser(user);
		}
		return model;
	}

	@RequestMapping("/doDel")
	public @ResponseBody JsonResult doDel(String id) throws Throwable {
		JsonResult rs = new JsonResult();
		service.deleteUser(id);
		rs.setStatus(1);
		rs.setMsg("删除成功！");
		return rs;
	}

	@RequestMapping("/update")
	public String update(String id, ModelMap map) throws Throwable {
		UserVO user = service.getUserById(id);
		map.addAttribute("user", user);
		return "user/edit";
	}

	/**
	 * 跳转到修改密码页面
	 * 
	 * @return
	 */
	@RequestMapping("/updatePassword")
	public String updatePassword() {
		return "user/password";
	}

	/**
	 * 执行修改密码
	 * 
	 * @return
	 */
	@RequestMapping("/doUpdatePassword")
	public String doUpdatePassword(String oldpassword, String newpassword, HttpServletRequest request)
			throws Throwable {
		String userid = CurrentUser.getInstance().getUserId();
		// 1代表成功 0代表失败
		int result = service.update(userid, oldpassword, newpassword);
		if (result == 1)
			return "redirect:main.action";
		else
			request.setAttribute("error", "原密码错误，请重新输入");
		return "user/password";
	}

	public static void main(String[] args) throws Exception {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		System.out.println(uuid);
		System.out.println(MD5Util.md5("123" + uuid));
	}
}
