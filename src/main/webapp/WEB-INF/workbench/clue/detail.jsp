<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">

    <link href="/crm/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="/crm/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        //默认情况下取消和保存按钮是隐藏的
        var cancelAndSaveBtnDefault = true;

        $(function () {
            $("#remark").focus(function () {
                if (cancelAndSaveBtnDefault) {
                    //设置remarkDiv的高度为130px
                    $("#remarkDiv").css("height", "130px");
                    //显示
                    $("#cancelAndSaveBtn").show("2000");
                    cancelAndSaveBtnDefault = false;
                }
            });

            $("#cancelBtn").click(function () {
                //显示
                $("#cancelAndSaveBtn").hide();
                //设置remarkDiv的高度为130px
                $("#remarkDiv").css("height", "90px");
                cancelAndSaveBtnDefault = true;
            });

            //参数1:事件对象,参数2:被代理的元素的选择器,参数3:事件触发的函数
            $("#father").on("mouseover", '.remarkDiv', function () {
                $(this).children("div").children("div").show();
            })


            $("#father").on("mouseout", ".remarkDiv", function () {
                $(this).children("div").children("div").hide();
            });

            $("#father").on("mouseover", ".myHref", function () {
                $(this).children("span").css("color", "red");
            });

            $("#father").on("mouseout", ".myHref", function () {
                $(this).children("span").css("color", "#E6E6E6");
            });
        });

    </script>

</head>
<body>

<!-- 关联市场活动的模态窗口 -->
<div class="modal fade" id="bundModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">关联市场活动</h4>
            </div>
            <div class="modal-body">
                <div class="btn-group" style="position: relative; top: 18%; left: 8px;">
                    <form id="form" class="form-inline" role="form">
                        <div class="form-group has-feedback">
                            <input type="text" id="queryActivity" class="form-control" style="width: 300px;"
                                   placeholder="请输入市场活动名称，支持模糊查询">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                        </div>
                    </form>
                </div>
                <table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
                    <thead>
                    <tr style="color: #B3B3B3;">
                        <td><input type="checkbox"/></td>
                        <td>名称</td>
                        <td>开始日期</td>
                        <td>结束日期</td>
                        <td>所有者</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody id="activityInfo">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" onclick="bindClueActivity()" class="btn btn-primary" >关联</button>
            </div>
        </div>
    </div>
</div>
<%--修改线索备注--%>
<div class="modal fade" id="editRemarkModal" role="dialog">
    <%-- 备注的id --%>
    <input type="hidden" id="remarkId">
    <div class="modal-dialog" role="document" style="width: 40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改备注</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="noteContent"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateRemarkBtn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改线索的模态窗口 -->
<div class="modal fade" id="editClueModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改线索</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="edit-clueOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-clueOwner">
                                <option>zhangsan</option>
                                <option>lisi</option>
                                <option>wangwu</option>
                            </select>
                        </div>
                        <label for="edit-company" class="col-sm-2 control-label">公司<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-company" value="动力节点">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-call" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-call">
                                <option></option>
                                <option selected>先生</option>
                                <option>夫人</option>
                                <option>女士</option>
                                <option>博士</option>
                                <option>教授</option>
                            </select>
                        </div>
                        <label for="edit-surname" class="col-sm-2 control-label">姓名<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-surname" value="李四">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-job" value="CTO">
                        </div>
                        <label for="edit-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-email" value="lisi@bjpowernode.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-phone" value="010-84846003">
                        </div>
                        <label for="edit-website" class="col-sm-2 control-label">公司网站</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-website"
                                   value="http://www.bjpowernode.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-mphone" value="12345678901">
                        </div>
                        <label for="edit-status" class="col-sm-2 control-label">线索状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-status">
                                <option></option>
                                <option>试图联系</option>
                                <option>将来联系</option>
                                <option selected>已联系</option>
                                <option>虚假线索</option>
                                <option>丢失线索</option>
                                <option>未联系</option>
                                <option>需要条件</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-source" class="col-sm-2 control-label">线索来源</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-source">
                                <option></option>
                                <option selected>广告</option>
                                <option>推销电话</option>
                                <option>员工介绍</option>
                                <option>外部介绍</option>
                                <option>在线商场</option>
                                <option>合作伙伴</option>
                                <option>公开媒介</option>
                                <option>销售邮件</option>
                                <option>合作伙伴研讨会</option>
                                <option>内部研讨会</option>
                                <option>交易会</option>
                                <option>web下载</option>
                                <option>web调研</option>
                                <option>聊天</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe">这是一条线索的描述信息</textarea>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                    <div style="position: relative;top: 15px;">
                        <div class="form-group">
                            <label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" id="edit-contactSummary">这个线索即将被转换</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-nextContactTime" value="2017-05-01">
                            </div>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                    <div style="position: relative;top: 20px;">
                        <div class="form-group">
                            <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="1" id="edit-address">北京大兴区大族企业湾</textarea>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 返回按钮 -->
