package com.cfxy.service;

import com.cfxy.pojo.collectInfo;
import com.cfxy.pojo.commentInfo;
import com.cfxy.pojo.postInfo;
import com.cfxy.pojo.userInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author LiuYunDa
 * @date 2019/8/8 - 11:26
 */
public interface userInfoService {
	public userInfo Login(String userName, String userPwd);

	public userInfo selectUserInfo(Integer id);

	public userInfo getUserInfo(Integer id);

	public void updateUserInfo(userInfo userInfo);

	public int uploadUserInfo(userInfo userInfo);

	public userInfo checkUserName(String userName);

	//用户发帖功能实现
	int addPostInfo(@Param("title") String title, @Param("htmlContent") String htmlContent, @Param("markdownContent") String markdownContent, @Param("createUserId") Integer createUserId);

	//查询帖子信息
	List<postInfo> queryPostInfo(@Param("createUserId") Integer createUserId);

	//查询帖子详细信息
	postInfo PostDetailPage(@Param("id") Integer id);

	//修改帖子信息
	int editPostInfo(@Param("title") String title, @Param("htmlContent") String htmlContent, @Param("markdownContent") String markdownContent, @Param("id") Integer id);

	//删除帖子信息
	int delPostInfo(@Param("id") Integer id);

	//查询喜欢数前8的帖子
	List<postInfo> queryTop8();

	//收藏帖子
	int collectPost(@Param("userId") Integer userId, @Param("postId") Integer postId, @Param("collectStatus") Boolean collectStatus);

	//判断用户是否收藏过该帖子
	collectInfo judgePost(@Param("userId") Integer userId, @Param("postId") Integer postId);

	//根据用户id对收藏信息表进行查询
	List<postInfo> queryCollectInfo(@Param("userId") Integer userId);

	//根据userId和postId删除对应的收藏信息
	int delCollectInfo(@Param("userId") Integer userId, @Param("postId") Integer postId);

	//根据创建帖子的createUserId查询作者名
	String queryUserNameByCreateUserId(@Param("createUserId") Integer createUserId);

	//帖子模糊查询
	List<postInfo> FuzzyQueryPostInfo(@Param("title") String title);

	//加载点赞状态
	Boolean loadLikeStatus(@Param("userId") Integer userId, @Param("postId") Integer postId);

	//点赞帖子
	int likePost(@Param("userId") Integer userId, @Param("postId") Integer postId, @Param("likeStatus") Boolean likeStatus);

	//根据userId和postId删除对应的点赞信息
	int delLikeInfo(@Param("userId") Integer userId, @Param("postId") Integer postId);

	//帖子收藏数加一
	int updatePostCollectNumberAddOne(@Param("id") Integer id);

	//帖子收藏数减一
	int updatePostCollectNumberMinOne(@Param("id") Integer id);

	//帖子点赞数加一
	int updatePostLikeNumberAddOne(@Param("id") Integer id);

	//帖子点赞数减一
	int updatePostLikeNumberMinOne(@Param("id") Integer id);
	//发表评论
	commentInfo comment(@Param("userId")Integer userId, @Param("postId")Integer postId, @Param("comments")String comments, @Param("commentTime")String commentTime);
	//根据帖子id获取帖子所有评论信息
	List<commentInfo> queryComment(@Param("postId")Integer postId);

}
