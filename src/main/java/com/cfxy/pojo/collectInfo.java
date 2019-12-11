package com.cfxy.pojo;

/**
 * @author HuaYanHe
 * @date 2019/12/11 - 23:50
 * 收藏信息
 */
public class collectInfo {
    private Integer postId;
    private Integer userId;
    private Boolean collectStatus;//收藏状态
    private Boolean likeStatus;//喜欢状态

    @Override
    public String toString() {
        return "collectInfo{" +
                "postId=" + postId +
                ", userId=" + userId +
                ", collectStatus=" + collectStatus +
                ", likeStatus=" + likeStatus +
                '}';
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Boolean getCollectStatus() {
        return collectStatus;
    }

    public void setCollectStatus(Boolean collectStatus) {
        this.collectStatus = collectStatus;
    }

    public Boolean getLikeStatus() {
        return likeStatus;
    }

    public void setLikeStatus(Boolean likeStatus) {
        this.likeStatus = likeStatus;
    }
}
