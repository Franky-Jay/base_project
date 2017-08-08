package com.common.dictionary.service;

import java.util.List;

import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.common.dictionary.domain.DictionaryVO;




/**
 * 字典接口
 * 
 * @author wurui
 */
public interface DictionaryService {
	/**
	 * 添加字典
	 * 
	 * @param cust
	 */
	public void addDictionary(DictionaryVO dictionary) throws Throwable;

	/**
	 * 根据id删除字典
	 * 
	 * @param id
	 */
	public void deleteDictionary(String id) throws Throwable;

	public void updateDictionary(DictionaryVO dictionary) throws Throwable;

	public DictionaryVO getDictionaryById(String id) throws Throwable;

	/**
	 * 查询所有对应类型编码的对象
	 * @param typecode
	 * @return
	 * @throws Throwable
	 */
	public List<DictionaryVO> getDictionaryByTypeCode(String typecode) throws Throwable;

	
	/**
	 * 使用datatables的分页查询
	 * 
	 * @param request
	 * @return
	 */
	public DataTablesResponse<DictionaryVO> list(DataTablesRequest request) throws Throwable;
	
	
	
	
}
