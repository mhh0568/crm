<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">

    <link href="/crm/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="/crm/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css"
          rel="stylesheet"/>

    <script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="/crm/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="/crm/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript"
            src="/crm/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <%--导入分页插件--%>
    <link rel="stylesheet" href="/crm/jquery/bs_pagination/jquery.bs_pagination.min.css">
    <script type="text/javascript" src="/crm/jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="/crm/jquery/bs_pagination/en.js"></script>


    <script type="text/javascript">

        $(function () {


        });

    </script>
</head>
<body>

<!-- 创建市场活动的模态窗口 -->
<div class="modal fade" id="createActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
            </div>
            <div class="modal-body">

                <form id="create-form" class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="owner" class="form-control" id="create-marketActivityOwner"></select>

                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="name" class="form-control" id="create-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="startDate" class="form-control" id="create-startTime">
                        </div>
                        <label for="create-endTime" name="endDate" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-endTime">
                        </div>
                    </div>
                    <div class="form-group">

                        <label for="create-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-cost">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="saveActivity()" class="btn btn-primary" data-dismiss="modal">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form">
                    <input type="hidden" name="id" id="id"/>

                    <div class="form-group">
                        <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" name="owner" id="edit-marketActivityOwner">

                            </select>
                        </div>
                        <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-marketActivityName" value="发传单">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-startTime" value="2020-10-10">
                        </div>
                        <label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-endTime" value="2020-10-20">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-cost" value="5,000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe">市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等</textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="update" class="btn btn-primary" data-dismiss="modal">更新</button>
            </div>
        </div>
    </div>
</div>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>市场活动列表</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form action="/crm/workbench/queryAllActivity" class="form-inline" role="form" method="get"
                  style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">名称</div>
                        <input id="name" name="name" class="form-control" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">所有者</div>
                        <input id="owner" name="owner" class="form-control" type="text">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">开始日期</div>
                        <input id="startDate" name="startDate" class="form-control" type="text" id="startTime"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">结束日期</div>
                        <input id="endDate" name="endDate" class="form-control" type="text" id="endTime">
                    </div>
                </div>

                <button type="button" onclick="queryBtn()" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button type="button" class="btn btn-primary" id="create-btn" data-toggle="modal"
                        data-target="#createActivityModal"><span class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button type="button" class="btn btn-default" id="update-btn"><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" id="delete-btn" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
            </div>

        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input id="father" type="checkbox"/></td>
                    <td>名称</td>
                    <td>所有者</td>
                    <td>开始日期</td>
                    <td>结束日期</td>
                </tr>
                </thead>
                <tbody id="showActivity">

                </tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 0px;">
            <div id="activityPage">

            </div>
        </div>

    </div>

