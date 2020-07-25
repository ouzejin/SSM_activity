package cn.edu.lingnan.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.lingnan.pojo.Activity;
import cn.edu.lingnan.service.ActivityService;

@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @GetMapping("/listAll")
    public String getAll(HttpServletResponse response, HttpSession session,HttpServletRequest request){
        int sumCount=activityService.countNum();
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
        List<Activity> activities=activityService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("activityList",activities);
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);

        //List<Activity> activities =activityService.getAllActivity();
        return "forward:../admin/index/activity-list.jsp";
    }
    
    @GetMapping("/userListAll")
    public String userGetAll(HttpServletResponse response, HttpSession session,HttpServletRequest request){
    	int sumCount=activityService.countNum();
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
        List<Activity> activities = activityService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("activityList",activities);
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
        //List<Activity> activities =activityService.getAllActivity();
        session.setAttribute("activityList",activities);
        return "forward:../admin/index/user-activity-list.jsp";
    }
    
    @GetMapping("/getByAno")
    public String getByAno(HttpServletRequest request,HttpSession session){
        System.out.println("getByAno:::::::");
        String no=request.getParameter("aNo");
        System.out.println(request.getParameter("aNo"));
        int aNo=Integer.parseInt(no);
        System.out.println("getByAno::::::"+aNo);
        Activity activity=activityService.getByAno(aNo);
        System.out.println(activity);
        session.setAttribute("upActivity",activity);
        return "forward:../admin/index/activity-edit.jsp";
    }

    @PostMapping("/updateActivityByAno")
    public String updateActivityByAno( Activity activity,HttpServletRequest req,HttpSession session){
        System.out.println("updateActivityByAno:::::");
        String No=req.getParameter("aNo");
        int aNo=Integer.parseInt(No);
        activity.setaNo(aNo);
        activity.setaName(req.getParameter("aName"));
        activity.setaMan(req.getParameter("aMan"));
        activity.setaContent(req.getParameter("aContent"));
        activity.setaTime(req.getParameter("aTime"));
        activity.setaPlace(req.getParameter("aPlace"));
        activity.setaState(req.getParameter("aState"));
        activity.setaManPhone(req.getParameter("aManPhone"));
        activityService.updateActivityByAno(activity);
        System.out.println("updateActivityByAno::::::::1111111111111111");
        List<Activity> activities =activityService.getAllActivity();
        session.setAttribute("activityList",activities);
        return "forward:../admin/index/activity-list.jsp";
    }


    @GetMapping("/deleteActivityByAno")
    public String deleteActivityByAno(HttpServletRequest request, HttpSession session){
        String aNo=request.getParameter("aNo");
        int newaNo=Integer.parseInt(aNo);
        activityService.deleteActivityByAno(newaNo);
        int sumCount=activityService.countNum();
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
        List<Activity> activities=activityService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("activityList",activities);
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
        return "forward:../admin/index/activity-list.jsp";
    }

    @PostMapping("/insertActivity")
    public String insertActivity(Activity activity,HttpServletRequest request,HttpSession session){
        activity.setaName(request.getParameter("aName"));
        activity.setaMan(request.getParameter("aMan"));
        activity.setaContent(request.getParameter("aContent"));
        activity.setaTime(request.getParameter("aTime"));
        activity.setaPlace(request.getParameter("aPlace"));
        activity.setaState(request.getParameter("aState"));
        activity.setaManPhone(request.getParameter("aManPhone"));
        activityService.insertActivity(activity);
        List<Activity> activities =activityService.getAllActivity();
        session.setAttribute("activityList",activities);
        return "forward:../admin/index/activity-list.jsp";
    }

    @PostMapping("/searchActivity")
    public String searchActivity(HttpServletRequest request,HttpSession session,String start,String end,String aName){
        String aTime,name;
        if(aName!="") {
        	name=aName;       	
        }else {
        	name=null;
        }
        
        if(start!="" && end!=""){
            aTime=start+"~"+end;
            System.out.println(aTime);
        }else {
            aTime=null;
        }
        List<Activity> activities=activityService.searchActivity(name,aTime);
        session.setAttribute("activityList",activities);
        return "forward:../admin/index/activity-list.jsp";
    }
    
    @PostMapping("/userSearchActivity")
    public String userSearchActivity(HttpServletRequest request,HttpSession session,String start,String end,String aName){
        String aTime,name;
        if(aName!="") {
        	name=aName;       	
        }else {
        	name=null;
        }
        
        if(start!="" && end!=""){
            aTime=start+"~"+end;
            System.out.println(aTime);
        }else {
            aTime=null;
        }
        List<Activity> activities=activityService.searchActivity(name,aTime);
        session.setAttribute("activityList",activities);
        return "forward:../admin/index/user-activity-list.jsp";
    }

    @GetMapping("/deleteAllActivity")
    public String deleteAll(HttpServletRequest request,HttpSession session){
        String [] allaNos=request.getParameterValues("allaNo");
        String []temp=allaNos[0].split(",");
        for (String a:temp){
            System.out.println(a);
            int b=Integer.parseInt(a);
            activityService.deleteActivityByAno(b);
        }
        int sumCount=activityService.countNum();
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
        List<Activity> activities=activityService.queryList(map); //查询出所有用户列表,使用list接收
        session.setAttribute("activityList",activities);
        session.setAttribute("sum",sumCount);
        session.setAttribute("indexNum",indexNum);
        return "forward:../admin/index/activity-list.jsp";
    }

    //普通用户功能
  	//查看当前系统内的所有活动
  	@GetMapping("/allActivity")
  	public String allActivity(HttpSession session) {
  		List<Activity> activities =activityService.getAllActivity();
        session.setAttribute("activityList",activities);
  		return "success";
  	}
  	
}
