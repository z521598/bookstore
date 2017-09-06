package cn.com.lsq.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Goods;
import cn.com.lsq.po.Order;
import cn.com.lsq.po.Orderdetail;
import cn.com.lsq.po.User;
import cn.com.lsq.service.ExpressService;
import cn.com.lsq.service.GoodsService;
import cn.com.lsq.service.OrderService;
import cn.com.lsq.service.OrderdetailService;

@Controller
@RequestMapping("order")
public class OrderCon {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderdetailService orderdetailService;
	@Autowired
	ExpressService expressService;
	@Autowired
	GoodsService goodsService;

	// 管理员页面-查询订单详情
	@RequestMapping("/AdminqueryOrderdetailById.action")
	public ModelAndView adminqueryorderdetailById(Integer id) {
		ModelAndView mav = new ModelAndView();
		Order order = orderService.selectByOrderId(id);
		if (order != null) {
			mav.addObject("OneOrder", order);
			mav.setViewName("/Orderdetail.jsp");
		} else {
			mav.setViewName("/Order404.jsp");
		}

		return mav;
	}
	//管理员页面-更改订单信息
	@RequestMapping("/updatetotalcost.action")
	public ModelAndView updatetotalcost(Order order) {
		ModelAndView mav = new ModelAndView();
		orderService.updateselective(order);
		mav.setViewName("query.action");
		return mav;
	}
	
	// 暂出错，管理员界面-按照UserId查询
	@RequestMapping("/adminqueryByUserId.action")
	public ModelAndView AdminqueryByUserId(Integer id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("AllOrder", orderService.selectByUserId(id));
		mav.setViewName("/OrderDown.jsp");
		return mav;
	}

	// 暂未实现,管理员界面-按照OrderId查询
	@RequestMapping("/AdminqueryById.action")
	public ModelAndView adminqueryById(Integer id) {
		ModelAndView mav = new ModelAndView();
		Order order = orderService.selectByOrderId(id);
		mav.addObject("OneOrder", order);
		mav.setViewName("/OrderById.jsp");
		return mav;
	}

	// 用户页面-订单管理
	@RequestMapping("/queryByUserId.action")
	public ModelAndView queryByUserId(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("OneUserOrder", orderService
				.selectByUserId(((User) session.getAttribute("userlogin"))
						.getId()));
		mav.setViewName("/StoreOrder.jsp");
		return mav;
	}

	// 用户页面-进入确认下单页面
	@RequestMapping("/confrim.action")
	public ModelAndView confirm(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String[] id = (String[]) request.getAttribute("oederdetailids");
		request.getAttribute("orderId");
		mav.addObject("allOrderdetail", orderdetailService.queryByIds(id));
		mav.addObject("allExpress", expressService.query());
		mav.setViewName("/ConfirmOrder.jsp");
		return mav;
	}

	// 用户页面-确认下单之后的第一个页面
	@RequestMapping("/add.action")
	public ModelAndView add(HttpServletRequest request, HttpSession session,
			Order order) {
		ModelAndView mav = new ModelAndView();
		orderService.add(request, session, order);
		mav.setViewName("queryByUserId.action");
		return mav;
	}

