package cn.com.lsq.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.lsq.mapper.GoodsMapper;
import cn.com.lsq.mapper.TypeMapper;
import cn.com.lsq.po.Goods;
import cn.com.lsq.po.Type;

public class TypeService {
	@Autowired
	TypeMapper typeMapper;
	@Autowired
	GoodsMapper goodsMapper;
	
	public void add(Type record){
		typeMapper.insertSelective(record);
	}
	public int delete(HttpServletRequest request){
		//获取Type的id
		Integer typeId = Integer.parseInt(request.getParameter("id"));
		//获取Type的name
		String typeName = typeMapper.selectByPrimaryKey(typeId).getName();
		//在Goods查询是否存在这个Type的图书
		List<Goods> list = goodsMapper.queryByType(typeName);
		//如果list长度是0，说明没有
		if(list.size() == 0){
		typeMapper.deleteByPrimaryKey(typeId);
		return 0;
		}else{
		return 1;
		}
		
		
	}
	public void update(Type record){
		typeMapper.updateByPrimaryKeySelective(record);
	}
	public List<Type> query(){
		List<Type> list = typeMapper.selectAll();
		return list;
	}
	public Type queryById(Integer id){
		Type t = typeMapper.selectByPrimaryKey(id);
		return t;
	}
	
	
	
		
}
