package com.goktech.olala.server.pojo.order;

import lombok.Data;

import java.util.Date;
@Data
public class OrderDetail {
    private Integer orderDetailId;

    private Long orderId;

    private String goodsId;

    private String goodsName;

    private Integer goodsCnt;

    private Integer goodsPrice;

    private Integer averageCost;

    private Float weight;

    private Integer districtMoney;

    private Integer whid;

    private Date modifiedTime;

}