package com.common.dictionary.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.base.common.domain.JsonResult;
import com.base.common.util.IDUtil;
import com.base.datatables.domain.DataTablesRequest;
import com.base.datatables.domain.DataTablesResponse;
import com.common.dictionary.domain.DictionaryVO;
import com.common.dictionary.service.DictionaryService;


@Controller
@RequestMapping("/dictionary")
public class DictionaryController {

	@Autowired
	private DictionaryService service;
	
	/**
	 * 进入private列表
	 * 
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/dictionary")
	public String list() {
		return "dictionary/list";
	}

	@RequestMapping("/dictionary/doSearchDictionary")
	public @ResponseBody DataTablesResponse<DictionaryVO> pageSearchPublic(@RequestBody DataTablesRequest request)
			throws Throwable {
		return service.list(request);
	}
	
	
	
	@RequestMapping("/dictionary/doDel")
	public @ResponseBody JsonResult doDel(String id) throws Throwable {
		service.deleteDictionary(id);
		JsonResult rs = new JsonResult();
		rs.setStatus(1);
		rs.setMsg("删除成功！");
		return rs;
	}
	
	@RequestMapping("/getDictionary")
	public @ResponseBody DictionaryVO getDictionary(String id) throws Throwable{
		if(!StringUtils.isEmpty(id)){
			return service.getDictionaryById(id);
		}else{
			return null;
		}
	}
	
	
	@RequestMapping("/doEdit")
	public @ResponseBody JsonResult doEdit(DictionaryVO entity) throws Throwable{
		JsonResult rs = new JsonResult();
		if(!StringUtils.isEmpty(entity.getId())){//修改
			service.updateDictionary(entity);
			rs.setMsg("修改成功！");
		}else{//新增
			entity.setId(IDUtil.uuid());
			service.addDictionary(entity);
			rs.setMsg("新增成功！");
		}
		rs.setStatus(1);	
		return rs;
	}
}
