package com.cfxy.pojo;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author LiuYunDa
 * @date 2019/8/8 - 10:53
 * 用户信息
 */
public class userInfo {
    private Integer id;
    private String userName;
    private String userPwd;
    private String img;
    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public userInfo() {
    }
    public userInfo(String userName, String userPwd) {
        this.userName = userName;
        this.userPwd = userPwd;
    }
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    @Override
    public String toString() {
        return "userInfo{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", img='" + img + '\'' +
                ", file=" + file +
                '}';
    }
}
