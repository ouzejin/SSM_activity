package cn.edu.lingnan.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.lingnan.pojo.Applicant;
import cn.edu.lingnan.service.ApplicantService;

@Controller
@RequestMapping("/applicant")
public class ApplicantController {
	
	@Autowired
	private ApplicantService applicantService;
	
	@RequestMapping(value="/limitAll",method=RequestMethod.GET)
	public String limitAll(HttpServletRequest request,HttpSession session){
		int sumCount=applicantService.countNum();
        int page=0;
        int indexNum=1;//页数
        int size=10;//每页显示的数目
        if(request.getParameter("page")!=null){
            indexNum=Integer.parseInt(request.getParameter("page"));//页数
            page=(indexNum-1)*size;
        }
        HashMap<String,Object>map=new HashMap<String,Object>();
        map.put("page",page);
        map.put("size",size);
        sumCount=sumCount/size;
        List<Applicant> allApplicant = applicantService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		//List<Applicant> allApplicant = applicantService.getAllApplicant();
		session.setAttribute("allApplicant", allApplicant);
		return "forward:../admin/index/applicant-list.jsp";
	}
	
	@PostMapping("/updateInfo")
	public String updateInfo(HttpServletRequest req) {
		String sNo = req.getParameter("sno");
		String grade = req.getParameter("grade");
		String cName = req.getParameter("cname");
		String phone = req.getParameter("phone");
		applicantService.updateUserInfo(sNo, grade, cName, phone);
		return "forward:../admin/index/userinfo.jsp";
	}
	
	@PostMapping("/updatePhoneCheck")
	public void updatePhoneCheck(Applicant applicant,Applicant applicant2,HttpServletResponse resp,HttpServletRequest req) throws IOException {
		String phone = req.getParameter("phone");
		String sNo = req.getParameter("sNo");
		System.out.println("phone is "+phone+"  sNo is "+sNo);
		applicant = applicantService.getByPhone(phone);
		if(applicant!=null) {
			applicant2 = applicantService.findBySnoPhone(sNo, phone);
			if(applicant2!=null) {
				resp.getWriter().print("false");
			}else {
				resp.getWriter().print("true");
			}
		}else {
			resp.getWriter().print("false");
		}
			
	}
	
	@RequestMapping(value="/deleteBySno",method=RequestMethod.GET)
	public String deleteBySno(HttpServletRequest request, HttpServletResponse resp,HttpSession session){
		String sno = request.getParameter("sno");
		applicantService.deleteBySno(sno);
		int sumCount=applicantService.countNum();
        int page=0;
        int indexNum=1;//页数
        int size=10;//每页显示的数目
        if(request.getParameter("page")!=null){
            indexNum=Integer.parseInt(request.getParameter("page"));//页数
            page=(indexNum-1)*size;
        }
        HashMap<String,Object>map=new HashMap<String,Object>();
        map.put("page",page);
        map.put("size",size);
        sumCount=sumCount/size;
        List<Applicant> allApplicant = applicantService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		session.setAttribute("allApplicant", allApplicant);
		//List<Applicant> allApplicant = applicantService.getAllApplicant();
		return "forward:../admin/index/applicant-list.jsp";
	}
	
	@RequestMapping(value="/deleteAllApp",method=RequestMethod.GET)
	public String deleteAllApp(HttpServletRequest request, HttpServletResponse resp,HttpSession session){
			String [] allsno= request.getParameterValues("allsno");
			String [] temp =  allsno[0].split(",");
			for(String a:temp) {
				System.out.println(a);
				applicantService.deleteBySno(a);
			}
			int sumCount=applicantService.countNum();
	        int page=0;
	        int indexNum=1;//页数
	        int size=10;//每页显示的数目
	        if(request.getParameter("page")!=null){
	            indexNum=Integer.parseInt(request.getParameter("page"));//页数
	            page=(indexNum-1)*size;
	        }
	        HashMap<String,Object>map=new HashMap<String,Object>();
	        map.put("page",page);
	        map.put("size",size);
	        sumCount=sumCount/size;
	        List<Applicant> allApplicant = applicantService.queryList(map); //查询出所有用户列表,使用list接收
	        session.setAttribute("sum",sumCount);
	        session.setAttribute("indexNum",indexNum);
			session.setAttribute("allApplicant", allApplicant);
		return "forward:../admin/index/applicant-list.jsp";
	}
	
	@PostMapping("/updateBySno")
	public String updateBySno(Applicant applicant, HttpServletRequest req, HttpServletResponse resp,HttpSession session){
		applicant.setsNo(req.getParameter("sno")); 
		applicant.setsName(req.getParameter("sname"));
		applicant.setGrade(req.getParameter("grade"));
		applicant.setPassword(req.getParameter("password"));
		applicant.setcName(req.getParameter("cname"));
		applicant.setPhone(req.getParameter("phone"));
		int result = applicantService.updateBySno(applicant);
		List<Applicant> allApplicant = applicantService.getAllApplicant();
		session.setAttribute("allApplicant", allApplicant);
		return "forward:../admin/index/applicant-list.jsp";
	}
	
