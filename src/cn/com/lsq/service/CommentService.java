package cn.com.lsq.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.lsq.mapper.CommentMapper;
import cn.com.lsq.po.Comment;
import cn.com.lsq.po.User;

public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;
	
	
	public void add(Comment comment, HttpSession session) {
		comment.setContenttime(new Date());
		comment.setUserId(((User)session.getAttribute("userlogin")).getId());
		commentMapper.insertSelective(comment);
	}


	public List<Comment> queryByUserIdAndGoodsIdForTest(HttpServletRequest request,
			HttpSession session) {
		Integer userId = ((User)session.getAttribute("userlogin")).getId();
		Integer GoodsId = Integer.parseInt(request.getParameter("goodsId"));
		return commentMapper.selectByUserIdAndGoodsIdForTest(userId,GoodsId);
	}


	public List<Comment> queryAll() {
		// TODO Auto-generated method stub
		return commentMapper.selectAll();
	}


	public int deleteById(Integer id) {
		// TODO Auto-generated method stub
		return commentMapper.deleteByPrimaryKey(id);
	}
	
	public int updateselective(Comment record){
		return commentMapper.updateByPrimaryKeySelective(record);
	}
}