<div style="position: relative; top: 35px; left: 10px;">
    <a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left"
                                                                         style="font-size: 20px; color: #DDDDDD"></span></a>
</div>

<!-- 大标题 -->
<div style="position: relative; left: 40px; top: -30px;">
    <div class="page-header">
        <h3>${clue.fullname}${clue.appellation}
            <small>${clue.company}</small>
        </h3>
    </div>
    <div style="position: relative; height: 50px; width: 500px;  top: -72px; left: 700px;">
        <button type="button" class="btn btn-default" onclick='toView()'><span
                class="glyphicon glyphicon-retweet"></span> 转换
        </button>
        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#editClueModal"><span
                class="glyphicon glyphicon-edit"></span> 编辑
        </button>
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
    </div>
</div>

<!-- 详细信息 -->
<div style="position: relative; top: -70px;">
    <div style="position: relative; left: 40px; height: 30px;">
        <div style="width: 300px; color: gray;">名称</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;">
            <b>${clue.fullname}${clue.appellation}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">所有者</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${clue.user.name}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 10px;">
        <div style="width: 300px; color: gray;">公司</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${clue.company}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">职位</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${clue.job}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 20px;">
        <div style="width: 300px; color: gray;">邮箱</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${clue.email}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">公司座机</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${clue.phone}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 30px;">
        <div style="width: 300px; color: gray;">公司网站</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${clue.website}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">手机</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${clue.mphone}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 40px;">
        <div style="width: 300px; color: gray;">线索状态</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${clue.state}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">线索来源</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${clue.source}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 50px;">
        <div style="width: 300px; color: gray;">创建者</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${clue.createBy}&nbsp;&nbsp;</b>
            <small style="font-size: 10px; color: gray;">${clue.createTime}</small>
        </div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 60px;">
        <div style="width: 300px; color: gray;">修改者</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${clue.editBy}&nbsp;&nbsp;</b>
            <small style="font-size: 10px; color: gray;">${clue.editTime}</small>
        </div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 70px;">
        <div style="width: 300px; color: gray;">描述</div>
        <div style="width: 630px;position: relative; left: 200px; top: -20px;">
            <b>
                ${clue.description}
            </b>
        </div>
        <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 80px;">
        <div style="width: 300px; color: gray;">联系纪要</div>
        <div style="width: 630px;position: relative; left: 200px; top: -20px;">
            <b>
                ${clue.contactSummary}
            </b>
        </div>
        <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 90px;">
        <div style="width: 300px; color: gray;">下次联系时间</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${clue.nextContactTime}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px; "></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 100px;">
        <div style="width: 300px; color: gray;">详细地址</div>
        <div style="width: 630px;position: relative; left: 200px; top: -20px;">
            <b>
                ${clue.address}
            </b>
        </div>
        <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
</div>

<!-- 备注 -->
<div id="father" style="position: relative; top: 40px; left: 40px;">
    <div class="page-header">
        <h4>备注</h4>
    </div>

    <c:forEach items="${clue.clueRemarks}" var="clueRemark">
        <!-- 备注1 -->
        <div class="remarkDiv" style="height: 60px;">
            <img title="zhangsan" src="/crm/image/user-thumbnail.png" style="width: 30px; height:30px;">
            <div style="position: relative; top: -40px; left: 40px;">
                <h5 id="noteContent${clueRemark.id}">${clueRemark.noteContent}</h5>
                <font color="gray">线索</font> <font color="gray">-</font> <b>${clue.fullname}${clue.appellation}</b>
                <small style="color: gray;"> ${clueRemark.createTime} 由${clueRemark.createBy}</small>
                <div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
                    <a class="myHref"
                       onclick="updateClueRemark($('#noteContent${clueRemark.id}').html(),'${clueRemark.id}')"
                       href="javascript:void(0);"><span class="glyphicon glyphicon-edit"
                                                        style="font-size: 20px; color: #E6E6E6;"></span></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="myHref" onclick="deleteClueRemark('${clueRemark.id}')" href="javascript:void(0);"><span
                            class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
                </div>
            </div>
        </div>
    </c:forEach>


    <div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
        <form role="form" style="position: relative;top: 10px; left: 10px;">
            <textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"
                      placeholder="添加备注..."></textarea>
            <p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
                <button id="cancelBtn" type="button" class="btn btn-default">取消</button>
                <button type="button" id="saveClueRemark" class="btn btn-primary">保存</button>
            </p>
        </form>
    </div>
