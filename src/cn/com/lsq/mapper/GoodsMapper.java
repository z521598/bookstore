package cn.com.lsq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.lsq.po.Goods;

public interface GoodsMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Goods record);

	int insertSelective(Goods record);

	Goods selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Goods record);

	int updateByPrimaryKey(Goods record);

	List<Goods> query();

	List<Goods> queryByType(String str);

	List<Goods> queryLike(String name);

	List<Goods> queryLess();

	List<Goods> querypage(@Param("lastdata") Integer lastdata,
			@Param("startdata") Integer startdata);

	Goods selectByPrimaryKeynocomment(Integer id);

	List<Goods> queryHot();

	Integer querysumbytype(String name);

}