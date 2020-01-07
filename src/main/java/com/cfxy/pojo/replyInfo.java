package com.cfxy.pojo;

/**
 * @ClassName replyInfo
 * @Description TODO
 * @Author Lyd
 * @Date 2019/12/22 20:25
 **/
public class replyInfo {
	private Integer commentId;//评论id
	private Integer userId;//用户id
	private Integer replyUserId;//被回复用户id
	private String replyTime;//回复时间
	private String replyContent;//回复内容

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

	public Integer getReplyUserId() {
		return replyUserId;
	}

	public void setReplyUserId(Integer replyUserId) {
		this.replyUserId = replyUserId;
	}

	public String getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(String replyTime) {
		this.replyTime = replyTime;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
}
