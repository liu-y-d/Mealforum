package com.cfxy.pojo;

import java.util.Date;

/**
 * @ClassName commentInfo
 * @Description 评论表信息
 * @Author Lyd
 * @Date 2019/12/22 20:15
 **/
public class commentInfo {
	private Integer commentId;//评论id
	private Integer userId;//用户id
	private Integer postId;//帖子id
	private String comments;//评论内容
	private String commentTime;//评论时间
	private String userName;//评论人名字

	public commentInfo(Integer commentId, Integer userId, Integer postId, String comments, String commentTime, String userName) {
		this.commentId = commentId;
		this.userId = userId;
		this.postId = postId;
		this.comments = comments;
		this.commentTime = commentTime;
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	@Override
	public String toString() {
		return "commentInfo{" +
				"commentId=" + commentId +
				", userId=" + userId +
				", postId=" + postId +
				", comments='" + comments + '\'' +
				", commentTime='" + commentTime + '\'' +
				", userName='" + userName + '\'' +
				'}';
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public commentInfo() {
	}

	public commentInfo(Integer commentId, Integer userId, Integer postId, String comments, String commentTime) {
		this.commentId = commentId;
		this.userId = userId;
		this.postId = postId;
		this.comments = comments;
		this.commentTime = commentTime;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
}
