<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<!-- 创建线索的模态窗口 -->
<div class="modal fade" id="createClueModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 90%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">创建线索</h4>
            </div>
            <div class="modal-body">
                <form id="save-form" class="form-horizontal" role="form">

                    <div class="form-group">
                        <label for="create-clueOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="owner" class="form-control" id="create-clueOwner">

                            </select>
                        </div>
                        <label for="create-company" class="col-sm-2 control-label">公司<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="company" class="form-control" id="create-company">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-call" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" name="appellation" id="create-call">

                            </select>
                        </div>
                        <label for="create-surname" class="col-sm-2 control-label">姓名<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="fullname" class="form-control" id="create-surname">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="job" class="form-control" id="create-job">
                        </div>
                        <label for="create-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="email" class="form-control" id="create-email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-phone" class="col-sm-2 control-label">公司座机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="phone" class="form-control" id="create-phone">
                        </div>
                        <label for="create-website" class="col-sm-2 control-label">公司网站</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="website" class="form-control" id="create-website">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="mphone" class="form-control" id="create-mphone">
                        </div>
                        <label for="create-status" class="col-sm-2 control-label">线索状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" name="state" id="create-status">

                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-source" class="col-sm-2 control-label">线索来源</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" name="source" id="create-source">

                            </select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">线索描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" name="description" id="create-describe"></textarea>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                    <div style="position: relative;top: 15px;">
                        <div class="form-group">
                            <label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" rows="3" name="contactSummary"
                                          id="create-contactSummary"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" name="nextContactTime" class="form-control"
                                       id="create-nextContactTime">
                            </div>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                    <div style="position: relative;top: 20px;">
                        <div class="form-group">
                            <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" name="address" rows="1" id="create-address"></textarea>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="saveClue-btn" class="btn btn-primary">保存</button>
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
                <h4 class="modal-title">修改线索</h4>
            </div>
            <div class="modal-body">
                <form id="update-form" class="form-horizontal" role="form">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group">
                        <label for="edit-clueOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select name="owner" class="form-control" id="edit-clueOwner">

                            </select>
                        </div>
                        <label for="edit-company" class="col-sm-2 control-label">公司<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="company" class="form-control" id="edit-company" value="动力节点">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-call" class="col-sm-2 control-label">称呼</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" name="appellation" id="edit-call">

                            </select>
                        </div>
                        <label for="edit-surname" class="col-sm-2 control-label">姓名<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="fullname" class="form-control" id="edit-surname" value="李四">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-job" class="col-sm-2 control-label">职位</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="job" class="form-control" id="edit-job" value="CTO">
                        </div>
                        <label for="edit-email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="email" class="form-control" id="edit-email" value="lisi@bjpowernode.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="phone" class="form-control" id="edit-phone" value="010-84846003">
                        </div>
                        <label for="edit-website" class="col-sm-2 control-label">公司网站</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="website" class="form-control" id="edit-website"
                                   value="http://www.bjpowernode.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-mphone" class="col-sm-2 control-label">手机</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" name="mphone" class="form-control" id="edit-mphone" value="12345678901">
                        </div>
                        <label for="edit-status" class="col-sm-2 control-label">线索状态</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" name="state" id="edit-status">
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
                            <select class="form-control" name="source" id="edit-source">
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
                            <textarea class="form-control" name="description" rows="3" id="edit-describe">这是一条线索的描述信息</textarea>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                    <div style="position: relative;top: 15px;">
                        <div class="form-group">
                            <label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" name="contactSummary" rows="3" id="edit-contactSummary">这个线索即将被转换</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" name="nextContactTime" class="form-control" id="edit-nextContactTime" value="2017-05-01">
                            </div>
                        </div>
                    </div>

                    <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                    <div style="position: relative;top: 20px;">
                        <div class="form-group">
                            <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                            <div class="col-sm-10" style="width: 81%;">
                                <textarea class="form-control" name="address" rows="1" id="edit-address">北京大兴区大族企业湾</textarea>
                            </div>
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
            <h3>线索列表</h3>
        </div>
    </div>
</div>

