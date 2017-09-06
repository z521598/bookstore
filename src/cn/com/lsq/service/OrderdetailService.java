package cn.com.lsq.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.lsq.mapper.GoodsMapper;
import cn.com.lsq.mapper.OrderdetailMapper;
import cn.com.lsq.po.Goods;
import cn.com.lsq.po.Orderdetail;
import cn.com.lsq.po.User;

public class OrderdetailService {
	@Autowired
	OrderdetailMapper orderdetailMapper;
	@Autowired
	GoodsMapper goodsMapper; 
	
	public List<Orderdetail> queryByUserId(Integer id){
		return orderdetailMapper.selectByUserId(id);
	}
	
	public int changeNumber(HttpServletRequest request,Integer number){
		//根据ID获取订单详情
		Orderdetail od = orderdetailMapper.selectByPrimaryKey(Integer.parseInt(request.getParameter("id")));
		//获取旧的数量
		Integer oldNumber = od.getGoodsNumber();
		System.out.println(oldNumber);
		//获取货物ID
		Integer goodsId = od.getGoodsId();
		System.out.println(goodsId);
		//获取货物库存
		Integer inventory = goodsMapper.selectByPrimaryKeynocomment(goodsId).getInventory();
		System.out.println(inventory);
		//每件的钱
		Double price = goodsMapper.selectByPrimaryKeynocomment(od.getGoodsId()).getSaleprice();
		System.out.println(price);
		//设置新的数目
		od.setGoodsNumber(oldNumber+number);
		//获取旧的钱数
		Double oldTotalprice = od.getTotalprice();
		//计算出新数目
		Double newTotalprice = Double.parseDouble(String.format("%.1f", price*(oldNumber+number))); 
		System.out.println(newTotalprice);
		//设置新的价格
		od.setTotalprice(newTotalprice);
		//if控制不能数目不能小于1
		if(od.getGoodsNumber() == 0){
			od.setGoodsNumber(1);
			od.setTotalprice(oldTotalprice);
		}
		
		//if控制，如果大于库存，则返回旧的数目和价钱
		//获取
		if(oldNumber+number > inventory){
			od.setGoodsNumber(oldNumber);
			od.setTotalprice(oldTotalprice);	
		}
		return orderdetailMapper.updateByPrimaryKeySelective(od);
	}
	
	public void delete(HttpServletRequest request){
		orderdetailMapper.deleteByPrimaryKey(Integer.parseInt(request.getParameter("id")));
	}
	
	public void addShoppingCar(HttpServletRequest request,HttpSession session){
		Orderdetail ot = new Orderdetail();
		int goods_id = Integer.parseInt(request.getParameter("goodsId"));
		Goods goods = goodsMapper.selectByPrimaryKeynocomment(goods_id);
		ot.setGoodsId(goods_id);
		ot.setGoodsNumber(1);
		ot.setUserId(((User)session.getAttribute("userlogin")).getId());
		ot.setTotalprice(goods.getSaleprice()*1);
		ot.setState("0");
		orderdetailMapper.insertSelective(ot);
	}

	public void updateByUserIdAndGoodsId(HttpSession session,String goodsId) {
		// TODO Auto-generated method stub
		int userid = ((User)session.getAttribute("userlogin")).getId();
		orderdetailMapper.updateByUserIdAndGoodsId(userid,Integer.parseInt(goodsId));
	}

	public void updateBeforeConfirm(Orderdetail record) {
		// TODO Auto-generated method stub
		record.setState("1");
		orderdetailMapper.updateByPrimaryKey(record);
	}

	public Orderdetail queryById(int id) {
		// TODO Auto-generated method stub
		return orderdetailMapper.selectByPrimaryKey(id);
	}

	public List<Orderdetail> queryByIds(String[] id) {
		// TODO Auto-generated method stub
		ArrayList<Orderdetail> list = new ArrayList<Orderdetail>();
		for(String str : id){
			list.add(orderdetailMapper.selectByPrimaryKey(Integer.parseInt(str)));	
		}
		return list;
	}

	public List<Orderdetail> queryByUserIdAndGoodsId(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		//request.getParameter(arg0);
		Integer userId = ((User)session.getAttribute("userlogin")).getId();
		Integer goodsId = Integer.parseInt(request.getParameter("goodsId"));
		return orderdetailMapper.selectByUserIdAndGoodsId(userId,goodsId);
	}
	
	public List<Orderdetail> queryByUserIdAndGoodsIdForTest(HttpServletRequest request, HttpSession session) {
		// TODO Auto-generated method stub
		//request.getParameter(arg0);
		Integer userId = ((User)session.getAttribute("userlogin")).getId();
		Integer goodsId = Integer.parseInt(request.getParameter("goodsId"));
		return orderdetailMapper.selectByUserIdAndGoodsIdForTest(userId,goodsId);
	}
	
}
