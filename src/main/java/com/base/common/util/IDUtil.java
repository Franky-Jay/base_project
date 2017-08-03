package com.base.common.util;

import java.util.UUID;

import com.base.common.dao.CommonMapper;
import com.base.common.domain.Sequence;

public class IDUtil {

	public static String uuid(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static Long sequence(){
		CommonMapper mapper=SpringUtil.getBean(CommonMapper.class);
		Sequence seq=new Sequence();
		mapper.getSequence(seq);
		return seq.getId();
	}

}