<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">

    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">名称</div>
                        <input id="queryByName" class="form-control" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">公司</div>
                        <input id="queryByCompany" class="form-control" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">公司座机</div>
                        <input id="queryByPhone" class="form-control" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">线索来源</div>
                        <select id="queryBySource" class="form-control">

                        </select>
                    </div>
                </div>

                <br>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">所有者</div>
                        <input id="queryByOwner" class="form-control" type="text">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">手机</div>
                        <input id="queryByMphone" class="form-control" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">线索状态</div>
                        <select id="queryBystate" class="form-control">

                        </select>
                    </div>
                </div>

                <button id="query-btn" type="button" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 40px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button type="button" id="createClue-btn" class="btn btn-primary" data-toggle="modal"
                        data-target="#createClueModal"><span class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button type="button" id="updateClue-btn" class="btn btn-default"><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" id="delete-btn" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
            </div>


        </div>
        <div style="position: relative;top: 50px;">
            <table class="table table-hover">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td><input type="checkbox"/></td>
                    <td>名称</td>
                    <td>公司</td>
                    <td>公司座机</td>
                    <td>手机</td>
                    <td>线索来源</td>
                    <td>所有者</td>
                    <td>线索状态</td>
                </tr>
                </thead>
                <tbody id="showClue">

                </tbody>
            </table>
        </div>

        <div style="height: 50px; position: relative;top: 60px;">

            <div style="height: 50px; position: relative;top: 0px;">
                <div id="cluePage"></div>
            </div>
        </div>

    </div>

