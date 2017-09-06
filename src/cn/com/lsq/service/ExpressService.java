package cn.com.lsq.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.lsq.mapper.ExpressMapper;
import cn.com.lsq.po.Express;

public class ExpressService {
	
	@Autowired
	ExpressMapper expressMapper;
	
	public void add(Express record){
		expressMapper.insertSelective(record);
	}
	
	public void delete(HttpServletRequest request){
		expressMapper.deleteByPrimaryKey(Integer.parseInt(request.getParameter("id")));
	}
	
	public void update(Express record){
		expressMapper.updateByPrimaryKeySelective(record);
	}
	
	public List<Express> query(){
		List<Express> list = expressMapper.selectAll();
		return list;
	}
	
	public Express queryById(Integer id){
		Express e = expressMapper.selectByPrimaryKey(id);
		return e;
	}
	
	
	
}
