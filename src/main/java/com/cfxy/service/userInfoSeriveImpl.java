package com.cfxy.service;

import com.cfxy.dao.userInfoDao;
import com.cfxy.pojo.collectInfo;
import com.cfxy.pojo.postInfo;
import com.cfxy.pojo.userInfo;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author LiuYunDa
 * @date 2019/8/8 - 11:26
 */

@Service
public class userInfoSeriveImpl implements userInfoService{
    @Resource
    private userInfoDao userInfoDao;
    public userInfo Login(String userName, String userPwd) {
        userInfo userInfo = userInfoDao.Login(userName,userPwd);
        return userInfo;
    }

    public userInfo selectUserInfo(Integer id) {
        userInfo userInfo =  userInfoDao.selectUserInfo(id);
        return userInfo;
    }

    public userInfo getUserInfo(Integer id) {
        userInfo userInfo =  userInfoDao.getUserInfo(id);
        return userInfo;
    }

    public void updateUserInfo(userInfo userInfo) {
        userInfoDao.updateUserInfo(userInfo);
    }

    public int uploadUserInfo(userInfo userInfo) {
        return userInfoDao.uploadUserInfo(userInfo);
    }

    public userInfo checkUserName(String userName) {
        userInfo userInfo = userInfoDao.checkUserName(userName);
        return userInfo;
    }

    public int addPostInfo( String title, String htmlContent, String markdownContent,Integer createUserId) {

        return userInfoDao.addPostInfo(title,htmlContent,markdownContent,createUserId);

    }

    public List<postInfo> queryPostInfo(Integer createUserId) {
        List<postInfo> list = userInfoDao.queryPostInfo(createUserId);
        return  list;
    }

    public postInfo PostDetailPage(Integer id) {
        return userInfoDao.PostDetailPage(id);
    }

    public int editPostInfo(String title, String htmlContent, String markdownContent, Integer id) {
        return userInfoDao.editPostInfo(title,htmlContent,markdownContent,id);
    }

    public int delPostInfo(Integer id) {
        return userInfoDao.delPostInfo(id);
    }

    public List<postInfo> queryTop8() {
        return userInfoDao.queryTop8();
    }

    public int collectPost(Integer userId, Integer postId, Boolean collectStatus) {
        return userInfoDao.collectPost(userId,postId,collectStatus);
    }

    public collectInfo judgePost(Integer userId, Integer postId) {
        return userInfoDao.judgePost(userId,postId);
    }

    public List<postInfo> queryCollectInfo(Integer userId) {
        return userInfoDao.queryCollectInfo(userId);
    }

    public int delCollectInfo(Integer userId, Integer postId) {
        return userInfoDao.delCollectInfo(userId,postId);
    }

    public String queryUserNameByCreateUserId(Integer createUserId) {
        return userInfoDao.queryUserNameByCreateUserId(createUserId);
    }

    public List<postInfo> FuzzyQueryPostInfo(String title) {
        return userInfoDao.FuzzyQueryPostInfo(title);
    }

    // public int updateCollectStatus(Integer userId, Integer postId, Boolean collectStatus) {
    //     return userInfoDao.updateCollectStatus(userId,postId,collectStatus);
    //
    // }


}
