package com.base.menu.controller;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.common.domain.JsonResult;

import com.base.menu.domain.MenuVO;
import com.base.menu.service.MenuService;
import com.base.ztree.domain.ZtreeResponse;

@Controller
@RequestMapping("/menu")
public class MenuController {
	@Autowired
	private MenuService service;

	@RequestMapping("/edit")
	public String edit(String id, ModelMap map) {
		if (id != null) {
			map.addAttribute("entity", service.get(id));
		}
		return "menu/edit";// 跳转到编辑页面
	}

	@RequestMapping("/doEdit")
	public String doEdit(MenuVO entity) {
		if (entity.getId() != null) {// 修改
			service.update(entity);
		} else {// 新增
			service.add(entity);
		}
		return "redirect:/menu/list.action";// 跳转到列表页面
	}

	@RequestMapping("/rest/doDelete")
	public @ResponseBody JsonResult doDelete(String id) {
		JsonResult rs = new JsonResult();
		if(service.delete(id) > 0){
			rs.setStatus(1);
			rs.setMsg("删除成功！");
			return rs;
		}
		rs.setStatus(0);
		rs.setMsg("删除失败！");
		return null;
	}

	@RequestMapping("/list")
	public String list() {
		return "menu/list";// 跳转到分页查询页面
	}

	@RequestMapping("/getMenuTreeToJson")
	public @ResponseBody Set<ZtreeResponse> getMenuTreeToJson() {
		Set<ZtreeResponse> setMenu = new HashSet<ZtreeResponse>();
		List<ZtreeResponse> ztreeList = service.getAllMenu();
		if(ztreeList != null && ztreeList.size() > 0){
			for (ZtreeResponse ztreeResponse : ztreeList) {
				setMenu.add(ztreeResponse);
			}
		}
		return setMenu;
	}
}
