package com.cfxy.controller;

import com.alibaba.fastjson.JSON;
import com.cfxy.pojo.collectInfo;
import com.cfxy.pojo.commentInfo;
import com.cfxy.pojo.postInfo;
import com.cfxy.pojo.userInfo;
import com.cfxy.service.userInfoService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * @author LiuYunDa
 * @date 2019/8/8 - 11:29
 */
@Controller
@RequestMapping("/user")
public class userInfoController {
	@Resource
	private userInfoService userInfoService;

	@RequestMapping("/Login")
	public String Login(String userName, String userPwd, Model model, HttpSession session) {
		userInfo userInfo = userInfoService.Login(userName, userPwd);
		if (userInfo != null) {
			session.setAttribute("userInfo", userInfo);
			List<postInfo> list = userInfoService.queryTop8();
			model.addAttribute("list", list);
			return "main";
		} else {
			model.addAttribute("msg", "登录失败，用户名或密码错误！");
			return "redirect:/LoginError.jsp";
		}

	}

	//跳转主页面
	@RequestMapping("toMain")
	public String toMain(Model model) {
		List<postInfo> list = userInfoService.queryTop8();
		model.addAttribute("list", list);
		return "main";
	}

	//跳转个人信息页面
	@RequestMapping("/toHomePage")
	public String toHomePage(Integer id, Model model) {
		userInfo userInfo = userInfoService.selectUserInfo(id);
		model.addAttribute("userInfo", userInfo);
		return "homePage";
	}

	//获取主键id的其他信息
	@RequestMapping("/getUserInfo")
	public String getUserInfo(Integer id, Model model) {
		userInfo userInfo = userInfoService.getUserInfo(id);
		model.addAttribute("userInfo", userInfo);
		return "editUserInfo";
	}

	//更新用户信息并返回到主页面
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo(userInfo userInfo, MultipartFile file) throws IOException {
		/**
		 * 上传图片
		 */
		//图片上传成功后，将图片的地址写到数据库
		String filePath = "D:\\File";//保存图片的路径
		//获取原始图片的拓展名
		String originalFilename = file.getOriginalFilename();
		//新的文件名字
		String newFileName = "/images/" + UUID.randomUUID() + originalFilename;
		//封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		//把本地文件上传到封装上传文件位置的全路径
		file.transferTo(targetFile);
		userInfo.setImg(newFileName);
		userInfoService.updateUserInfo(userInfo);
		return "main";
	}

	//跳转到注册
	@RequestMapping("/toRegistUserInfo")
	public String toRegistUserInfo() {
		return "registUserInfo";
	}

	//注册个人信息
	@RequestMapping("/registUserInfo")
	public String uploadUserInfo(MultipartFile file, userInfo userInfo, Model model) throws IOException {
		/**
		 * 上传图片
		 */
		//图片上传成功后，将图片的地址写到数据库
		String filePath = "D:\\File";//保存图片的路径
		//获取原始图片的拓展名
		String originalFilename = file.getOriginalFilename();
		//新的文件名字
		String newFileName = "/images/" + UUID.randomUUID() + originalFilename;
		//封装上传文件位置的全路径
		File targetFile = new File(filePath, newFileName);
		//把本地文件上传到封装上传文件位置的全路径
		file.transferTo(targetFile);
		userInfo.setImg(newFileName);
		/**
		 * 保存
		 */
		model.addAttribute("userInfo", userInfo);
		int i = userInfoService.uploadUserInfo(userInfo);
		if (i != 0) {
			return "redirect:/Login.jsp";
		} else {
			//注册失败跳转，后续功能
			return "";
		}

	}

