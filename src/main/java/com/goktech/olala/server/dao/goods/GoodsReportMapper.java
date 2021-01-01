package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsReport;
import java.util.List;

public interface GoodsReportMapper {
    int deleteByPrimaryKey(String goodsId);

    int insert(GoodsReport record);

    GoodsReport selectByPrimaryKey(String goodsId);

    List<GoodsReport> selectAll();

    int updateByPrimaryKey(GoodsReport record);
}