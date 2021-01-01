package com.goktech.olala.server.dao.wareh;

import com.goktech.olala.server.pojo.wareh.WGoods;
import java.util.List;

public interface WGoodsMapper {
    int deleteByPrimaryKey(Integer wpId);

    int insert(WGoods record);

    WGoods selectByPrimaryKey(Integer wpId);

    List<WGoods> selectAll();

    int updateByPrimaryKey(WGoods record);
}