	//校验重名
	@RequestMapping(value = "/checkName/{userName}", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String checkName(@PathVariable("userName") String userName) {
		userInfo userInfo = userInfoService.checkUserName(userName);
		String keYong = "用户名可用";
		if (userInfo == null) {
			return JSON.toJSONString(keYong);
		} else {
			return JSON.toJSONString("用户名已存在");
		}
	}

	//跳转用户发帖页面
	@RequestMapping("toPost")
	public String toPost() {
		return "/post/postPage";
	}

	//发帖
	@RequestMapping(value = "post", method = RequestMethod.POST)
	@ResponseBody
	public postInfo articleContent(@RequestBody postInfo postInfo) {
		userInfoService.addPostInfo(postInfo.getTitle(), postInfo.getHtmlContent(), postInfo.getMarkdownContent(), postInfo.getCreateUserId());
		return postInfo;
	}

	//跳转到显示帖子页面
	@RequestMapping("toShowPost")
	public String toShowPost() {
		return "post/showPost";
	}

	//我的帖子页面的请求查看所有帖子信息
	@RequestMapping("queryPostInfo")
	public String queryPostInfo(Integer createUserId, Model model) {
		List<postInfo> list = userInfoService.queryPostInfo(createUserId);
		model.addAttribute("list", list);
		return "/post/myPostPage";
	}

	//跳转到帖子详情页面
	@RequestMapping("PostDetailPage")
	public String PostDetailPage(Integer id, Model model) {
		postInfo postInfo = userInfoService.PostDetailPage(id);
		String userName = userInfoService.queryUserNameByCreateUserId(postInfo.getCreateUserId());
		model.addAttribute("postInfo", postInfo);
		model.addAttribute("userName",userName);
		return "post/showPost";
	}

	//跳转到帖子修改页面
	@RequestMapping("toEditPostInfo")
	public String editPostInfo(Integer id, Model model) {
		postInfo postInfo = userInfoService.PostDetailPage(id);
		model.addAttribute("postInfo", postInfo);
		return "/post/editPostInfoPage";
	}

	//修改帖子
	@RequestMapping(value = "editPostInfo", method = RequestMethod.POST)
	@ResponseBody
	public postInfo editPostInfo(@RequestBody postInfo postInfo) {
		userInfoService.editPostInfo(postInfo.getTitle(), postInfo.getHtmlContent(), postInfo.getMarkdownContent(), postInfo.getId());
		return postInfo;
	}

	//删除帖子信息
	@RequestMapping(value = "delPostInfo", method = RequestMethod.POST)
	@ResponseBody
	public void delPostInfo(Integer id) {
		userInfoService.delPostInfo(id);
	}

	//刷新帖子排行（根据喜欢数排行）
	@RequestMapping("refreshRanking")
	public String refreshRanking(Model model) {
		List<postInfo> list = userInfoService.queryTop8();
		model.addAttribute("list", list);
		return "main";
	}

	//帖子收藏功能实现
	@RequestMapping(value = "collectPost", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String collectPost(Integer userId, Integer postId, Boolean collectStatus) {
		collectInfo collectInfo = userInfoService.judgePost(userId, postId);
		String message;
		if (collectInfo != null) {
			message = "您收藏过该帖子,请勿重复操作";
			return JSON.toJSONString(message);
		} else {
			int i = userInfoService.collectPost(userId, postId, collectStatus);
			userInfoService.updatePostCollectNumberAddOne(postId);
			message = "收藏成功！";
		}
		return JSON.toJSONString(message);

	}

	//跳转到我的收藏页面
	@RequestMapping("toMyCollectPage")
	public String toMyCollectPage(Integer userId, Model model) {
		List<postInfo> postInfos = userInfoService.queryCollectInfo(userId);
		model.addAttribute("postInfos", postInfos);
		return "post/myCollectPage";
	}

	//删除用户收藏信息
	@RequestMapping(value = "delCollectInfo", method = RequestMethod.POST)
	@ResponseBody
	public void delCollectInfo(Integer postId, Integer userId) {
		userInfoService.delCollectInfo(userId, postId);
		userInfoService.updatePostCollectNumberMinOne(postId);
	}

	//帖子模糊查询
    @RequestMapping("FuzzyQueryPostInfo")
    public String FuzzyQueryPostInfo(String title,Model model){
        List<postInfo> postInfos = userInfoService.FuzzyQueryPostInfo(title);
        model.addAttribute("postInfos",postInfos);
        return "post/queryResultPage";
    }
    //页面加载点赞状态
	@RequestMapping(value = "loadLikeStatus" ,method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String loadLikeStatus(Integer postId, Integer userId,Boolean likeStatus){
		Boolean resultLikeStatus = userInfoService.loadLikeStatus(userId, postId);
		String message;
		if (resultLikeStatus != null) {
			message = "取消点赞";
			userInfoService.delLikeInfo(userId,postId);
			userInfoService.updatePostLikeNumberMinOne(postId);
			return JSON.toJSONString(message);
		} else {
			userInfoService.likePost(userId, postId, likeStatus);
			userInfoService.updatePostLikeNumberAddOne(postId);
			message = "点赞成功！";
		}
		return JSON.toJSONString(message);
	}
	//评论功能实现
	@RequestMapping(value = "comment" , method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String comment(Integer userId,Integer postId,String comments,String commentTime){
		commentInfo comment = userInfoService.comment(userId, postId, comments, commentTime);
		return JSON.toJSONString(comment);
	}
	//获取所有评论条数
	//评论功能实现
	@RequestMapping(value = "queryComment" , method = RequestMethod.POST,produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String queryComment(Integer postId){
		List<commentInfo> comments = userInfoService.queryComment(postId);
		return JSON.toJSONString(comments);
	}

}



