package com.goktech.olala.server.dao.order;

import com.goktech.olala.server.pojo.order.OrderDetail;
import java.util.List;

public interface OrderDetailMapper {
    int deleteByPrimaryKey(Integer orderDetailId);

    int insert(OrderDetail record);

    OrderDetail selectByPrimaryKey(Integer orderDetailId);

    List<OrderDetail> selectAll();

    int updateByPrimaryKey(OrderDetail record);

    List<OrderDetail> selectByOrderId(Long orderId);
}