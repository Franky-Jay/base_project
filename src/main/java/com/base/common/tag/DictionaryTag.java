package com.base.common.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

import org.apache.commons.lang3.StringUtils;

import com.base.common.util.SpringUtil;
import com.common.dictionary.domain.DictionaryVO;
import com.common.dictionary.service.DictionaryService;


/**
 * 自定义下拉选择控件
 * 用法：将类型编码(TypeCode)传入进来即可生成下来选择框
 * 
 * @author LingDU
 */
public class DictionaryTag implements Tag {
	private Tag patent;
	private PageContext pageContext;
	//类型编码
	private String typecode;
	//默认值
	private String defaultValue;
	//定制风格
	private String style;
	//id,name值
	private String selectName;
	//select标签参数
	private String tagParam;
	
	
	private DictionaryService service = SpringUtil.getBean(DictionaryService.class);

	@Override
	public int doEndTag() throws JspException {
		if(this.getTagParam() == null || this.getTagParam().equals("")){
			this.setTagParam("");
		}
		StringBuilder sb = new StringBuilder();
		try {
			List<DictionaryVO> list = service.getDictionaryByTypeCode(typecode);
			if (list != null) {
				if (StringUtils.isEmpty(this.getStyle())) {
					// 默认风格
					// <select name='dictionary' id='dictionary'class='form-control'>
					sb.append("<select name=").append(this.getSelectName()).append(" id=").append(this.getSelectName())
							.append(" class='form-control' ").append(this.getTagParam() + ">");
				} else {
					sb.append("<select name=").append(this.getSelectName()).append(" id=").append(this.getSelectName())
							.append(" class=").append(this.getStyle()).append(" " + this.getTagParam() + ">");
				}
				//System.out.println("----------->" + sb.toString());
				for (DictionaryVO dictionaryVO : list) {
					//System.out.println("\n------>" + dictionaryVO);
					if (!StringUtils.isEmpty(this.getDefaultValue())
							&& dictionaryVO.getDatakey().equals(this.getDefaultValue())) {
						sb.append("<option selected='selected' value=").append(dictionaryVO.getDatakey() + ">")
								.append(dictionaryVO.getDatavalue()).append("</option>");
					} else {
						sb.append("<option value=").append(dictionaryVO.getDatakey() + ">")
						.append(dictionaryVO.getDatavalue()).append("</option>");
					}
				}
				sb.append("</select>");
			}
			pageContext.getOut().append(sb.toString());
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return Tag.SKIP_BODY;
	}

	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Tag getParent() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void release() {
		// TODO Auto-generated method stub

	}

	@Override
	public void setPageContext(PageContext arg0) {
		this.pageContext = arg0;

	}

	@Override
	public void setParent(Tag arg0) {
		// TODO Auto-generated method stub

	}

	public Tag getPatent() {
		return patent;
	}

	public void setPatent(Tag patent) {
		this.patent = patent;
	}

	public String getTypecode() {
		return typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public DictionaryService getService() {
		return service;
	}

	public void setService(DictionaryService service) {
		this.service = service;
	}

	public PageContext getPageContext() {
		return pageContext;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getSelectName() {
		return selectName;
	}

	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}

	public String getTagParam() {
		return tagParam;
	}

	public void setTagParam(String tagParam) {
		this.tagParam = tagParam;
	}

}
