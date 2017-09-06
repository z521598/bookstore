package cn.com.lsq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Express;
import cn.com.lsq.service.ExpressService;

@Controller
@RequestMapping("express")
public class ExpressCon {
	@Autowired
	ExpressService expressService;
	
	
	@RequestMapping("/add.action")
	public ModelAndView add(Express express){
		ModelAndView mav = new ModelAndView();
		expressService.add(express);
		mav.setViewName("/express/query.action");
		return mav;
	}
	@RequestMapping("/delete.action")
	public ModelAndView delete(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		expressService.delete(request);
		mav.setViewName("/express/query.action");
		return mav;
	}
	@RequestMapping("/update.action")
	public ModelAndView update(Express express){
		ModelAndView mav = new ModelAndView();
		expressService.update(express);
		mav.setViewName("/express/query.action");
		return mav;
	}
	@RequestMapping("/query.action")
	public ModelAndView query(Express express){
		ModelAndView mav = new ModelAndView();
		mav.addObject("allExpress",expressService.query());
		mav.setViewName("/Express.jsp");
		return mav;
	}
	@RequestMapping("/queryById.action")
	public ModelAndView queryById(Integer id){
		ModelAndView mav = new ModelAndView();
		mav.addObject("oneExpress",expressService.queryById(id));
		mav.setViewName("/UpdateExpress.jsp");
		return mav;
	}
}