	// 管理员页面-全部订单（按照时间顺序）
	@RequestMapping("/query.action")
	public ModelAndView queryAll() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("AllOrder", orderService.query());
		mav.setViewName("/OrderDown.jsp");
		return mav;
	}

	// 2
	@RequestMapping("/updatestate2.action")
	public ModelAndView updatestate2(Order record) {
		ModelAndView mav = new ModelAndView();
		record.setDeliverytime(new Date());
		record.setState("2");
		orderService.updateselective(record);
		mav.setViewName("query.action");
		return mav;
	}

	// 3
	@RequestMapping("/updatestate3.action")
	public ModelAndView updatestate3(Integer id) {
		ModelAndView mav = new ModelAndView();
		// 根据ID查出orderdetail
		Order record = orderService.selectByOrderId(id);
		// 设置收货的相关信息
		record.setReceivingtime(new Date());
		record.setState("3");
		// 获取订单详情
		List<Orderdetail> list = record.getOrderdetaillist();
		System.out.println(list.size());
		for (Orderdetail ot : list) {
			// 获取Goods的ID
			int goodsId = ot.getGoodsId();
			// 查出整条Goods数据
			Goods goods = goodsService.queryOne(goodsId);
			// 获取Goods的旧购买量
			int OldBuyCount = goods.getBuycount();
			// 获取Orderdetail中的购买量
			int num = ot.getGoodsNumber();
			// 设置购买量
			goods.setBuycount(OldBuyCount + num);
			// 传入数据修改
			goodsService.updateselective(goods);
		}
		// 访问数据库，修改
		orderService.updateselective(record);
		mav.setViewName("queryByUserId.action");
		return mav;
	}

	// 4
	@RequestMapping("/updatestate4.action")
	public ModelAndView updatestate4(Integer id) {
		ModelAndView mav = new ModelAndView();
		// 根据ID查出orderdetail
		Order record = orderService.selectByOrderId(id);
		// 修改信息
		record.setState("4");
		// 获取订单详情List
		List<Orderdetail> list = record.getOrderdetaillist();
		for (Orderdetail ot : list) {
			// 获取Goods的ID
			int goodsId = ot.getGoodsId();
			// 查出整条Goods数据
			Goods goods = goodsService.queryOne(goodsId);
			// 获取订单详情中的货物数量
			int num = ot.getGoodsNumber();
			// 得到Goods新Inventory
			int newInventory = goods.getInventory() + num;
			// 设置新库存
			goods.setInventory(newInventory);
			// 传入数据修改
			goodsService.updateselective(goods);
		}
		orderService.updateselective(record);
		mav.setViewName("queryByUserId.action");
		return mav;
	}

	// 1
	@RequestMapping("/updatestate1.action")
	public ModelAndView updatestate1(Integer id) {
		ModelAndView mav = new ModelAndView();
		Order record = orderService.selectByOrderId(id);
		record.setPaytime(new Date());
		record.setState("1");
		orderService.updateselective(record);
		mav.setViewName("queryByUserId.action");
		return mav;
	}

	// 根据时间流水线查询
	@RequestMapping("/salebytime.action")
	public ModelAndView salebytime(HttpServletRequest request)
			throws ParseException {
		ModelAndView mav = new ModelAndView();
		System.out.println(request.getParameter("starttime"));
		System.out.println(request.getParameter("overtime"));
		System.out.println(request.getParameter("pageNum"));
		
		String pageNum = request.getParameter("pageNum");
		Integer pageNum1 = 0;
		Integer pageSize = 6;
		Integer lastdata = 0;
		Integer allData = goodsService.query().size();
		Integer lastPage = allData % pageSize == 0 ? allData / pageSize
				: allData / pageSize + 1;
		if (pageNum == null) {
			pageNum1 = 0;
			lastdata = 6;
		} else {
			pageNum1 = Integer.parseInt(pageNum);
			if (pageNum1 > lastPage) {
				pageNum1 = lastPage;
			} else if (pageNum1 < 1) {
				pageNum1 = 1;
			}
			lastdata = pageNum1 * pageSize;
		}
		DateFormat df = DateFormat.getDateInstance();
		Date starttime = df.parse((String) request.getParameter("starttime"));
		Date overtime = df.parse((String) request.getParameter("overtime"));
		List<Order> list = orderService.queryByTimeWater(starttime, overtime,lastdata,pageSize);
		mav.addObject("starttime", request.getParameter("starttime"));
		mav.addObject("overtime", request.getParameter("overtime"));
		mav.addObject("salelist", list);
		mav.addObject("pageNum", pageNum1 + "");
		mav.addObject("lastPage", lastPage);
		mav.setViewName("/SaleByTime.jsp");
		return mav;
	}

	// 根据具体时间年/月/日查询
	@RequestMapping("/salenumberbytime.action")
	public ModelAndView salenumberbytime(String year, String month, String day)
			throws ParseException {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		DateFormat df = DateFormat.getDateInstance();
		String startdate;
		String enddate;
		String showtime;
		if (month.equals("1-12")) {
			// “年”的情况
			startdate = year + "-" + "1-1 00:00:00";
			enddate = year + "-" + "12-30 23:59:59";
			showtime = year + "年";
		} else if (day.equals("1-30")) {
			// “年-月”的情况
			startdate = year + "-" + month + "-1 00:00:00";
			enddate = year + "-" + month + "-30 23:59:59";
			showtime = year + "年" + month + "月";
		} else {
			// “年-月-日”的情况
			startdate = year + "-" + month + "-" + day + " 00:00:00";
			enddate = year + "-" + month + "-" + day + " 23:59:59";
			showtime = df.format(sdf.parse(startdate));
		}
		Date startdate2 = sdf.parse(startdate);
		Date enddate2 = sdf.parse(enddate);
		List<Order> list = orderService.queryByTime(startdate2, enddate2);
		mav.addObject("salelist", list);
		mav.addObject("time", showtime);
		mav.setViewName("/SaleNumberByTime.jsp");
		return mav;
	}
}
