package cn.edu.lingnan.controller;

import cn.edu.lingnan.pojo.ActStatus;
import cn.edu.lingnan.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
//@RequestMapping("/status")
public class StatusController {
    @Autowired
    private StatusService statusService;
    @PostMapping("/getStatusJson")
    @ResponseBody
    public List<ActStatus> getStatusJson(String startaTime,String endaTime){
        int aNum=statusService.getActivityCount();
        String aSuper="1";
        int pNum=statusService.getApplicantCount(aSuper);
        int uNum=statusService.getExamineConut();
        Date time=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String aTime=sdf.format(time);
        int result=statusService.getTimeCount();
        statusService.updateNum(aTime,aNum,uNum,pNum);        
        if (result<1){
           statusService.insertActStatus(aTime,aNum,uNum,pNum);
       }
        System.out.println("SOS:::::::::::::::::::::::::::::::::::");
        return statusService.getList(startaTime, endaTime);
    }



}
