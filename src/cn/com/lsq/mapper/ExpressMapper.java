package cn.com.lsq.mapper;

import java.util.List;

import cn.com.lsq.po.Express;

public interface ExpressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Express record);

    int insertSelective(Express record);

    Express selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Express record);

    int updateByPrimaryKey(Express record);
    
    List<Express> selectAll();
}