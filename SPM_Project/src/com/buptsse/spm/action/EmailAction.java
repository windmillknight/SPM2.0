package com.buptsse.spm.action;

import java.io.IOException;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.buptsse.spm.domain.ConfigInfo;
import com.buptsse.spm.domain.Course;
import com.buptsse.spm.service.IConfigInfoService;
import com.buptsse.spm.service.ISelectCourseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


/**
 * @author BUPT-TC
 * @date 2015年11月20日
 * @description 实现邮件处理相关功能
 * @modify BUPT-TC
 * @modifyDate 
 */
public class EmailAction extends ActionSupport{

	Properties properties = new Properties();
	private static final long serialVersionUID = 1L;
	private static Logger LOG = LoggerFactory.getLogger(EmailAction.class);
	@Resource
	private ISelectCourseService selectCourseService;
	@Resource
	public IConfigInfoService configInfoService;
	
	public IConfigInfoService getConfigInfoService() {
		return configInfoService;
	}

	public void setConfigInfoService(IConfigInfoService configInfoService) {
		this.configInfoService = configInfoService;
	}

	public String emailTo; // 收件人邮箱地址
	public String emailFrom; // 发件人邮箱地址
	public String password; // 发件人邮箱密码
	public String subject = "test"; // 邮件主题
	public String content = "sdf"; // 邮件内容
	public String smtpStyle; // 邮箱的smtp类型
//	public String studentIds;
	public String msg = "";


	// 设置smtp的类型
	public void setEmailStyle() {
		String emailFrom2 = this.emailFrom;
		String style = emailFrom2.substring(emailFrom2.indexOf('@') + 1,
				emailFrom2.indexOf('.'));
		this.smtpStyle = "smtp." + style + ".com";
	}
	
	/**
	 * 发邮件通知功能
	 * @return
	 * @throws Exception
	 */
	public String emailNotify() throws Exception{
		System.out.println("********后台发邮件****");
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.smtp.auth", "true");
		properties.put("mail.smtp.host", "smtp.qq.com");
		properties.put("mail.smtp.port", "587");
		properties.put("mail.user", "771089057@qq.com");
		properties.put("mail.password", "cyffwvmyyowqbbdd");
		
		
		Authenticator authenticator = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication(){
				String userName = properties.getProperty("mail.user");
				String password = properties.getProperty("mail.password");
				PasswordAuthentication pa = new PasswordAuthentication(userName, password);
				return pa;
			}
		};
		
		Session session = Session.getInstance(properties,authenticator);
		MimeMessage message = new MimeMessage(session);
		InternetAddress from = 
				new InternetAddress(properties.getProperty("mail.user"));
		message.setFrom(from);	
		String msg ="";
		String[] stuIdArray =  ServletActionContext.getRequest().getParameterValues("studentIds[]"); 
		String[] emailArray = ServletActionContext.getRequest().getParameterValues("emails[]");
		
		try {
			for (int i = 0; i < stuIdArray.length; i++) {
				Course course = selectCourseService.findCourse(stuIdArray[i]);
				message.setRecipient(RecipientType.TO, new InternetAddress(course.getEmail()));
				if(course.getFinalGrade().compareTo(new BigDecimal(60))==-1){
					message.setSubject("预警通知");
					message.setContent("</br>&nbsp;&nbsp;&nbsp;&nbsp;"+course.getName()+"同学，您的成绩为"+
				                        course.getFinalGrade()+"分，请留意课程平台的补考相关通知。</br>", "text/html;charset=UTF-8");	
				}else{
					message.setSubject("成绩通知");
					message.setContent("</br>&nbsp;&nbsp;&nbsp;&nbsp;"+course.getName()+"同学，您的成绩为"+
					                    course.getFinalGrade()+"分，请继续努力。</br>", "text/html;charset=UTF-8");
				}
				Transport.send(message);
				if(i>0){
					msg = "群发通知成绩成功！</br>"; 
				}		
			}
			ServletActionContext.getResponse().getWriter().write(msg);
			return "success";
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "邮件发送失败，请联系管理员！";
			return "error";
		}
	
	}	
	
	
	
	
	/**
	 * 邮件发送方法,供邮件发送功能调用
	 * @param subject 主题
	 * @param content 内容
	 * @param emailTo 收件人
	 * @throws Exception
	 */
	public void sendEmail(String subject, String content, String emailTo)
	throws Exception {
		Properties props = new Properties();
		props.put("mail.smtp.host", smtpStyle);
		props.put("mail.smtp.auth", "true"); // 
		
		Session sendMailSession = Session.getInstance(props, null);
		
		Transport transport = sendMailSession.getTransport("smtp");
		// 根据邮箱地址和密码连接邮箱
		
		transport.connect(smtpStyle, emailFrom, password);
		Message newMessage = new MimeMessage(sendMailSession);
		
		// 设置mail主题
		newMessage.setSubject(subject);
		
		// 设置发信人地址
		String strFrom = new String(emailFrom.getBytes(), "iso-8859-1");
		newMessage.setFrom(new InternetAddress(strFrom));
		
		Address addressTo[] = { new InternetAddress(emailTo) };
		newMessage.setRecipients(Message.RecipientType.TO, addressTo);
		
		// 设置mail正文
		newMessage.setSentDate(new java.util.Date());
		newMessage.setText(content);
		
		newMessage.saveChanges(); // 保存发送信息
		transport.sendMessage(newMessage, newMessage
				.getRecipients(Message.RecipientType.TO)); // 发送邮件
		
		transport.close();
		// Transport.send(newMessage);

	}

	public ISelectCourseService getSelectCourseService() {
		return selectCourseService;
	}

	public void setSelectCourseService(ISelectCourseService selectCourseService) {
		this.selectCourseService = selectCourseService;
	}		
	




		
}
