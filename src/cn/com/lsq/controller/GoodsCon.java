package cn.com.lsq.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Comment;
import cn.com.lsq.po.Goods;
import cn.com.lsq.po.Type;
import cn.com.lsq.service.CommentService;
import cn.com.lsq.service.GoodsService;
import cn.com.lsq.service.TypeService;

@Controller
@RequestMapping("goods")
public class GoodsCon {
	@Autowired
	GoodsService goodsService;
	@Autowired
	TypeService typeService;
	// 添加图书
	@RequestMapping("/add.action")
	public ModelAndView add(Goods goods, MultipartFile cover2,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		ModelAndView mav = new ModelAndView();
		goodsService.add(goods, cover2, request);
		mav.setViewName("/goods/query.action");
		return mav;
	}
	// 管理员页面-修改
	@RequestMapping("/update.action")
	public ModelAndView update(Goods goods, MultipartFile cover2,
			HttpServletRequest request) throws IllegalStateException,
			IOException {
		ModelAndView mav = new ModelAndView();
		goodsService.update(goods, cover2, request);
		mav.setViewName("/goods/query.action");
		return mav;
	}

	// 管理员页面-查询所有图书
	@RequestMapping("/query.action")
	public ModelAndView query() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("allGoods", goodsService.query());
		mav.setViewName("/Goods.jsp");
		return mav;
	}

	// 查询库存不足的图书
	@RequestMapping("/queryLess.action")
	public ModelAndView queryLess() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("allGoods", goodsService.queryLess());
		mav.addObject("message",
				"<font size = '2' color = 'red'>库存不足10本的图书如下：</font>");
		mav.setViewName("/Goods.jsp");
		return mav;
	}
	//用户页面-主页热销图书
	@RequestMapping("/queryhome.action")
	public ModelAndView queryhome() {
		ModelAndView mav = new ModelAndView();
		List<Goods> list = (List<Goods>)goodsService.queryHot();
		mav.addObject("Books",list);
		mav.setViewName("/Home.jsp");
		return mav;
	}
	// 用户页面-查询所有图书
	@RequestMapping("/storequery.action")
	public ModelAndView Storequery() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("Books", goodsService.query());
		mav.setViewName("/GoodsdetailForUser.jsp");
		return mav;
	}

	// 用户页面-分页查询
	@RequestMapping("/storequerypage.action")
	public ModelAndView StorequeryPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

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
		mav.addObject("pageNum", pageNum1 + "");
		mav.addObject("lastPage", lastPage);
		mav.addObject("Books", goodsService.queryPage(lastdata, pageSize));
		mav.setViewName("/GoodsdetailForUser.jsp");
		return mav;
	}

	// 用户页面-模糊查询
	@RequestMapping("/queryLike.action")
	public ModelAndView queryLike(String queryname)
			throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("Books", goodsService.queryLike(queryname));
		mav.setViewName("/StoreGoodsByType.jsp");
		return mav;
	}

	// 管理员页面-删除
	@RequestMapping("/delete.action")
	public ModelAndView delete(Integer id) {
		ModelAndView mav = new ModelAndView();
		goodsService.delete(id);
		mav.setViewName("/goods/query.action");
		return mav;
	}

	
	// 管理员页面-修改图书信息之前查询信息
	@RequestMapping("/queryBeforeUpdate")
	public ModelAndView queryBeforeUpdate(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<Type> types = typeService.query(); 
		mav.addObject("oneGoods", goodsService.queryOne(Integer
				.parseInt(request.getParameter("id"))));
		mav.addObject("types",types);
		mav.setViewName("/UpdateGoods.jsp");
		return mav;
	}

	// 管理员页面-根据图书ID查询图书详情
	@RequestMapping("/queryById.action")
	public ModelAndView queryOne(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("oneGoods", goodsService.queryOne(Integer
				.parseInt(request.getParameter("id"))));
		mav.setViewName("/OneGoods.jsp");
		return mav;
	}
		
	// 用户页面-根据图书ID查询图书详情
	@RequestMapping("/storeQueryById.action")
	public ModelAndView storeQueryById(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("oneGoods", goodsService.queryOne(Integer
				.parseInt(request.getParameter("id"))));
		mav.setViewName("/StoreOneGoods.jsp");
		return mav;
	}

	// 上架图书
	@RequestMapping("/up.action")
	public ModelAndView up(Goods goods, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		goods.setId(Integer.parseInt(request.getParameter("id")));
		goods.setIsonsale(1);
		goodsService.updateOnSale(goods, request);
		mav.setViewName("/goods/query.action");
		return mav;
	}

	// 下架图书
	@RequestMapping("/down.action")
	public ModelAndView down(Goods goods, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		goods.setId(Integer.parseInt(request.getParameter("id")));
		goods.setIsonsale(0);
		goodsService.updateOnSale(goods, request);
		mav.setViewName("/goods/query.action");
		return mav;
	}

	// 用户页面-根据种类显示图书
	@RequestMapping("/queryByType.action")
	public ModelAndView queryByType(HttpServletRequest request)
			throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("Books", goodsService.queryByType(request));
		mav.setViewName("/StoreGoodsByType.jsp");
		return mav;
	}
	//管理员页面-其他统计
	@RequestMapping("/querysale.action")
	public ModelAndView querysale() throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		int allSale = 0;
		List<Type> typelist = typeService.query();
		mav.addObject("typelist",typelist);
		for( Type t : typelist){
		mav.addObject(""+t.getId(),goodsService.querysumByTypeForSale(t.getName()));
		allSale += goodsService.querysumByTypeForSale(t.getName());
		}
		mav.addObject("hotgoods",goodsService.queryHot());
		mav.addObject("allSale",allSale);
		mav.setViewName("/SaleOthers.jsp");
		return mav;
	}


}
