package com.base.menu.service;


import java.util.List;

import com.base.menu.domain.MenuVO;
import com.base.ztree.domain.ZtreeResponse;

public interface MenuService {
    /**
	 * 新增
	 * @param entity
	 * @return
	 */
	public int add(MenuVO entity);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int delete(String id);
	/**
	 * 修改
	 * @param entity
	 * @return
	 */
	public int update(MenuVO entity);
	/**
	 * 查询到所有的父级
	 * @param id
	 * @return
	 */
	public List<MenuVO> getAllParent(String pid);
	
	/**
	 * 通过父级去到子集
	 * @param id
	 * @return
	 */
	public List<MenuVO> getMenuFromPid(String pid);
	
	/**
	 * 获取单个菜单
	 * @param id
	 * @return
	 */
	public MenuVO get(String id);
	
	/**
	 * 拿到所有的菜单
	 * @return
	 */
	public List<ZtreeResponse> getAllMenu();
}
