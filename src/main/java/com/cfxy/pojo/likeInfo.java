package com.cfxy.pojo;

/**
 * @ClassName likeInfo
 * @Description 点赞信息表
 * @Author Lyd
 * @Date 2019/12/18 22:57
 **/
public class likeInfo {
	private Integer postId;
	private Integer userId;
	private Boolean likeStatus;//点赞状态

	@Override
	public String toString() {
		return "likeInfo{" +
				"postId=" + postId +
				", userId=" + userId +
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

	public Boolean getLikeStatus() {
		return likeStatus;
	}

	public void setLikeStatus(Boolean likeStatus) {
		this.likeStatus = likeStatus;
	}
}
