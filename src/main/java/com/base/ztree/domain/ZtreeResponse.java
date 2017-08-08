package com.base.ztree.domain;

/**
 * 菜单树
 * @author LingDu
 */
public class ZtreeResponse {
	private String id;
	private String pId;
	private String name;
	private String open; //该菜单是否默认展开
	private String isParent;//记录 treeNode 节点是否为父节点。
	private String iconOpen; //展开时的图标
	private String iconClose;//关闭时的图标
	private String icon; //默认图标
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getIconOpen() {
		return iconOpen;
	}
	public void setIconOpen(String iconOpen) {
		this.iconOpen = iconOpen;
	}
	public String getIconClose() {
		return iconClose;
	}
	public void setIconClose(String iconClose) {
		this.iconClose = iconClose;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getIsParent() {
		return isParent;
	}
	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}
	@Override
	public String toString() {
		return "ZtreeResponse [id=" + id + ", pId=" + pId + ", name=" + name + ", open=" + open + ", isParent="
				+ isParent + ", iconOpen=" + iconOpen + ", iconClose=" + iconClose + ", icon=" + icon + "]";
	}
	
}
