package com.cfxy.dao;

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
    public userInfo Login(@Param("userName") String userName,@Param("userPwd") String userPwd);
    public userInfo selectUserInfo(Integer id);
    public userInfo getUserInfo(Integer id);
    public void updateUserInfo(userInfo userInfo);
    public int uploadUserInfo(userInfo userInfo);
    public userInfo checkUserName(String userName);
    //用户发帖功能实现
    int addPostInfo(@Param("createUserId")Integer createUserId,@Param("title")String title,@Param("htmlContent")String htmlContent,@Param("markdownContent")String markdownContent);
    //查询帖子信息
    List<postInfo> queryPostInfo(@Param("createUserId")Integer createUserId);
    //查询帖子详细信息
    postInfo PostDetailPage(@Param("id")Integer id);
    //修改帖子信息
    int editPostInfo(@Param("title")String title,@Param("htmlContent")String htmlContent,@Param("markdownContent")String markdownContent,@Param("id")Integer id);
    //删除帖子信息
    int delPostInfo(@Param("id")Integer id);
    //查询喜欢数前8的帖子
    List<postInfo> queryTop8();
}
