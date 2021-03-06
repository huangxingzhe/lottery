package com.tommy.dao;

import com.tommy.model.Remark;
import com.tommy.model.RemarkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RemarkMapper {
    int countByExample(RemarkExample example);

    int deleteByExample(RemarkExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Remark record);

    int insertSelective(Remark record);

    List<Remark> selectByExample(RemarkExample example);

    Remark selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Remark record, @Param("example") RemarkExample example);

    int updateByExample(@Param("record") Remark record, @Param("example") RemarkExample example);

    int updateByPrimaryKeySelective(Remark record);

    int updateByPrimaryKey(Remark record);
}