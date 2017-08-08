package com.base.menu.dao;

import com.base.menu.domain.MenuVO;
import com.base.menu.domain.MenuVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MenuVOMapper {
    int countByExample(MenuVOExample example);

    int deleteByExample(MenuVOExample example);

    int deleteByPrimaryKey(String id);

    int insert(MenuVO record);

    int insertSelective(MenuVO record);

    List<MenuVO> selectByExample(MenuVOExample example);

    MenuVO selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") MenuVO record, @Param("example") MenuVOExample example);

    int updateByExample(@Param("record") MenuVO record, @Param("example") MenuVOExample example);

    int updateByPrimaryKeySelective(MenuVO record);

    int updateByPrimaryKey(MenuVO record);
}