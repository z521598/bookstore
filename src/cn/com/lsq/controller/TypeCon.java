package cn.com.lsq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Goods;
import cn.com.lsq.po.Type;
import cn.com.lsq.po.User;
import cn.com.lsq.service.GoodsService;
import cn.com.lsq.service.TypeService;

@Controller
@RequestMapping("type")
public class TypeCon {
	@Autowired
	TypeService typeService;
	@Autowired
	GoodsService goodsService;
	//暂出错，管理员页面-AJAX效验是否存在
	@RequestMapping("/AJAXTestExist.action")
	public void AJAXTestExist(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		List<Goods> list= goodsService.queryType(new String());
		if(list == null){
		out.print(0);
		}else{
		out.print(1);
		}
		response.setHeader("Content-Type","text/html; charset=utf-8");
		out.flush();
		out.close();
	}
	
	
	//管理员页面-添加种类
	@RequestMapping("/add.action")
	public ModelAndView add(Type type){
		ModelAndView mav = new ModelAndView();
		typeService.add(type);
		mav.setViewName("/type/query.action");
		return mav;
	}
	
	//管理员页面-删除种类
	@RequestMapping("/delete.action")
	public ModelAndView delete(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		int i = typeService.delete(request);
		if(i == 1){
			mav.addObject("falsemessage","<font size = '2' color = 'red'>已存在该类型图书,删除失败</font>");
		}
		mav.setViewName("/type/query.action");
		return mav;
	}
	
	//管理员页面-查询后修改种类
	@RequestMapping("/update.action")
	public ModelAndView update(Type type){
		ModelAndView mav = new ModelAndView();
		typeService.update(type);
		mav.setViewName("/type/query.action");
		return mav;
	}
	//管理员页面-查询所有种类
	@RequestMapping("/query.action")
	public ModelAndView query(Type type){
		ModelAndView mav = new ModelAndView();
		mav.addObject("allType",typeService.query());
		mav.setViewName("/Type.jsp");
		return mav;
	}
	//管理员页面-修改种类前查询
	@RequestMapping("/queryById.action")
	public ModelAndView queryById(Integer id){
		ModelAndView mav = new ModelAndView();
		mav.addObject("oneType",typeService.queryById(id));
		mav.setViewName("/UpdateType.jsp");
		return mav;
	}
	//用户页面-图书列表，分类页面
	@RequestMapping("/queryHome.action")
	public ModelAndView queryHome(Type type){
		ModelAndView mav = new ModelAndView();
		mav.addObject("allType",typeService.query());
		mav.setViewName("/bookLeft.jsp");
		return mav;
	}
	//管理员页面-添加图书，显示图书类型
	@RequestMapping("/queryForGoods.action")
	public ModelAndView queryForGoods(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("allType",typeService.query());
		mav.setViewName("/AddBook.jsp");
		return mav;
	}
	
}