</div>

<!-- 市场活动 -->
<div>
    <div style="position: relative; top: 60px; left: 40px;">
        <div class="page-header">
            <h4>市场活动</h4>
        </div>
        <div style="position: relative;top: 0px;">
            <table class="table table-hover" style="width: 900px;">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td>名称</td>
                    <td>开始日期</td>
                    <td>结束日期</td>
                    <td>所有者</td>
                    <td></td>
                </tr>
                </thead>
                <tbody id="showAct">
                <c:forEach items="${clue.activities}" var="activity">
                    <tr id="tr${activity.id}">
                        <td>${activity.name}</td>
                        <td>${activity.startDate}</td>
                        <td>${activity.endDate}</td>
                        <td>${activity.user.name}</td>
                        <td><a href="javascript:void(0);" onclick="unbind('${activity.id}')"
                               style="text-decoration: none;"><span class="glyphicon glyphicon-remove"></span>解除关联</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <div>
            <a href="javascript:void(0);" id="bindActivity" data-toggle="modal" data-target="#bundModal"
               style="text-decoration: none;"><span class="glyphicon glyphicon-plus"></span>关联市场活动</a>
        </div>
    </div>
</div>


<div style="height: 200px;"></div>
</body>
<script>

    function toView() {
        location.href="/crm/workbench/clue/toView?id=${clue.id}&fullname=${clue.fullname}&appellation=${clue.appellation}&owner=${clue.user.name}&company=${clue.company}"
    }

    //绑定线索和市场活动关联
    function bindClueActivity(){
        if($('.son:checked').length==0){
            alert("至少选中一条记录");
        }else{
            var activityIds=[];
            $('.son:checked').each(function () {
                activityIds.push($(this).val());
            });
            $.ajax({
                url: '/crm/workbench/clue/bindClueActivity',
                data: {
                    "clueId": '${clue.id}',
                    "activityIds":activityIds.join()
                },
                dataType: 'json',
                type: 'get',
                success: function (data) {
                    if(data.success){
                        alert(data.mess);
                        $.ajax({
                            url: '/crm/workbench/clue/queryBindActivity',
                            data: {
                                "clueId": '${clue.id}'
                            },
                            dataType: 'json',
                            type: 'get',
                            success: function (data) {
                                $('#showAct').empty();
                                for (var i = 0; i <data.length ; i++) {
                                    $('#showAct').append("<tr>\n" +
                                        "                        <td><input class='son' value=" + data[i].id + " type=\"checkbox\"/></td>\n" +
                                        "                        <td>" + data[i].name + "</td>\n" +
                                        "                        <td>" + data[i].startDate + "</td>\n" +
                                        "                        <td>" + data[i].endDate + "</td>\n" +
                                        "                        <td>" + data[i].user.name + "</td>\n" +
                                        "                    </tr>");
                                }
                            }
                        })
                    }
                    $('#bundModal').modal("hide");
                    $("#queryActivity").val('')
                }
            })
        }

    }

    //打开模态窗显示所有市场信息 并支持按市场活动名称进行模糊查询
    $('#bindActivity').click(function () {
        $('#activityInfo').empty();
        //打开模态窗显示所有市场信息
        $.ajax({
            url: '/crm/workbench/clue/queryActivity',
            data: {
                "clueId": '${clue.id}',
                "name": $("#queryActivity").val()
            },
            dataType: 'json',
            type: 'get',
            success: function (data) {
                console.log(data)
                for (var i = 0; i < data.length; i++) {
                    $('#activityInfo').append("<tr>\n" +
                        "                        <td><input class='son' value=" + data[i].id + " type=\"checkbox\"/></td>\n" +
                        "                        <td>" + data[i].name + "</td>\n" +
                        "                        <td>" + data[i].startDate + "</td>\n" +
                        "                        <td>" + data[i].endDate + "</td>\n" +
                        "                        <td>" + data[i].user.name + "</td>\n" +
                        "                    </tr>");
                }
                $('#bundModal').modal("show");
                //回车查询市场活动信息
                $('#queryActivity').keypress(function (event) {
                    if (event.keyCode == 13) {
                        $('#activityInfo').empty();
                        $.ajax({
                            url: '/crm/workbench/clue/queryActivity',
                            data: {
                                "clueId": '${clue.id}',
                                "name": $("#queryActivity").val()
                            },
                            dataType: 'json',
                            type: 'get',
                            success: function (data) {
                                for (var i = 0; i < data.length; i++) {
                                    $('#activityInfo').append("<tr>\n" +
                                        "                        <td><input value=" + data[i].id + " type=\"checkbox\"/></td>\n" +
                                        "                        <td>" + data[i].name + "</td>\n" +
                                        "                        <td>" + data[i].startDate + "</td>\n" +
                                        "                        <td>" + data[i].endDate + "</td>\n" +
                                        "                        <td>" + data[i].user.name + "</td>\n" +
                                        "                    </tr>");
                                }
                            }
                        });
                    }
                    return false;
                });

            }
        });
    });


    //删除市场活动关联
    function unbind(id) {
        $.ajax({
            url: '/crm/workbench/clue/unbindClueActivityRelation',
            data: {
                "activityId": id,
                "clueId": '${clue.id}'
            },
            dataType: 'json',
            type: 'get',
            success: function (data) {
                if (data.success) {
                    $("#tr" + id).remove();
                }
                alert(data.mess);

            }
        });
    }

    //删除线索备注
    function deleteClueRemark(id) {
        $.ajax({
            url: '/crm/workbench/clue/deleteClueRemark',
            data: {
                "id": id
            },
            dataType: 'json',
            type: 'get',
            success: function (data) {
                if (data.success) {
                    $("#noteContent" + id).parent().parent().remove();
                }
                alert(data.mess);

            }
        });
    }

    //显示修改模态窗
    function updateClueRemark(noteContent, id) {
        alert(id)
        //给模态窗文本域赋值
        $('#noteContent').val(noteContent);
        $('#remarkId').val(id);
        //显示模态窗
        $('#editRemarkModal').modal("show");

    }

    //修改线索备注
    $('#updateRemarkBtn').click(function () {
        $.ajax({
            url: '/crm/workbench/clue/updateClueRemark',
            data: {
                "id": $('#remarkId').val(),
                "noteContent": $('#noteContent').val()
            },
            dataType: 'json',
            type: 'get',
            success: function (data) {
                //console.log($("#noteContent"+$('#remarkId').val()))
                if (data.success) {
                    $("#noteContent" + $('#remarkId').val()).html($('#noteContent').val());
                    $('#editRemarkModal').modal("hide");
                }
                alert(data.mess);
            }
        });
    });

    //添加备注
    $('#saveClueRemark').click(function () {
        var now = new Date().toLocaleDateString().replace(/\//g, '-');
        $.ajax({
            url: "/crm/workbench/clue/saveClueRemark",
            data: {
                "clueId": '${clue.id}',/*不加引号会报错: Uncaught SyntaxError: Invalid or unexpected token*/
                "noteContent": $('#remark').val()
            },
            dataType: 'json',
            type: 'get',
            success: function (data) {
                if (data.success) {
                    $('#remarkDiv').before("<div class=\"remarkDiv\" style=\"height: 60px;\">\n" +
                        "\t\t\t\t<img title=\"zhangsan\" src=\"/crm/image/user-thumbnail.png\" style=\"width: 30px; height:30px;\">\n" +
                        "\t\t\t\t<div style=\"position: relative; top: -40px; left: 40px;\" >\n" +
                        "\t\t\t\t\t<h5>" + $('#remark').val() + "</h5>\n" +
                        "\t\t\t\t\t<font color=\"gray\">线索</font> <font color=\"gray\">-</font> <b>${clue.fullname}${clue.appellation}</b> <small style=\"color: gray;\"> " + now + " 由${sessionScope.user.name}</small>\n" +
                        "\t\t\t\t\t<div style=\"position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;\">\n" +
                        "\t\t\t\t\t\t<a class=\"myHref\" onclick=\"updateClueRemark('${clueRemark.noteContent}','${clueRemark.id}')\"href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-edit\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
                        "\t\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t\t\t<a class=\"myHref\" href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-remove\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
                        "\t\t\t\t\t</div>\n" +
                        "\t\t\t\t</div>\n" +
                        "\t\t\t</div>");
                    //添加成功后 清空文本域中的内容
                    $('#remark').val('');
                }
                //弹窗提示操作结果
                alert(data.mess);
            }
        });
    });


</script>
</html>