</div>
</body>
<script>

    //删除
    $('#delete-btn').click(function () {
        if($('.son:checked').length==0){
            alert("请至少选中一条记录！")
        }else{
            var ids=[];
            $('.son:checked').each(function () {
                ids.push($(this).val());
            });
            $.ajax({
                url:'/crm/workbench/clue/deleteClue',
                data:{"idstr":ids.join(",")},
                dataType:'json',
                type:'post',
                success:function (data) {
                    alert(data.mess);
                    pageList(1,2);
                    querydictionary();
                }
            });
        }
    });

    //修改
    $("#update").click(function () {

        $.ajax({
            url: '/crm/workbench/clue/updateClue',
            data: $('#update-form').serialize(),
            dataType: 'json',
            type: "get",
            success: function (data) {
                alert(data.mess);
                pageList(1, 2);
                querydictionary();
            }
        });
    })

    //异步查询用户 以及字典中的数据 显示在更新线索的模态窗
    $('#updateClue-btn').click(function () {
        //alert($('.son:checked').val())
        if ($('.son:checked').length == 1) {
            $.ajax({
                url: '/crm/workbench/clue/queryClueById',
                data: {'id': $('.son:checked').val()},
                dataType: 'json',
                type: 'get',
                success: function (data) {
                    console.log(data)
                    $('#id').val(data.id);
                    $('#edit-clueOwner').val(data.uname);
                    $('#edit-company').val(data.company);
                    $('#edit-call').val(data.appellation);
                    $('#edit-surname').val(data.fullname);
                    $('#edit-job').val(data.job);
                    $('#edit-email').val(data.email);
                    $('#edit-phone').val(data.phone);
                    $('#edit-website').val(data.website);
                    $('#edit-mphone').val(data.mphone);
                    $('#edit-describe').val(data.description);
                    $('#edit-contactSummary').val(data.contactSummary);
                    $('#edit-nextContactTime').val(data.nextContactTime);
                    $('#edit-address').val(data.address);

                    var id = data.id;
                    var appellation = data.appellation;
                    var clueState = data.state;
                    var source = data.source;

                    $.ajax({
                        url: "/crm/workbench/queryAllUser",
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            //console.log(data)
                            $("#edit-clueOwner").html("");
                            for (var i = 0; i < data.length; i++) {
                                $("#edit-clueOwner").append("<option class='owner' value=" + data[i].id + ">" + data[i].name + "</option>")
                            }
                            $('.owner').each(function () {
                                if ($(this).val() == id) {
                                    $(this).prop("selected", true);
                                }
                            })
                        }
                    })

                    $.ajax({
                        url: "/crm/dictionaryCache",
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            //console.log(data)
                            $("#edit-call").html('');
                            $("#edit-status").html('');
                            $("#edit-source").html('');
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].code == 'appellation') {
                                    //alert(data[i].dictionaryValues.length)
                                    for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                                        //alert(data[i].dictionaryValues[j].value)
                                        $("#edit-call").append("<option class='call' value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                                    }
                                    $('.call').each(function () {
                                        if ($(this).val() == appellation) {
                                            $(this).prop("selected", true);

                                        }
                                    })
                                }
                                if (data[i].code == 'clueState') {
                                    for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                                        $("#edit-status").append("<option class='state' value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                                    }
                                    $('.state').each(function () {
                                        if ($(this).val() == clueState) {
                                            $(this).prop("selected", true);

                                        }
                                    })
                                }
                                if (data[i].code == 'source') {
                                    for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                                        $("#edit-source").append("<option class='source' value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                                    }
                                    $('.source').each(function () {
                                        if ($(this).val() == source) {
                                            $(this).prop("selected", true);

                                        }
                                    })
                                }
                            }
                        }
                    })
                }
            })
            $('#editClueModal').modal('show');
        } else if ($('.son:checked').length == 0) {
            alert("请选中一条记录")
        } else {
            alert("只能选中一条记录")
        }
    });


    //异步查询用户 以及字典中的数据 显示在创建线索的模态窗
    $('#createClue-btn').click(function () {
        $.ajax({
            url: "/crm/workbench/queryAllUser",
            type: "get",
            dataType: 'json',
            success: function (data) {
                //console.log(data)
                $("#create-clueOwner").html("");
                for (var i = 0; i < data.length; i++) {
                    $("#create-clueOwner").append("<option value=" + data[i].id + ">" + data[i].name + "</option>")
                }
            }
        })

        $.ajax({
            url: "/crm/dictionaryCache",
            type: "get",
            dataType: 'json',
            success: function (data) {
                //console.log(data)
                $("#create-call").html('');
                $("#create-status").html('');
                $("#create-source").html('');
                for (var i = 0; i < data.length; i++) {
                    if (data[i].code == 'appellation') {
                        //alert(data[i].dictionaryValues.length)
                        for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                            //alert(data[i].dictionaryValues[j].value)
                            $("#create-call").append("<option value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                        }
                    }
                    if (data[i].code == 'clueState') {
                        for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                            $("#create-status").append("<option value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                        }
                    }
                    if (data[i].code == 'source') {
                        for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                            $("#create-source").append("<option value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                        }
                    }
                }

            }
        })

    });

    //保存线索信息
    $('#saveClue-btn').click(function () {
        if ($('#create-company').val() == '' || $('#create-surname').val() == '') {
            alert("请填写(加*)必填信息")
        } else {
            var saveform = $('#save-form').serialize();
            $.ajax({
                url: '/crm/workbench/clue/saveClue',
                data: saveform,
                dataType: 'json',
                type: 'get',
                success: function (data) {
                    alert(data.mess);
                    $('#save-form').get(0).reset();
                    //$('#save-form')[0].reset();
                }
            });
            $('#createClueModal').modal('hide');
        }
    });

    $('#query-btn').click(function () {
        pageList(1, 2);
    });

    pageList(1, 2);
    querydictionary();

    //查询数据 以及分页
    function pageList(page, pageSize) {
        $.ajax({
            url: '/crm/workbench/clue/queryClue',
            data: {
                'page': page,
                'pageSize': pageSize,
                'fullname': $('#queryByName').val(),
                'conpany': $('#queryByCompany').val(),
                'phone': $('#queryByPhone').val(),
                'mphone': $('#queryByMphone').val(),
                'source': $('#queryBySource').val(),
                'owner': $('#queryByOwner').val(),
                'state': $('#queryBystate').val(),

            },
            dataType: 'json',
            type: 'get',
            success: function (data) {
                $('#showClue').html('');
                for (var i = 0; i < data.list.length; i++) {
                    $('#showClue').append("<tr>\n" +
                        "\t\t\t\t\t\t\t<td><input class='son' value=" + data.list[i].id + " type=\"checkbox\" /></td>\n" +
                        "\t\t\t\t\t\t\t<td><a style=\"text-decoration: none; cursor: pointer;\"  href=/crm/workbench/cluedetail/queryClueDetail?id="+data.list[i].id+">" + data.list[i].fullname + "</a></td>\n" +
                        "\t\t\t\t\t\t\t<td>" + data.list[i].company + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + data.list[i].phone + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + data.list[i].mphone + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + data.list[i].source + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + data.list[i].uname + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + data.list[i].state + "</td>\n" +
                        "\t\t\t\t\t\t</tr>\n" +
                        "                        ");
                }
                $("#cluePage").bs_pagination({
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


    //查询条件 ：线索来源 线索状态
    function querydictionary() {
        $.ajax({
            url: "/crm/dictionaryCache",
            type: "get",
            dataType: 'json',
            success: function (data) {
                //console.log(data)
                $("#queryBystate").html('');
                $("#queryBySource").html('');
                for (var i = 0; i < data.length; i++) {
                    //线索状态
                    if (data[i].code == 'clueState') {
                        $("#queryBystate").append("<option></option>");
                        for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                            $("#queryBystate").append("<option value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                        }
                    }
                    //线索来源
                    if (data[i].code == 'source') {
                        $("#queryBySource").append("<option></option>");
                        for (var j = 0; j < data[i].dictionaryValues.length; j++) {
                            $("#queryBySource").append("<option value=" + data[i].dictionaryValues[j].value + ">" + data[i].dictionaryValues[j].text + "</option>")
                        }
                    }
                }
            }
        })
    }


    //创建线索日历插件
    $("#create-nextContactTime").datetimepicker({
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