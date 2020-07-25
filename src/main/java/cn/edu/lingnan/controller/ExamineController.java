package cn.edu.lingnan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.edu.lingnan.pojo.Examine;
import cn.edu.lingnan.service.ApplyService;
import cn.edu.lingnan.service.ExamineService;

@Controller
@RequestMapping("/examine")
public class ExamineController {
	@Autowired
	private ExamineService examineService;
	@Autowired
	private ApplyService applyService;
	
	//	查找所有待审核活动
	@RequestMapping(value="/getAllExamine",method=RequestMethod.GET)
	public String getAllExamine(HttpSession session,HttpServletRequest request) {
		int sumCount=examineService.countNum();
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
        List<Examine> allExamine = examineService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		//List<Examine> allExamine = examineService.getAllExamine();
		session.setAttribute("allExamine", allExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//	插入待审核活动
	@PostMapping("/insertExamine")
	public String insertExamine(Examine examine,HttpServletRequest req, HttpServletResponse resp,HttpSession session) {
		examine.setaContent(req.getParameter("acontent"));
		examine.setaName(req.getParameter("aname"));
		examine.setsNo(req.getParameter("sno"));
		examine.setsName(req.getParameter("sname"));
		examine.setaTime(req.getParameter("atime"));
		examine.setaPlace(req.getParameter("aplace"));
		examine.setPhone(req.getParameter("phone"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String applyTime = df.format(new Date());
		examine.setApplyTime(applyTime);
		examineService.insertExamine(examine);
		List<Examine> allExamine = examineService.getAllExamine();
		session.setAttribute("allExamine", allExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//	按类型查找待审核活动
	@PostMapping("/searchExamine")
	public String searchExamine(Examine examine, HttpServletRequest req,HttpSession session) {
		String search = req.getParameter("search");
		String searchType = req.getParameter("searchType");
		List<Examine> findExamine = examineService.searchExamine(search,searchType);
		session.setAttribute("allExamine", findExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//	按类型查找审核结果
	@PostMapping("/searchResult")
	public String searchResult(Examine examine, HttpServletRequest req,HttpSession session) {
		String search = req.getParameter("search");
		String searchType = req.getParameter("searchType");
		List<Examine> findResult = examineService.searchlResult(search,searchType);
		session.setAttribute("allResult", findResult);
		return "forward:../admin/index/result-list.jsp";
	}
	
	//	通过活动
	@RequestMapping(value="/passExamine",method=RequestMethod.GET)
	public String passExamine(Examine examine,HttpServletRequest request,HttpSession session) {
		String sno = request.getParameter("sno");
		String atime = request.getParameter("applyTime");
		String checkman = (String)session.getAttribute("userName");
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		examine = examineService.findExamine(sno, atime);
		examine.setChecktime(df.format(new Date()));
		examine.setCheckman(checkman);
		examine.setState("通过");
		int result = examineService.insertResult(examine);
		if(result>0) {
			//根据申请时间和学号查找申请的活动并设置审核状态为通过
			result = examineService.intoActivity(examine);
			
			int result2 = applyService.changeState(sno, examine.getApplyTime(), "通过");
			if(result>0&&result2>0)
				examineService.deleteExamine(sno, atime);			
		}
		int sumCount=examineService.countNum();
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
        List<Examine> allExamine = examineService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		session.setAttribute("allExamine", allExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//	不通过活动
	@RequestMapping(value="/failExamine",method=RequestMethod.GET)
	public String failExamine(Examine examine,HttpServletRequest request,HttpSession session) {
		String sno = request.getParameter("sno");
		String atime = request.getParameter("applyTime");
		String checkman = (String)session.getAttribute("userName");
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		examine = examineService.findExamine(sno, atime);
		examine.setChecktime(df.format(new Date()));
		examine.setCheckman(checkman);
		examine.setState("未通过");
		int result = examineService.insertResult(examine);
		int result2 = applyService.changeState(sno, examine.getApplyTime(), "不通过");
		if(result>0&&result2>0) {
			examineService.deleteExamine(sno, atime);			
		}
		int sumCount=examineService.countNum();
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
        List<Examine> allExamine = examineService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		session.setAttribute("allExamine", allExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//批量通过
	@RequestMapping(value="/passAllExamine",method=RequestMethod.GET)
	public String passAllExamine(Examine examine,HttpServletRequest request,HttpSession session) {
		String [] allsno = request.getParameterValues("allsno");
		String [] alltime = request.getParameterValues("alltime");
		String [] sno =  allsno[0].split(",");
		String [] atime = alltime[0].split(",");
		String checkman = (String)session.getAttribute("userName");
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		for(int i=0;i<sno.length;i++) {
			examine = examineService.findExamine(sno[i], atime[i]);			
			examine.setChecktime(df.format(new Date()));
			examine.setCheckman(checkman);
			examine.setState("通过");
			int result = examineService.insertResult(examine);
			System.out.println("result is "+result);
			if(result>0) {
				result = examineService.intoActivity(examine);
				System.out.println("second result is "+result);
				int result2 = applyService.changeState(sno[i], examine.getApplyTime(), "通过");
				System.out.println("result2 is "+result2);
				if(result>0&&result2>0)
					examineService.deleteExamine(sno[i], atime[i]);
				System.out.println("delete result is ");
			}
		}
		int sumCount=examineService.countNum();
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
        List<Examine> allExamine = examineService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		session.setAttribute("allExamine", allExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//批量不通过
	@RequestMapping(value="/failAllExamine",method=RequestMethod.GET)
	public String failAllExamine(Examine examine,HttpServletRequest request,HttpSession session) {
		String [] allsno = request.getParameterValues("allsno");
		String [] alltime = request.getParameterValues("alltime");
		String [] sno =  allsno[0].split(",");
		String [] atime = alltime[0].split(",");
		String checkman = (String)session.getAttribute("userName");
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		for(int i=0;i<sno.length;i++) {
			System.out.println("sno is "+sno[i]+" atime is "+atime[i]);
			examine = examineService.findExamine(sno[i], atime[i]);
			examine.setChecktime(df.format(new Date()));
			examine.setCheckman(checkman);
			examine.setState("未通过");
			int result = examineService.insertResult(examine);
			System.out.println("result is "+result);
			int result2 = applyService.changeState(sno[i], examine.getApplyTime(), "不通过");
			System.out.println("result2 is "+result2);
			if(result>0&&result2>0) {
			    examineService.deleteExamine(sno[i], atime[i]);			
			}
		}
		int sumCount=examineService.countNum();
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
        List<Examine> allExamine = examineService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		session.setAttribute("allExamine", allExamine);
		return "forward:../admin/index/examine-list.jsp";
	}
	
	//	查找所有审核结果
	@RequestMapping(value="getAllResult",method=RequestMethod.GET)
	public String getAllResult(HttpSession session,HttpServletRequest request) {
		int sumCount=examineService.countResultNum();
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
        List<Examine> allResult = examineService.queryResultList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
		//List<Examine> allResult = examineService.getAllResult();
		session.setAttribute("allResult", allResult);
		return "forward:../admin/index/result-list.jsp";
	}
	
	//普通用户查找自己的活动
	@RequestMapping(value="userGetMyActivity",method=RequestMethod.GET)
	public String userGetMyActivity(HttpSession session) {
        String sNo= (String) session.getAttribute("user");
		List<Examine> userAllResult = examineService.userGetMyActivity(sNo,"通过");
        System.out.println("userAllResult:::"+userAllResult);
		session.setAttribute("userAllResult", userAllResult);
		return "forward:../admin/index/myactivity-list.jsp";
	}
}
