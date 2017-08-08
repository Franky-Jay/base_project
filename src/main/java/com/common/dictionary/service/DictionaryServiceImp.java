package com.common.dictionary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.common.util.SearchConditionUtils;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.common.dictionary.dao.DictionaryVOMapper;
import com.common.dictionary.domain.DictionaryVO;
import com.common.dictionary.domain.DictionaryVOExample;



@Service
public class DictionaryServiceImp implements DictionaryService {

	@Autowired
	private DictionaryVOMapper mapper;
	
	@Override
	public void addDictionary(DictionaryVO dictionary) throws Throwable {
		mapper.insert(dictionary);
	}

	@Override
	public void deleteDictionary(String id) throws Throwable {
		mapper.deleteByPrimaryKey(id);
	}

	@Override
	public void updateDictionary(DictionaryVO dictionary) throws Throwable {
		mapper.updateByPrimaryKeySelective(dictionary);

	}

	@Override
	public DictionaryVO getDictionaryById(String id) throws Throwable {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public List<DictionaryVO> getDictionaryByTypeCode(String typecode) throws Throwable {
		DictionaryVOExample example = new DictionaryVOExample();
		example.createCriteria().andTypecodeEqualTo(typecode);
		example.setOrderByClause("orders");
		return mapper.selectByExample(example);
	}

	@Override
	public DataTablesResponse<DictionaryVO> list(DataTablesRequest request) throws Throwable {
		DictionaryVOExample example = new DictionaryVOExample();
		DataTablesResponse<DictionaryVO> response = new DataTablesResponse<DictionaryVO>();
		SearchConditionUtils.wrapperAndCondition(example, request);// 封装查询条件
		response.setDraw(request.getDraw());
		response.setRecordsTotal(mapper.countByExample(example));
		response.setData(mapper.selectByExample(example));
		return response;
	}

}
