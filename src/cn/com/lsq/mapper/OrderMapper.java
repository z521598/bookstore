package cn.com.lsq.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.lsq.po.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    Order selectByOrderId(Integer id);
    
    List<Order> selectByUserId(Integer id);

	List<Order> selectAll();

	List<Order> selectByTime(@Param("starttime")Date starttime,@Param("overtime") Date overtime);

	List<Order> selectByTimeWater(@Param("starttime")Date starttime, @Param("overtime")Date overtime,
			@Param("lastdata")Integer lastdata, @Param("pageSize")Integer pageSize);
}