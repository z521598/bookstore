package cn.com.lsq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.lsq.po.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
    
    List<Comment> selectByGoodsId(Integer goodsid);

	List<Comment> selectByUserIdAndGoodsIdForTest(@Param("userId")Integer userId,
			@Param("goodsId")Integer goodsId);

	List<Comment> selectAll();
}