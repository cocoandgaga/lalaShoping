package com.goktech.olala.server.dao.order;

import com.goktech.olala.server.pojo.order.OrderMaster;
import java.util.List;

public interface OrderMasterMapper {
    int deleteByPrimaryKey(Long orderId);

    int insert(OrderMaster record);

    OrderMaster selectByPrimaryKey(Long orderId);

    List<OrderMaster> selectAll();

    int updateByPrimaryKey(OrderMaster record);
}