package cn.com.lsq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.lsq.po.Admin;
import cn.com.lsq.po.User;
import cn.com.lsq.service.AdminService;
import cn.com.lsq.service.UserService;

@Controller
@RequestMapping("login")
@SessionAttributes({"admin","userlogin"})
public class LoginCon {
	
	@Autowired
	AdminService adminService;
	@Autowired
	UserService userService; 
	//管理员登录
	@RequestMapping("/admin.action")
	public ModelAndView adminlogin(Admin admin){
		Admin adm = adminService.login(admin);
		ModelAndView mav = new ModelAndView();
		if(adm != null){
			mav.addObject("admin", adm);
			mav.setViewName("/Admin.jsp");
		}else{
			mav.addObject("wrongMessage","<font size = '2' color = 'red'>用户名或密码错误</font>");
			mav.setViewName("/AdminLogin.jsp");
		}
		return mav;
	}
	//用户登录
	@RequestMapping("/user.action")
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
}
