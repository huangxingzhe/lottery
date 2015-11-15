package com.tommy.dao;

import com.tommy.model.LotteryLog;
import com.tommy.model.LotteryLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LotteryLogMapper {
    int countByExample(LotteryLogExample example);

    int deleteByExample(LotteryLogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LotteryLog record);

    int insertSelective(LotteryLog record);

    List<LotteryLog> selectByExample(LotteryLogExample example);

    LotteryLog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LotteryLog record, @Param("example") LotteryLogExample example);

    int updateByExample(@Param("record") LotteryLog record, @Param("example") LotteryLogExample example);

    int updateByPrimaryKeySelective(LotteryLog record);

    int updateByPrimaryKey(LotteryLog record);
}