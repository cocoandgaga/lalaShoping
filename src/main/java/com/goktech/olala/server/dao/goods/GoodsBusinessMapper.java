package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsBusiness;
import java.util.List;

public interface GoodsBusinessMapper {
    int deleteByPrimaryKey(String businessId);

    int insert(GoodsBusiness record);

    GoodsBusiness selectByPrimaryKey(String businessId);

    List<GoodsBusiness> selectAll();

    int updateByPrimaryKey(GoodsBusiness record);
}