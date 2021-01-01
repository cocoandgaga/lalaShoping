package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsCategBusi;
import java.util.List;

public interface GoodsCategBusiMapper {
    int deleteByPrimaryKey(Long catyBusiId);

    int insert(GoodsCategBusi record);

    GoodsCategBusi selectByPrimaryKey(Long catyBusiId);

    List<GoodsCategBusi> selectAll();

    int updateByPrimaryKey(GoodsCategBusi record);
}