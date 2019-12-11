package com.cfxy.pojo;

import org.springframework.web.multipart.MultipartFile;

import javax.xml.soap.Text;

/**
 * @author HuaYanHe
 * @date 2019/11/21 - 17:59
 * 帖子信息
 */
public class postInfo {
//    private Integer postId;//帖子Id
//    private String postTitle;//帖子标题
//    private String postText;//帖子文本
//    private String postImg;//帖子图片
//    private MultipartFile file;
//    private String postContent;
    private Integer id;
    private String title;
    private String htmlContent;
    private String markdownContent;
    private Integer createUserId;
    private Integer collectNumber;//收藏数
    private Integer likeNumber;//点赞数


    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }


    @Override
    public String toString() {
        return "postInfo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", htmlContent='" + htmlContent + '\'' +
                ", markdownContent='" + markdownContent + '\'' +
                ", createUserId=" + createUserId +
                ", collectNumber=" + collectNumber +
                ", likeNumber=" + likeNumber +
                '}';
    }

    public Integer getCollectNumber() {
        return collectNumber;
    }

    public void setCollectNumber(Integer collectNumber) {
        this.collectNumber = collectNumber;
    }

    public Integer getLikeNumber() {
        return likeNumber;
    }

    public void setLikeNumber(Integer likeNumber) {
        this.likeNumber = likeNumber;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    public String getMarkdownContent() {
        return markdownContent;
    }

    public void setMarkdownContent(String markdownContent) {
        this.markdownContent = markdownContent;
    }
}
