package cn.com.lsq.service;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.lsq.mapper.AdminMapper;
import cn.com.lsq.po.Admin;

public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;
	
	public Admin login(Admin admin){
		
		Admin admi = adminMapper.selectByIdAndPassword(admin);
		return admi;
	}
}
