package cn.com.lsq.mapper;

import java.util.List;

import cn.com.lsq.po.User;

public interface UserMapper {
    int insert(User record);

    int insertSelective(User record);
    
    int deleteByPrimaryKey(Integer id);
    
    List<User> selectAll();
    
    void updateByPrimaryKeySelective(User user);
    
    User selectOne(Integer id);
    
    User login(User user);
}