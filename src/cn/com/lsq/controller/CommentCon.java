package cn.com.lsq.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Comment;
import cn.com.lsq.service.CommentService;

@Controller
@RequestMapping("comment")
public class CommentCon {
	
	@Autowired
	CommentService commentService;
	//用户添加评论
	@RequestMapping("/add.action")
	public ModelAndView add(Comment comment,HttpSession session){
		ModelAndView mav = new ModelAndView();
		commentService.add(comment,session);
		mav.setViewName("/Successcomment.jsp");
		return mav;
	}
	//管理员页面-查看用户评论(根据时间顺序)
	@RequestMapping("/queryall.action")
	public ModelAndView queryall(){
		ModelAndView mav = new ModelAndView();
		List<Comment> list = commentService.queryAll();
		mav.addObject("comment",list);
		mav.setViewName("/Comment.jsp");
		return mav;
	}
	//管理员页面-删除评论
	@RequestMapping("/delete.action")
	public ModelAndView delete(Integer id){
		ModelAndView mav = new ModelAndView();
		commentService.deleteById(id);
		mav.setViewName("queryall.action");
		return mav;
	}
	//管理员页面-添加回复
	@RequestMapping("/addresponse.action")
	public ModelAndView addresponse(Comment record){
		ModelAndView mav = new ModelAndView();
		record.setResponsetime(new Date());
		commentService.updateselective(record);
		mav.setViewName("queryall.action");
		return mav;
	}
}
