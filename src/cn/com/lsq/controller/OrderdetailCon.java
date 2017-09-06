package cn.com.lsq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Comment;
import cn.com.lsq.po.Goods;
import cn.com.lsq.po.Orderdetail;
import cn.com.lsq.po.User;
import cn.com.lsq.service.CommentService;
import cn.com.lsq.service.GoodsService;
import cn.com.lsq.service.OrderdetailService;
@Controller
@RequestMapping("orderdetail")
public class OrderdetailCon {
	@Autowired
	OrderdetailService orderdetailService;
	@Autowired
	CommentService commentService;
	@Autowired
	GoodsService goodsService;
	
	//购物车-显示页面
	@RequestMapping("/queryByUserId.action")
	public ModelAndView queryByUserId(HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.addObject("allOrderdetail",orderdetailService.queryByUserId(((User)session.getAttribute("userlogin")).getId()));
		mav.setViewName("/ShoppingCar.jsp");
		return mav;
	}
	//添加订单-修改order_id和state = 1
	@RequestMapping("/addorder.action")
	public ModelAndView addorder(HttpServletRequest request,HttpSession session){
		ModelAndView mav = new ModelAndView();
		//获取选取的CHECKBOX的id
		String[] id = request.getParameterValues("id");
		mav.addObject("oederdetailids", id);
		//设置orderId
		String orderId = ""+((User)session.getAttribute("userlogin")).getId()+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		orderId = orderId.substring(0, 2)+(int)(Math.random()*10000)+ orderId.substring(orderId.length()-4,orderId.length()-1);
		//将orderId传值到Order里
		mav.addObject("orderId",orderId);
		//循环处理已下单的orderdetail
		for(String str : id){
			//根据ID获取整条订单详情
			Orderdetail ot = orderdetailService.queryById(Integer.parseInt(str));
			//设置订单详情的orderId
			ot.setOrderId(Integer.parseInt(orderId));
			//传入数据库修改
			orderdetailService.updateBeforeConfirm(ot);
			//获取订单详情的货物数量
			int saleNum = ot.getGoodsNumber();
			//获取Goods的ID
			int goodsId = ot.getGoodsId();
			//获取Goods的信息
			Goods goods = goodsService.queryOne(goodsId);
			//设置新的库存数量
			int newInventory = goods.getInventory() - saleNum;
			goods.setInventory(newInventory);
			//传入数据库修改
			goodsService.updateselective(goods);
		}
		mav.setViewName("/order/confrim.action");
		return mav;
	}
	//购物车-添加
	@RequestMapping("/AddShoppingCar.action")
	public ModelAndView AddShoppingCar(HttpServletRequest request,HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(orderdetailService.queryByUserIdAndGoodsId(request,session).size() == 0){
		orderdetailService.addShoppingCar(request,session);
		}
		mav.setViewName("queryByUserId.action");
		return mav;
	}
	//购物车-图书+1
	@RequestMapping("/addGoods.action")
	public ModelAndView addGoods(Orderdetail record,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int i = orderdetailService.changeNumber(request, 1);
		if(i == 0){
			mav.addObject("falsemessage", "<font size = '2' color = 'red'>库存不足</font>");
		}
		mav.setViewName("/orderdetail/queryByUserId.action");
		return mav;
	}
	//购物车-图书-1
	@RequestMapping("/subtartGoods.action")
	public ModelAndView subtartGoods(Orderdetail record,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		orderdetailService.changeNumber(request, -1);
		mav.setViewName("/orderdetail/queryByUserId.action");
		return mav;
	}
	//购物车-删除
	@RequestMapping("/delete.action")
	public ModelAndView delete(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();		
		orderdetailService.delete(request);
		mav.setViewName("/orderdetail/queryByUserId.action");
		return mav;
	}
	
	//用户页面-写评论前查询效验
	@RequestMapping("/test.action")
	public ModelAndView test(HttpServletRequest request,HttpSession session){
		ModelAndView mav = new ModelAndView();		
		List<Orderdetail> list= orderdetailService.queryByUserIdAndGoodsIdForTest(request, session);
		List<Comment> list2= commentService.queryByUserIdAndGoodsIdForTest(request,session);
		if(list.size() == 0){
			mav.addObject("falsemessage","<font color = 'red' size = '2'>亲，您还未购买此图书，无法评论。</font>");		
			mav.setViewName("/goods/storeQueryById.action?id="+request.getParameter("goodsId"));
		}else if(list2.size() != 0){
			mav.addObject("falsemessage","<font color = 'red' size = '2'>亲，您已经评论过了，无法评论。</font>");		
			mav.setViewName("/goods/storeQueryById.action?id="+request.getParameter("goodsId"));		
		}else{
			mav.addObject("goodsId",request.getParameter("goodsId"));
			mav.setViewName("/AddComment.jsp");
		}
		return mav;
	}

}
