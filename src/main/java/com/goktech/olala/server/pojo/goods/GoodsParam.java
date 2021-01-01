package com.goktech.olala.server.pojo.goods;

public class GoodsParam {
    private String goodsId;

    private Short brandId;

    private String foodTaste;

    private Float weight;

    private Float length;

    private String size;

    private String color;

    private String packages;

    private String storageType;

    private String sourceAddr;

    private String produceAddr;

    private String ingredients;

    private String specs;

    private String proStandard;

    private String proLicenseNo;

    private String eatMethod;

    private Integer clickCount;

    private Boolean isAlonesale;

    private Integer integral;

    private Boolean isDelete;

    private Boolean isBest;

    private Boolean isNew;

    private Boolean isHot;

    private Boolean isPromote;

    private Integer bonusTypeId;

    private String sellerNote;

    private Integer giveIntegral;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }

    public Short getBrandId() {
        return brandId;
    }

    public void setBrandId(Short brandId) {
        this.brandId = brandId;
    }

    public String getFoodTaste() {
        return foodTaste;
    }

    public void setFoodTaste(String foodTaste) {
        this.foodTaste = foodTaste == null ? null : foodTaste.trim();
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Float getLength() {
        return length;
    }

    public void setLength(Float length) {
        this.length = length;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size == null ? null : size.trim();
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
    }

    public String getPackages() {
        return packages;
    }

    public void setPackages(String packages) {
        this.packages = packages == null ? null : packages.trim();
    }

    public String getStorageType() {
        return storageType;
    }

    public void setStorageType(String storageType) {
        this.storageType = storageType == null ? null : storageType.trim();
    }

    public String getSourceAddr() {
        return sourceAddr;
    }

    public void setSourceAddr(String sourceAddr) {
        this.sourceAddr = sourceAddr == null ? null : sourceAddr.trim();
    }

    public String getProduceAddr() {
        return produceAddr;
    }

    public void setProduceAddr(String produceAddr) {
        this.produceAddr = produceAddr == null ? null : produceAddr.trim();
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients == null ? null : ingredients.trim();
    }

    public String getSpecs() {
        return specs;
    }

    public void setSpecs(String specs) {
        this.specs = specs == null ? null : specs.trim();
    }

    public String getProStandard() {
        return proStandard;
    }

    public void setProStandard(String proStandard) {
        this.proStandard = proStandard == null ? null : proStandard.trim();
    }

    public String getProLicenseNo() {
        return proLicenseNo;
    }

    public void setProLicenseNo(String proLicenseNo) {
        this.proLicenseNo = proLicenseNo == null ? null : proLicenseNo.trim();
    }

    public String getEatMethod() {
        return eatMethod;
    }

    public void setEatMethod(String eatMethod) {
        this.eatMethod = eatMethod == null ? null : eatMethod.trim();
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public Boolean getIsAlonesale() {
        return isAlonesale;
    }

    public void setIsAlonesale(Boolean isAlonesale) {
        this.isAlonesale = isAlonesale;
    }

    public Integer getIntegral() {
        return integral;
    }

    public void setIntegral(Integer integral) {
        this.integral = integral;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    public Boolean getIsBest() {
        return isBest;
    }

    public void setIsBest(Boolean isBest) {
        this.isBest = isBest;
    }

    public Boolean getIsNew() {
        return isNew;
    }

    public void setIsNew(Boolean isNew) {
        this.isNew = isNew;
    }

    public Boolean getIsHot() {
        return isHot;
    }

    public void setIsHot(Boolean isHot) {
        this.isHot = isHot;
    }

    public Boolean getIsPromote() {
        return isPromote;
    }

    public void setIsPromote(Boolean isPromote) {
        this.isPromote = isPromote;
    }

    public Integer getBonusTypeId() {
        return bonusTypeId;
    }

    public void setBonusTypeId(Integer bonusTypeId) {
        this.bonusTypeId = bonusTypeId;
    }

    public String getSellerNote() {
        return sellerNote;
    }

    public void setSellerNote(String sellerNote) {
        this.sellerNote = sellerNote == null ? null : sellerNote.trim();
    }

    public Integer getGiveIntegral() {
        return giveIntegral;
    }

    public void setGiveIntegral(Integer giveIntegral) {
        this.giveIntegral = giveIntegral;
    }
}