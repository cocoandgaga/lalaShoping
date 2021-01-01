package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsCategory;
import java.util.List;

public interface GoodsCategoryMapper {
    int deleteByPrimaryKey(Integer categoryId);

    int insert(GoodsCategory record);

    GoodsCategory selectByPrimaryKey(Integer categoryId);

    List<GoodsCategory> selectAll();

    int updateByPrimaryKey(GoodsCategory record);
}