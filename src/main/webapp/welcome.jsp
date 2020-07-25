<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" isErrorPage="true"%>
<% pageContext.setAttribute("ctx", request.getContextPath()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-L-admin1.0</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="${ctx}/admin/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="${ctx}/admin/css/font.css">
        <link rel="stylesheet" href="${ctx}/admin/css/xadmin.css">

        <!-- 引入 echarts.js 重要的一环-->
        <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
        <%-- <script language="JavaScript" src="js/echarts.min.js"></script>--%>
        <!--记得引入jQuery这个库函数-->
        <script language="JavaScript" src="js/jquery-3.2.1.min.js"></script>

    </head>
    <body>
    <div class="x-body layui-anim layui-anim-up">
        <blockquote class="layui-elem-quote">欢迎您：
            <span class="x-red"><%=session.getAttribute("userName") %></span>！
            <%
                Date d = new Date();
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String now = df.format(d);
            %>
            当前时间：<%=now %>
        </blockquote>
    </div>

    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->

    <script>

        var a = [];//存放时间
        var b= [];//存放申请人员
        var c= [];//存放活动数
        var d= [];//存放未审核
        var e=[];
        function generateChart(array,array,array,array,array) {
            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));
            // 显示标题，图例和空的坐标轴
            function fetchData(cb) {
                // 通过 setTimeout 模拟异步加载y
                setTimeout(function () {
                    cb({
                        categories: [],
                        data:[],
                    });
                }, 3000);
            }

            // 初始 option
            option = {
                title: {
                    text: '异步数据加载'
                },
                tooltip: {},
                legend: {
                    data:['活动数','申请人员','未审核']
                },
                xAxis: {
                    data: []
                },
                yAxis: {},

            };

            myChart.showLoading();
            myChart.clear();
            fetchData(function (data) {
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: a,
                    },
                    series: [
                        {
                            name:'活动数',
                            type: 'line',
                            color: ['#759aa0','#e69d87','#8dc1a9','#ea7e53','#eedd78','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'],
                            data: b
                        },
                        {
                            name:'申请人员',
                            type: 'line',
                            color: ['#e69d87','#8dc1a9','#ea7e53','#eedd78','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'],
                            data: c
                        },
                        {
                            name:'未审核',
                            type: 'line',
                            color: ['#8dc1a9','#ea7e53','#eedd78','#73a373','#73b9bc','#7289ab', '#91ca8c','#f49f42'],
                            data: d
                        },

                    ]
                });
            });
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

        }

        //jquery代码都必须写在ready方法中
        function getData() {

            var startaTime=$('#startaTime').val();
            var endaTime=$('#endaTime').val();
            var url="getStatusJson";
            $.post(url,{startaTime:startaTime,endaTime:endaTime},function (data,status) {
                console.log(data);
                console.log("数据: " + data + "\n状态: " + status);
                $.each(data,function (index,item) {
                    console.log(index);
                    console.log(item);
                    a.push(item.aTime);
                    b.push(item.aNum);
                    c.push(item.pNum);
                    d.push(item.uNum);
                    e.push(item.aName);
                    console.log(a);
                    console.log(b);
                    console.log(c);
                    console.log(d);
                    console.log(e);

                })

            });
            generateChart(a,b,c,d,e);
            a.splice(0,a.length);
            b.splice(0,b.length);
            c.splice(0,c.length);
            d.splice(0,d.length);
        }

        setTimeout(function() {
            // IE
            if(document.all) {
                document.getElementById("parentIframe").click();
            }
            // 其它浏览器
            else {
                var e = document.createEvent("MouseEvents");
                e.initEvent("click", true, true);
                document.getElementById("parentIframe").dispatchEvent(e);
            }
        }, 500);



    </script>

    <div align="center">
        <label for="startaTime">开始日期：</label><input id="startaTime" type="date" value="2020-01-01"/>
        <label for="endaTime">结束日期：</label><input id="endaTime" type="date" value="2020-01-12"/>
        <input onclick="getData()" value="查询" type="submit" id="parentIframe">

    </div>
    <div id="main" style="width: 600px;height:400px;user-select:none;position:relative;margin-top:150px;margin-left:350px;"></div>

    </body>
</html>