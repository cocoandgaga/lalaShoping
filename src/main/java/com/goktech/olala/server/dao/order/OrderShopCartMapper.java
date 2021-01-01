package com.goktech.olala.server.dao.order;

import com.goktech.olala.server.pojo.order.OrderShopCart;
import java.util.List;

public interface OrderShopCartMapper {
    int deleteByPrimaryKey(Long shopCartId);

    int insert(OrderShopCart record);

    OrderShopCart selectByPrimaryKey(Long shopCartId);

    List<OrderShopCart> selectAll();

    int updateByPrimaryKey(OrderShopCart record);
}