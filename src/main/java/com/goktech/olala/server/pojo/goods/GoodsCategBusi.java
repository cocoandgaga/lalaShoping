package com.goktech.olala.server.pojo.goods;

public class GoodsCategBusi {
    private Long catyBusiId;

    private String businessId;

    private Integer categoryId;

    private Integer parentCategId;

    public Long getCatyBusiId() {
        return catyBusiId;
    }

    public void setCatyBusiId(Long catyBusiId) {
        this.catyBusiId = catyBusiId;
    }

    public String getBusinessId() {
        return businessId;
    }

    public void setBusinessId(String businessId) {
        this.businessId = businessId == null ? null : businessId.trim();
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getParentCategId() {
        return parentCategId;
    }

    public void setParentCategId(Integer parentCategId) {
        this.parentCategId = parentCategId;
    }
}