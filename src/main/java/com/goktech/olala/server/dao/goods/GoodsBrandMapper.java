package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsBrand;
import java.util.List;

public interface GoodsBrandMapper {
    int deleteByPrimaryKey(Short brandId);

    int insert(GoodsBrand record);

    GoodsBrand selectByPrimaryKey(Short brandId);

    List<GoodsBrand> selectAll();

    int updateByPrimaryKey(GoodsBrand record);
}