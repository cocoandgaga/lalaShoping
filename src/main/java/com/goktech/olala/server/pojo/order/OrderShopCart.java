package com.goktech.olala.server.pojo.order;

import java.util.Date;

public class OrderShopCart {
    private Long shopCartId;

    private String customerId;

    private String sessionId;

    private String goodsId;

    private String goodsSn;

    private String goodsName;

    private Boolean cartType;

    private Integer goodsAmount;

    private Integer marketPrice;

    private Integer shopPrice;

    private Integer realBuyPrice;

    private Boolean isOpenSale;

    private String parentGoodsId;

    private Short isGift;

    private Boolean canHandle;

    private Date addTime;

    private Date modifiedTime;

    private String goodsAttr;

    public Long getShopCartId() {
        return shopCartId;
    }

    public void setShopCartId(Long shopCartId) {
        this.shopCartId = shopCartId;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId == null ? null : sessionId.trim();
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public String getGoodsSn() {
        return goodsSn;
    }

    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn == null ? null : goodsSn.trim();
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Boolean getCartType() {
        return cartType;
    }

    public void setCartType(Boolean cartType) {
        this.cartType = cartType;
    }

    public Integer getGoodsAmount() {
        return goodsAmount;
    }

    public void setGoodsAmount(Integer goodsAmount) {
        this.goodsAmount = goodsAmount;
    }

    public Integer getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Integer marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Integer getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Integer shopPrice) {
        this.shopPrice = shopPrice;
    }

    public Integer getRealBuyPrice() {
        return realBuyPrice;
    }

    public void setRealBuyPrice(Integer realBuyPrice) {
        this.realBuyPrice = realBuyPrice;
    }

    public Boolean getIsOpenSale() {
        return isOpenSale;
    }

    public void setIsOpenSale(Boolean isOpenSale) {
        this.isOpenSale = isOpenSale;
    }

    public String getParentGoodsId() {
        return parentGoodsId;
    }

    public void setParentGoodsId(String parentGoodsId) {
        this.parentGoodsId = parentGoodsId == null ? null : parentGoodsId.trim();
    }

    public Short getIsGift() {
        return isGift;
    }

    public void setIsGift(Short isGift) {
        this.isGift = isGift;
    }

    public Boolean getCanHandle() {
        return canHandle;
    }

    public void setCanHandle(Boolean canHandle) {
        this.canHandle = canHandle;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getGoodsAttr() {
        return goodsAttr;
    }

    public void setGoodsAttr(String goodsAttr) {
        this.goodsAttr = goodsAttr == null ? null : goodsAttr.trim();
    }
}