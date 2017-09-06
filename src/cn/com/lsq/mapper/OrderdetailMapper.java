package cn.com.lsq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.lsq.po.Orderdetail;

public interface OrderdetailMapper {
    void deleteByPrimaryKey(Integer id);

    int insert(Orderdetail record);

    int insertSelective(Orderdetail record);

    Orderdetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orderdetail record);

    int updateByPrimaryKey(Orderdetail record);
    
    List<Orderdetail> selectByUserId(Integer id);

	void updateByUserIdAndGoodsId(int userid, int goodsId);

	List<Orderdetail> selectByUserIdAndGoodsId(@Param("userId")Integer userId,@Param("goodsId")Integer goodsId);

	List<Orderdetail> selectByUserIdAndGoodsIdForTest(@Param("userId")Integer userId,@Param("goodsId")Integer goodsId);

	void clean();
}