package com.goktech.olala.server.dao.goods;

import com.goktech.olala.server.pojo.goods.GoodsPicture;
import java.util.List;

public interface GoodsPictureMapper {
    int deleteByPrimaryKey(Long pictureId);

    int insert(GoodsPicture record);

    GoodsPicture selectByPrimaryKey(Long pictureId);

    List<GoodsPicture> selectAll();

    int updateByPrimaryKey(GoodsPicture record);

    GoodsPicture selectByGoodsId(String goodsId);
}