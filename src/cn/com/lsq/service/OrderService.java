package cn.com.lsq.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.lsq.mapper.OrderMapper;
import cn.com.lsq.mapper.OrderdetailMapper;
import cn.com.lsq.po.Order;
import cn.com.lsq.po.Orderdetail;
import cn.com.lsq.po.User;

public class OrderService {

	@Autowired
	OrderMapper orderMapper;
	@Autowired
	OrderdetailMapper orderdetailMapper;
	
	public Order selectByOrderId(Integer id){
		return orderMapper.selectByOrderId(id);
	}
	public List<Order> selectByUserId(Integer id){
		return orderMapper.selectByUserId(id);
	}
	public void add(HttpServletRequest request, HttpSession session, Order order) {
		// TODO Auto-generated method stub

		order.setCreatetime(new Date());
		order.setState("0");
		order.setUserId(((User)session.getAttribute("userlogin")).getId());
		orderMapper.insertSelective(order);
	}
	public List<Order> query() {
		// TODO Auto-generated method stub
		
		return orderMapper.selectAll();
	}
	public void updateselective(Order record) {
		// TODO Auto-generated method stub
		orderMapper.updateByPrimaryKeySelective(record);
	}
	public List<Order> queryByTime(Date starttime, Date overtime) {
		// TODO Auto-generated method stub
		orderdetailMapper.clean();
		return orderMapper.selectByTime(starttime,overtime);
	}
	public List<Order> queryByTimeWater(Date starttime, Date overtime,
			Integer lastdata, Integer pageSize) {
		// TODO Auto-generated method stub
		orderdetailMapper.clean();
		return orderMapper.selectByTimeWater(starttime,overtime,lastdata,pageSize);
	}
	
}
