package cn.com.lsq.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.lsq.po.User;

public class AdminTestFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		//获取访问uri
		String[] arr = request.getRequestURI().split("/");
		String uri = arr[arr.length-1];
		//获取session并获取登录信息
		if(request.getSession().getAttribute("admin") != null||uri.equals("AdminLogin.jsp")){
			//继续之前的请求向下执行
			arg2.doFilter(arg0, arg1);
		}else{
			response.sendRedirect("AdminLogin.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
