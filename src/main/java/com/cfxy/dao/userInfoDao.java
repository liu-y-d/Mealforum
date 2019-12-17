package com.cfxy.dao;

import com.cfxy.pojo.collectInfo;
import com.cfxy.pojo.postInfo;
import com.cfxy.pojo.userInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author LiuYunDa
 * @date 2019/8/8 - 11:23
 */
@Repository("userInfoDao")
public interface userInfoDao {
	userInfo Login(@Param("userName") String userName, @Param("userPwd") String userPwd);

	userInfo selectUserInfo(Integer id);

	userInfo getUserInfo(Integer id);

	void updateUserInfo(userInfo userInfo);

	int uploadUserInfo(userInfo userInfo);

	userInfo checkUserName(String userName);

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

	//更新帖子收藏状态
	//int updateCollectStatus(@Param("userId")Integer userId,@Param("postId")Integer postId,@Param("collectStatus")Boolean collectStatus);
	//根据用户id对收藏信息表进行查询
	List<postInfo> queryCollectInfo(@Param("userId") Integer userId);

	//根据创建帖子的createUserId查询作者名
	String queryUserNameByCreateUserId(@Param("createUserId")Integer createUserId);
	//根据userId和postId删除对应的收藏信息
	int delCollectInfo(@Param("userId")Integer userId ,@Param("postId")Integer postId);

	//帖子模糊查询
	List<postInfo> FuzzyQueryPostInfo(@Param("title")String title);
}
