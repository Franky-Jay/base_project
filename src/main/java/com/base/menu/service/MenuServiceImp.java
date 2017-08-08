package com.base.menu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.menu.dao.MenuVOMapper;
import com.base.menu.domain.MenuVO;
import com.base.menu.domain.MenuVOExample;
import com.base.ztree.domain.ZtreeResponse;



@Service
public class MenuServiceImp implements MenuService {
	@Autowired
	private MenuVOMapper mapper;
	/**
	 * 新增
	 * @param entity
	 * @return
	 */
	@Override
	public int add(MenuVO entity) {
		return mapper.insertSelective(entity);
	}
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@Override
	public int delete(String id) {
		MenuVOExample example = new MenuVOExample();
		example.createCriteria().andPidLike(id + "%");
		mapper.deleteByExample(example);
		return mapper.deleteByPrimaryKey(id);
	}
	/**
	 * 修改
	 * @param entity
	 * @return
	 */
	@Override
	public int update(MenuVO entity) {
		return mapper.updateByPrimaryKeySelective(entity);
	}
	/**
	 * 查询
	 * @param id
	 * @return
	 */
	@Override
	public List<MenuVO> getAllParent(String pid) {
		MenuVOExample example = new MenuVOExample();
		example.createCriteria().andPidEqualTo(pid);
		List<MenuVO> list = mapper.selectByExample(example);
		if(list != null){
			return list;
		}
		return null;
	}
	@Override
	public List<MenuVO> getMenuFromPid(String pid) {
		MenuVOExample example = new MenuVOExample();
		example.createCriteria().andPidLike(pid);
		List<MenuVO> list = mapper.selectByExample(example);
		if(list != null){
			return list;
		}
		return null;
	}
	
	@Override
	public MenuVO get(String id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	@Override
	public List<ZtreeResponse> getAllMenu() {
		List<ZtreeResponse> ztreeList = new ArrayList<ZtreeResponse>();
		List<MenuVO> parentMenu = this.getAllParent("0");
		if (parentMenu != null && parentMenu.size() > 0) {
			for (MenuVO one : parentMenu) {
				ZtreeResponse fzr = new ZtreeResponse();
				fzr.setId(one.getId());
				fzr.setpId(one.getPid());
				fzr.setName(one.getName());
				fzr.setOpen(one.getOpen());//所有父级默认展开
				fzr.setIconOpen(one.getIconopen());//../resources/assets/css/img/diy/1_open.png
				fzr.setIconClose(one.getIconclose());
				fzr.setIsParent("true");
				ztreeList.add(fzr);
				List<MenuVO> submenu = this.getMenuFromPid(one.getId());
				if (submenu != null && submenu.size() > 0) {
					for (MenuVO two : submenu) {
						ZtreeResponse szr = new ZtreeResponse();
						szr.setId(two.getId());
						szr.setpId(two.getPid());
						szr.setName(two.getName());
						szr.setOpen(two.getOpen());
						szr.setIconOpen(two.getIconopen());//../resources/assets/css/img/diy/1_open.png
						szr.setIconClose(two.getIconclose());
						szr.setIsParent("false");
						ztreeList.add(szr);
						List<MenuVO> threeBtn = this.getMenuFromPid(two.getId());
						if (submenu != null && submenu.size() > 0) {
							for (MenuVO three : threeBtn) {
								ZtreeResponse tzr = new ZtreeResponse();
								tzr.setId(three.getId());
								tzr.setpId(three.getPid());
								tzr.setName(three.getName());
								tzr.setOpen(three.getOpen());
								tzr.setIcon(three.getIcon());
								tzr.setIsParent("false");
								ztreeList.add(tzr);
							}
						}
					}
				}
			}
		}
		return ztreeList;
	}
}
