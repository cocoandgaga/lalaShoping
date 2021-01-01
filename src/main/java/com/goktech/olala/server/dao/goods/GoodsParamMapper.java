package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsParam;
import java.util.List;

public interface GoodsParamMapper {
    int insert(GoodsParam record);

    List<GoodsParam> selectAll();
}