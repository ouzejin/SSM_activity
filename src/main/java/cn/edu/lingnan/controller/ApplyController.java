package cn.edu.lingnan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.lingnan.pojo.Apply;
import cn.edu.lingnan.pojo.Examine;
import cn.edu.lingnan.service.ApplyService;
import cn.edu.lingnan.service.ExamineService;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	@Autowired
	private ApplyService applyService;
	@Autowired
	private ExamineService examineService;
	
	@GetMapping("/findMyApply")
	public String findMyApply(HttpSession session,HttpServletRequest req) {
		String sNo = req.getParameter("sNo");
		List<Apply> myApply = applyService.findMyApply(sNo);
		session.setAttribute("myApply", myApply);
		return "forward:../admin/index/myapply-list.jsp";
	}
	
	//申请活动
	@PostMapping("/applyActivity")
	public String applyActicity(Apply apply,Examine examine,HttpServletRequest req,HttpSession session) {
		//先将申请的活动信息插入到申请活动表
		apply.setaName(req.getParameter("aName"));
		apply.setaContent(req.getParameter("aContent"));
		apply.setaPlace(req.getParameter("aPlace"));
		apply.setaTime(req.getParameter("aTime"));
		apply.setPhone(req.getParameter("phone"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd~HH:mm:ss");
		String applyTime = df.format(new Date());
		apply.setApplyTime(applyTime);
		apply.setsName((String)session.getAttribute("userName"));
		apply.setsNo((String)session.getAttribute("user"));
		int result = applyService.applyActivity(apply);
		//再将申请的活动信息插入到待审核活动表
		if(result>0) {
			examine.setaContent(req.getParameter("aContent"));
			examine.setaName(req.getParameter("aName"));
			examine.setaPlace(req.getParameter("aPlace"));
			examine.setaTime(req.getParameter("aTime"));
			examine.setPhone(req.getParameter("phone"));
			examine.setsName((String)session.getAttribute("userName"));
			examine.setsNo((String)session.getAttribute("user"));
			examine.setApplyTime(applyTime);
			examineService.insertExamine(examine);
		}
		//返回我的申请活动列表
		return "forward:../admin/index/myapply-list.jsp";
	}
}
