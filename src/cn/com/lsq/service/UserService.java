package cn.com.lsq.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.lsq.mapper.UserMapper;
import cn.com.lsq.po.User;

public class UserService {
	@Autowired
	UserMapper userMapper;
	
	public void add(User record){
		record.setRegistrationtime(new Date());
		record.setIsvip(false);
		userMapper.insertSelective(record);
	}
	
	public void delete(Integer id){
		userMapper.deleteByPrimaryKey(id);
	} 
	public void update(User record){
		userMapper.updateByPrimaryKeySelective(record);
	} 
	public List<User> query(User record){
		List<User> list = userMapper.selectAll();
		return list;
	}
	public User queryOne(Integer id){
		return userMapper.selectOne(id);
	}
	
	public User login(User user){
		return userMapper.login(user);
	}

	public void updateselective(User user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
	}
	
	
	
}