</div>
</body>
<script>

    //删除
    $('#delete-btn').click(function () {
        var ids=[];
        if($('.son:checked').length==0){
            alert("至少选中一条记录")
        }else{
            $('.son:checked').each(function () {
                //alert($(this).val())
                ids.push($(this).val())
            })
            $.ajax({
               url:"/crm/workbench/activity/deleteActivity",
               data:{"idstr":ids.join(",")},
                dataType:'json',
                type:'get',
                success:function (data) {
                    alert(data.mess);
                    pageList(1,2);
                }
            });
        }
    });

    //修改 异步提交请求
    $('#update').click(function () {
        $.ajax({
            url:'/crm/workbench/activity/updateActivity',
            data:{"owner":$('#edit-marketActivityOwner').val(),
                  "name":$('#edit-marketActivityName').val(),
                  "startDate":$('#edit-startTime').val(),
                  "endDate":$('#edit-endTime').val(),
                  "cost":$('#edit-cost').val(),
                  "description":$('#edit-describe').val(),
                  "id":$('#id').val()},
            dataType:'json',
            type:'get',
            success:function (data) {
                //弹窗提示是否修改成功
                alert(data.mess);
                //重新加载页面的市场活动信息
                pageList(1,2);
            }
        })
    })

    //异步查询选中的市场信息 回写到修改页面
    $("#update-btn").click(function () {
        if ($('.son:checked').length == 1) {
            var id = $('.son:checked').val();
            $.ajax({
                url: "/crm/workbench/activity/queryActivityById",
                data: {"id": id},
                dataType: "json",
                type: 'get',
                success: function (dataa) {
                    console.log(dataa)
                    $('#edit-marketActivityName').val(dataa.name);
                    $('#edit-startTime').val(dataa.startDate);
                    $('#edit-endTime').val(dataa.endDate);
                    $('#edit-cost').val(dataa.cost);
                    $('#edit-describe').val(dataa.description);
                    $("#id").val(dataa.id);
                    alert(dataa.owner)

                    //查询所有者 拼接到select中
                    var uid = dataa.owner;
                    //alert($('.son:checked').length)
                    //alert(id)
                    $.ajax({
                        url: "/crm/workbench/queryAllUser",
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            //console.log(data)
                            $("#edit-marketActivityOwner").text("");
                            for (var i = 0; i < data.length; i++) {
                                //拼接修改页面的所有者的下拉列表
                                $("#edit-marketActivityOwner").append("<option class='updateson' value=" + data[i].id + ">" + data[i].name + "</option>")
                            }
                            $('#edit-marketActivityOwner option').each(function () {
                                if ($(this).val() == uid) {
                                    //选中
                                    $(this).prop("selected", true);
                                }
                            })
                            //手动打开模态窗口
                            $("#editActivityModal").modal('show');
                        }
                    })


                }
            })
        } else if ($('.son:checked').length == 0) {
            //一条记录都没有勾中
            alert("请勾选你要修改的选项");
            //$("#editActivityModal").modal('hide');

        } else {
            //勾中多条记录
            alert("至多只能勾选选一条");
            //$("#editActivityModal").modal('hide');
        }

    });


    //保存
    function saveActivity() {
        // alert($("#create-marketActivityOwner").val())
        // alert($("#create-marketActivityName").val())
        // alert($("#create-startTime").val())
        // alert($("#create-endTime").val())
        // alert($("#create-cost").val())
        // alert($("#create-describe").val())

        //每次保存清除之前的数据  异步请求会保留之前的数据
        $.ajax({
            url: "/crm/workbench/activity/saveActivity",
            data: {
                "owner": $("#create-marketActivityOwner").val(),
                "name": $("#create-marketActivityName").val(),
                "startDate": $("#create-startTime").val(),
                "endDate": $("#create-endTime").val(),
                "cost": $("#create-cost").val(),
                "decription": $("#create-describe").val()
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                //console.log(data)
                //弹窗提示是否保存成功
                alert(data.mess)
                //将之前的一些信息清空
                $("#create-marketActivityName").val("");
                $("#create-startTime").val("");
                $("#create-endTime").val("");
                $("#create-cost").val("");
                $("#create-describe").val("");
                pageList(1,2);
            }
        })
        //$("#create-form").submit();
    }

    //异步查询所有用户的姓名 显示在添加页面
    $("#create-btn").click(function () {
        $.ajax({
            url: "/crm/workbench/queryAllUser",
            type: "get",
            dataType: 'json',
            success: function (data) {
                //console.log(data)
                $("#create-marketActivityOwner").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#create-marketActivityOwner").append("<option value=" + data[i].id + ">" + data[i].name + "</option>")
                }
            }
        })

    });


    //加载该页面时，执行该方法
    pageList(1, 2);

    //点击查询按钮
    function queryBtn() {
        pageList(1, 2);
    }

    //递归调用
    function pageList(pageNo, pageSize) {
        $.ajax({
            url: "/crm/workbench/queryAllActivity",
            data: {
                "pageNo": pageNo,
                "pageSize": pageSize,
                "name": $("#name").val(),
                "owner": $("#owner").val(),
                "startDate": $("#startDate").val(),
                "endDate": $("#endDate").val()
            },
            dataType: "json",
            type: "get",
            success: function (data) {
                //alert(data.list.length)
                //每次查询把前面的清空
                $("#showActivity").html("");
                for (var i = 0; i < data.list.length; i++) {
                    //alert(data.list[i].id)
                    //alert(data.list[i].owner)
                    //拼接数据
                    $("#showActivity").append("<tr class=\"active\">\n" +
                        "<td><input class='son'type='checkbox' value=" + data.list[i].id + "  /></td>\n" +
                        "<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='detail.jsp';\">" + data.list[i].name + "</a></td>\n" +
                        "<td>" + data.list[i].uname + "</td>\n" +
                        "<td>" + data.list[i].startDate + "</td>\n" +
                        "<td>" + data.list[i].endDate + "</td>\n" +
                        "</tr>");
                }
                $("#activityPage").bs_pagination({
                    currentPage: data.pageNo, // 页码
                    rowsPerPage: data.pageSize, // 每页显示的记录条数
                    maxRowsPerPage: 20, // 每页最多显示的记录条数
                    totalPages: data.pages, // 总页数
                    totalRows: data.totalCount, // 总记录条数
                    visiblePageLinks: 3, // 显示几个卡片
                    showGoToPage: true,
                    showRowsPerPage: true,
                    showRowsInfo: true,
                    showRowsDefaultInfo: true,
                    //回调函数，用户每次点击分页插件进行翻页的时候就会触发该函数
                    onChangePage: function (event, obj) {
                        //alert(obj.rowsPerPage)
                        //刷新页面，obj.currentPage:当前点击的页码
                        pageList(obj.currentPage, obj.rowsPerPage);
                    }
                });
            }
        });
    }

    //条件查询日历插件
    $("#startDate").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

    $("#endDate").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

    //创建市场活动日历插件
    $("#create-startTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

    $("#create-endTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

    //修改市场活动日期插件
    $("#edit-startTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });
    $("#edit-endTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

</script>
</html>