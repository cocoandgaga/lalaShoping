package com.goktech.olala.server.dao.order;

import com.goktech.olala.server.pojo.order.OrderMaster;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;


public interface OrderMasterMapper {
    int deleteByPrimaryKey(Long orderId);

    int insert(OrderMaster record);

    OrderMaster selectByPrimaryKey(Long orderId);

    List<OrderMaster> selectAll();

    int updateByPrimaryKey(OrderMaster record);

    List<OrderMaster> selectByCtmId(String customerId);
}