	@RequestMapping(value="/getBySno",method=RequestMethod.GET)
	public String getBySno(HttpServletRequest req, HttpServletResponse resp,HttpSession session) {
		String sno = req.getParameter("sno");
		System.out.println("sno is "+sno);
		Applicant applicant = applicantService.getBySno(sno);
		session.setAttribute("upApplicant", applicant);
		return "forward:../admin/index/applicant-edit.jsp";
	}
	
	@PostMapping("/insertApplicant")
	public String insertApplicant(Applicant applicant, HttpServletRequest req, HttpServletResponse resp,HttpSession session){
		applicant.setsNo(req.getParameter("sno")); 
		applicant.setsName(req.getParameter("sname"));
		System.out.println(req.getParameter("sno"));
		System.out.println(req.getParameter("sname"));
		applicant.setGrade(req.getParameter("grade"));
		applicant.setPassword(req.getParameter("password"));
		applicant.setcName(req.getParameter("cname"));
		applicant.setPhone(req.getParameter("phone"));
		int result = applicantService.insertApplicant(applicant);
		List<Applicant> allApplicant = applicantService.getAllApplicant();
		session.setAttribute("allApplicant", allApplicant);
		return "forward:../admin/index/applicant-list.jsp";
	}
	
	@PostMapping("/searchApplicant")
	public String searchApplicant(Applicant applicant, HttpServletRequest req, HttpServletResponse resp,HttpSession session) {
		String search = req.getParameter("search");
		String searchType = req.getParameter("searchType");
		System.out.println(search+"  "+searchType);
		List<Applicant> findApplicant = applicantService.searchApplicant(search,searchType);
		session.setAttribute("allApplicant", findApplicant);
		return "forward:../admin/index/applicant-list.jsp";
	}
	
	@PostMapping("/register")
    public String register(HttpServletRequest req,Applicant applicant) {
		applicant.setsNo(req.getParameter("sno")); 
		applicant.setsName(req.getParameter("sname"));
		System.out.println("sno is "+req.getParameter("sno"));
		System.out.println("sname is "+req.getParameter("sname"));
		applicant.setPassword(req.getParameter("password"));
		applicant.setPhone(req.getParameter("phone"));
        int result = applicantService.insertApplicant(applicant);
        if(result>0)
        	return "forward:../LoginSign/loginsign.jsp";
        else
        	return "forward:../fail.jsp";
    }
	
	@PostMapping("/loginCheck")
	public void loginCheck(Applicant applicant,ModelMap modelMap,HttpServletRequest req, HttpServletResponse resp,HttpSession session) throws IOException {
		String sno = req.getParameter("sno");
		String password = req.getParameter("password");
		modelMap.addAttribute("sno", sno);
		modelMap.addAttribute("password", password);
		applicant = applicantService.login(sno, password);
		if(applicant!=null) {			
			resp.getWriter().print("true");			
		}else
			 resp.getWriter().print("false");
			
	}
	
	@PostMapping("/home")
	public String loginSuccess(Applicant applicant,HttpSession session,HttpServletRequest req) {
		String sno = req.getParameter("sno");
		session.setAttribute("user", sno);
		String aSuper = applicantService.getApplicantSuper(sno);
		String username = applicantService.getApplicantName(sno);
		applicant = applicantService.getBySno(sno);
		if(aSuper.equals("1"))
		{
			session.setAttribute("userName", username);
			return "forward:../admin/index/index.jsp";
		}else {			
			session.setAttribute("userName", username);
			session.setAttribute("myInfo", applicant);
			return "forward:../admin/index/userhome.jsp";
		}
			
	}
	
	@RequestMapping("/loginout")
	public String loginout(HttpServletRequest request) {
		Enumeration em = request.getSession().getAttributeNames();
		while(em.hasMoreElements()){
			request.getSession().removeAttribute(em.nextElement().toString());
		}
		return "forward:../LoginSign/loginsign.jsp";
	}
	
	@PostMapping("/snoCheck")
	public void snoCheck(ModelMap modelMap,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String sno = req.getParameter("sno");
		modelMap.addAttribute("sno", sno);
		Applicant applicant = applicantService.getBySno(sno);
		if(applicant!=null) 
			resp.getWriter().print("true");
		else
			resp.getWriter().print("false");
	}
	
	@PostMapping("/phoneCheck")
	public void phoneCheck(ModelMap modelMap,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String phone = req.getParameter("phone");
		System.out.println("phone is "+phone);
		modelMap.addAttribute("phone", phone);
		Applicant applicant = applicantService.getByPhone(phone);
		if(applicant!=null) 
			resp.getWriter().print("true");
		else
			resp.getWriter().print("false");
	}
	
	@PostMapping("/test")
	public String test() {
		System.out.println("applicant/test  success");
		return "success";
	}
}
