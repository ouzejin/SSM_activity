package cn.edu.lingnan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired(required = true)
    private UserService userService;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String sno, String password, Model model, HttpSession session) {
		User bean = userService.login(sno, password);
		if(bean!=null) {
			session.setAttribute("loginUser", bean);
		}else {
			model.addAttribute("msg", "用户名或密码错误");
			return "forward:../fail.jsp";
		}
		return "success";
	}
}
