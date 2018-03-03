package com.cn.hnust.controller;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;
import com.cn.hnust.util.Crypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;

	@RequestMapping("/checkUsername")
	public String checkUsername(HttpServletRequest request){
		return "login";
	}
	@RequestMapping("/center")
	public ModelAndView personCenter(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		int uid = (Integer)session.getAttribute("uid");
		User user = userService.getUserById(uid);
		mv.addObject("user",user);
		String headPath = user.getPhoto();
		System.out.println(headPath);
		mv.setViewName("person");
		return mv;
	}
	@RequestMapping(method = RequestMethod.POST,value = "/regist")
	public String toAddUser(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		password = Crypt.encrype(password);
		String phone = request.getParameter("phone");
		String validate = request.getParameter("validate");
		/*if(validate!=null&&validate.equals(session.getAttribute("validate"))) {*/
			User user = new User();
			//user.setuId(UUIDUtil.getUUID());
			user.setuNickname(username);
			user.setuPassword(password);
			user.setuPhone(phone);
			userService.insertUser(user);
			return "login";
		/*}else{
			model.addAttribute("warm","验证码输入不正确");
			return "regist";
		}*/
	}
	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request,Model model){
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = this.userService.getUserById(userId);
		model.addAttribute("user", user);
		return "showUser";
	}
}
