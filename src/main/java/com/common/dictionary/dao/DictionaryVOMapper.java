package com.common.dictionary.dao;

import com.common.dictionary.domain.DictionaryVO;
import com.common.dictionary.domain.DictionaryVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DictionaryVOMapper {
    int countByExample(DictionaryVOExample example);

    int deleteByExample(DictionaryVOExample example);

    int deleteByPrimaryKey(String id);

    int insert(DictionaryVO record);

    int insertSelective(DictionaryVO record);

    List<DictionaryVO> selectByExample(DictionaryVOExample example);

    DictionaryVO selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") DictionaryVO record, @Param("example") DictionaryVOExample example);

    int updateByExample(@Param("record") DictionaryVO record, @Param("example") DictionaryVOExample example);

    int updateByPrimaryKeySelective(DictionaryVO record);

    int updateByPrimaryKey(DictionaryVO record);
}