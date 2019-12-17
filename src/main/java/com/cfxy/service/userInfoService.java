package com.cfxy.service;

import com.cfxy.pojo.collectInfo;
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
	int delCollectInfo(@Param("userId")Integer userId ,@Param("postId")Integer postId);
	//更新帖子收藏状态
	// int updateCollectStatus(@Param("userId") Integer userId, @Param("postId") Integer postId, @Param("collectStatus") Boolean collectStatus);
}
