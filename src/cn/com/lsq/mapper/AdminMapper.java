package cn.com.lsq.mapper;

import cn.com.lsq.po.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(String id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(String id);

    Admin selectByIdAndPassword(Admin record);
    
    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    
}