package com.buptsse.spm.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.buptsse.spm.domain.User;
import com.buptsse.spm.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
/**
 * @author 杨涛
 * @date 2017年05月13日 16:14:12
 * @description 实现教师管理员查看学生视频学习进度
 * @modify	BUPT-TC 
 * @modifyDate 2017年5月13日16:14:34
 */
import com.opensymphony.xwork2.ActionSupport;
public class CheckStudentCourseAction extends ActionSupport {

	private static Logger LOG = LoggerFactory.getLogger(CheckStudentCourseAction.class);
	
	@Resource
	private IUserService userService;

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String checkStudentCourse() {

		try {
			List<User> studentList = new ArrayList<User>();
			List<User> list = new ArrayList<User>();
			list = userService.findAllUser();
			System.out.println("normal size " + list.size());
			Iterator<User> iterator = list.iterator();
			while (iterator.hasNext()) {
				User user = (User) iterator.next();
				System.out.println("user : " + user.getPosition());
				if (user.getPosition().endsWith("3")){
					studentList.add(user);
					System.out.println("add");
				}
			}
			Map session = (Map) ActionContext.getContext().getSession();
			System.out.println("studentList size " + studentList.size());
			session.put("studentList", studentList);
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		LOG.error("开始保存数据");
		return SUCCESS;
	}

}
