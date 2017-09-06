package cn.com.lsq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.User;
import cn.com.lsq.service.UserService;

@Controller
@RequestMapping("user")
@SessionAttributes("userlogin")
public class UserCon {
	@Autowired
	UserService userService; 
	//登录页面
	@RequestMapping("/login.action")
	public ModelAndView adminlogin(User user){
		User u = userService.login(user);
		ModelAndView mav = new ModelAndView();
		if( u != null){
			mav.addObject("userlogin",u);
			mav.setViewName("/Store.jsp");
		}else{
			mav.addObject("wrongMessage","<font size = '2' color = 'red'>用户名或密码错误</font>");
			mav.setViewName("/UserLogin.jsp");
		}
		return mav;
	}
	//确认收货验证密码
	@RequestMapping("/confirmreceving.action")
	public ModelAndView confirmreceving(User user,HttpSession session,Integer orderId){
		ModelAndView mav = new ModelAndView();
		user.setId(((User)session.getAttribute("userlogin")).getId());
		User u =userService.login(user);
		if( u != null){
			mav.setViewName("/order/updatestate3.action?id="+orderId);
		}else{
			mav.addObject("wrongMessage","<font size = '2' color = 'red'>密码错误</font>");
			mav.setViewName("/Confirm404.jsp");
		}
		return mav;
	}
	//用户页面-AJAX修改前查询验证密码
	@RequestMapping("/queryforupdateuser.action")
	public void queryforupdateuser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("id")));
		user.setPassword(request.getParameter("password"));
		User u = userService.login(user);
		if(u == null){
		out.print(0);
		}else{
		out.print(1);
		}
		response.setHeader("Content-Type","text/html; charset=utf-8");
		out.flush();
		out.close();
	}
	//升级为会员
	@RequestMapping("/updatevip.action")
	public ModelAndView updatevip(Integer id){
		ModelAndView mav = new ModelAndView();
		User user = userService.queryOne(id);
		user.setIsvip(true);
		userService.updateselective(user);
		mav.setViewName("/user/query.action");
		return mav;
	}
	
	
	//用户注册AJAX-检查是否有此ID
	@RequestMapping("/registtest.action")
	public void registtest(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		User u =userService.queryOne(Integer.parseInt(request.getParameter("id")));
		if(u == null){
		out.print(0);
		}else{
		out.print(1);
		}
		response.setHeader("Content-Type","text/html; charset=utf-8");
		out.flush();
		out.close();
	}
	//用户注册-添加新用户
	@RequestMapping("/add.action")
	public ModelAndView add(User user){
		ModelAndView mav = new ModelAndView();
		userService.add(user);
		mav.setViewName("/UserLogin.jsp");
		return mav;
	}
	//管理员页面-查询全部用户
	@RequestMapping("/query.action")
	public ModelAndView query(User user){
		ModelAndView mav = new ModelAndView();
		mav.addObject("allUser",userService.query(user));
		mav.setViewName("/User.jsp");
		return mav;
	}
	//管理员页面-删除用户
	@RequestMapping("/delete.action")
	public ModelAndView delete(Integer id){
		ModelAndView mav = new ModelAndView();
		userService.delete(id);
		mav.setViewName("/user/query.action");
		return mav;
	}
	//管理员页面-修改用户信息
	@RequestMapping("/update.action")
	public ModelAndView update(User user){
		ModelAndView mav = new ModelAndView();
		userService.update(user);
		mav.setViewName("/user/query.action");
		return mav;
	}
	//管理员页面-修改用户信息前查询信息
	@RequestMapping("/queryBeforeUpdate.action")
	public ModelAndView queryBeforeUpdate(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.addObject("oneUser",userService.queryOne(Integer.parseInt(request.getParameter("id"))));
		mav.setViewName("/UpdateUser.jsp");
		return mav;
	}
	//管理员页面-根据用户ID查找用户
	@RequestMapping("/queryById.action")
	public ModelAndView queryOne(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.addObject("oneUser",userService.queryOne(Integer.parseInt(request.getParameter("id"))));
		mav.setViewName("/OneUser.jsp");
		return mav;
	}
	
	
	@RequestMapping("/updateForUser.action")
	public ModelAndView updateForUser(User user){
		ModelAndView mav = new ModelAndView();
		userService.update(user);
		mav.addObject("userlogin", user);
		mav.setViewName("/StoreUser.jsp");
		return mav;	
	}
	
	@RequestMapping("/storeuser.action")
	public ModelAndView updateForUser(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/StoreUser.jsp");
		return mav;	
	}
}
