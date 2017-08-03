package com.base.user.service;

import java.util.Map;

import com.base.common.domain.PageVO;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.base.user.domain.UserVO;

public interface UserService {
	public void addUser(UserVO user) throws Throwable;

	public void deleteUser(String id) throws Throwable;

	public void updateUser(UserVO user) throws Throwable;

	public UserVO getUserByAccount(String account) throws Throwable;

	public UserVO getUserById(String id) throws Throwable;

	public UserVO checkLogin(String account, String pwd) throws Throwable;

	/**
	 * 使用datatables的分页查询
	 * 
	 * @param request
	 * @return
	 */
	public DataTablesResponse<UserVO> list(DataTablesRequest request) throws Throwable;

	/**
	 * 普通分页查询
	 * 
	 * @param request
	 * @return
	 */
	public PageVO<UserVO> list(PageVO<UserVO> pagevo, Map<String, Object> request) throws Throwable;

	public int update(String userid, String oldpassword, String newpassword) throws Exception;
}
