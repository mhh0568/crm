<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">

<link href="/crm/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/crm/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="/crm/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

	//默认情况下取消和保存按钮是隐藏的
	var cancelAndSaveBtnDefault = true;
	
	$(function(){
		$("#remark").focus(function(){
			if(cancelAndSaveBtnDefault){
				//设置remarkDiv的高度为130px
				$("#remarkDiv").css("height","130px");
				//显示
				$("#cancelAndSaveBtn").show("2000");
				cancelAndSaveBtnDefault = false;
			}
		});
		
		$("#cancelBtn").click(function(){
			//显示
			$("#cancelAndSaveBtn").hide();
			//设置remarkDiv的高度为130px
			$("#remarkDiv").css("height","90px");
			cancelAndSaveBtnDefault = true;
		});
		
		$(".remarkDiv").mouseover(function(){
			$(this).children("div").children("div").show();
		});
		
		$(".remarkDiv").mouseout(function(){
			$(this).children("div").children("div").hide();
		});
		
		$(".myHref").mouseover(function(){
			$(this).children("span").css("color","red");
		});
		
		$(".myHref").mouseout(function(){
			$(this).children("span").css("color","#E6E6E6");
		});
	});
	
</script>

</head>
<body>
	<%--${activity}--%>
	<!-- 修改市场活动备注的模态窗口 -->
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

    <!-- 修改市场活动的模态窗口 -->
    <div class="modal fade" id="editActivityModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 85%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改市场活动</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal" role="form">
						<%--隐藏域--%>
						<input type="hidden" name="id" id="id"/>
                        <div class="form-group">
                            <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <select class="form-control" id="edit-marketActivityOwner">
                                </select>
                            </div>
                            <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
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

	<!-- 返回按钮 -->
	<div style="position: relative; top: 35px; left: 10px;">
		<a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left" style="font-size: 20px; color: #DDDDDD"></span></a>
	</div>
	
	<!-- 大标题 -->
	<div style="position: relative; left: 40px; top: -30px;">
		<div class="page-header">
			<h3>市场活动-${activity.name} <small>${activity.startDate} ~ ${activity.endDate}</small></h3>
		</div>
		<div style="position: relative; height: 50px; width: 250px;  top: -72px; left: 700px;">
			<button type="button" id="updatebtn" class="btn btn-default" data-toggle="modal" data-target="#editActivityModal"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
			<button id="deletebtn" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
	</div>
	
	<!-- 详细信息 -->
	<div style="position: relative; top: -70px;">
		<div style="position: relative; left: 40px; height: 30px;">
			<div style="width: 300px; color: gray;">所有者</div>
			<div id="owner" style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.user.name}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">名称</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${activity.name}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>

		<div style="position: relative; left: 40px; height: 30px; top: 10px;">
			<div style="width: 300px; color: gray;">开始日期</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.startDate}</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">结束日期</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${activity.endDate}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 20px;">
			<div style="width: 300px; color: gray;">成本</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.cost}</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 30px;">
			<div style="width: 300px; color: gray;">创建者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${activity.createBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">${activity.createTime}</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 40px;">
			<div style="width: 300px; color: gray;">修改者</div>
			<div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${activity.editBy}&nbsp;&nbsp;</b><small style="font-size: 10px; color: gray;">${activity.editTime}</small></div>
			<div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px; top: 50px;">
			<div style="width: 300px; color: gray;">描述</div>
			<div style="width: 630px;position: relative; left: 200px; top: -20px;">
				<b>
					${activity.description}
				</b>
			</div>
			<div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
	</div>
	
	<!-- 备注 -->
	<div style="position: relative; top: 30px; left: 40px;">
		<div class="page-header">
			<h4>备注</h4>
		</div>
		<div id="divadd">
			<c:forEach items="${activity.remarks}" var="activityremark">
				<!-- 备注1 -->
				<div class="remarkDiv" style="height: 60px;">
					<img title="picture" src="/crm/image/user-thumbnail.png" style="width: 30px; height:30px;">
					<div style="position: relative; top: -40px; left: 40px;" >
						<h5 id="updateNoteContent${activityremark.id}">${activityremark.noteContent}</h5>
						<font color="gray">市场活动</font> <font color="gray">-</font> <b>${activity.name}</b>
							<%--<c:choose>
                                <c:when test="${activityremark.editFlag}==0">
                                    <small style="color: gray;"> ${activityremark.createTime} 由${activityremark.createTime}创建</small>
                                </c:when>
                                <c:otherwise>
                                    <small style="color: gray;"> ${activityremark.editTime} 由${activityremark.editTime}修改</small>
                                </c:otherwise>
                            </c:choose>--%>
							<%--
                            jstl c:if 不能判断成功的问题
                                这是因为test里不能直接用 ${value}=='字符串' 的方式来进行判断比较，
                                所以只能这样写 ${value == '字符串'} ，这样就能判断了
                                --%>
						<c:if test="${activityremark.editFlag==0}" >
							<small style="color: gray;"> ${activityremark.createTime} 由${activityremark.createBy}创建</small>
						</c:if>
						<c:if test="${activityremark.editFlag==1}" >
							<small style="color: gray;"> ${activityremark.editTime} 由${activityremark.editBy}修改</small>
						</c:if>
						<div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
							<a class="myHref" onclick="updatebtn('${activityremark.id}','${activityremark.noteContent}')" href="javascript:void(0);"><span class="glyphicon glyphicon-edit" style="font-size: 20px; color: #E6E6E6;"></span></a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="myHref" onclick="deletebtn('${activityremark.id}')" href="javascript:void(0);"><span class="glyphicon glyphicon-remove" style="font-size: 20px; color: #E6E6E6;"></span></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		
		<div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
			<form role="form" style="position: relative;top: 10px; left: 10px;">
				<textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"  placeholder="添加备注..."></textarea>
				<p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
					<button id="cancelBtn" type="button" class="btn btn-default">取消</button>
					<button type="button" onclick="addNoteContent()" class="btn btn-primary">保存</button>
				</p>
			</form>
		</div>
	</div>
	<div style="height: 200px;"></div>
</body>
<script>
	//点击修改备注按钮
	function updatebtn(Id,noteContent) {
		$('#noteContent').val(noteContent);
		$('#remarkId').val(Id);
		$('#editRemarkModal').modal('show');

	}

	//点击更新备注
	$('#updateRemarkBtn').click(function () {
		$.ajax({
			url:"/crm/workbench/activity/updateActivityRemark",
			data:{"id":$('#remarkId').val(),
				"noteContent":$('#noteContent').val()
			},
			dataType:'json',
			type:'post',
			success:function (data) {

				//alert($('#noteContent').val())
				//console.log(data)

					$('#editRemarkModal').modal('hide');
				alert(data.mess)
				location.href="/crm/workbench/activity/queryActivityDetail?id=${activity.id}";
			}
		});
	});
	//点击删除备注按钮
	function deletebtn(Id,noteContent) {
		$('#remarkId').val(Id);
		$.ajax({
			url:"/crm/workbench/activity/deleteActivityRemark",
			data:{"id":$('#remarkId').val()
			},
			dataType:'json',
			type:'post',
			success:function (data) {
					$('#editRemarkModal').modal('hide');
				alert(data.mess)
				location.href="/crm/workbench/activity/queryActivityDetail?id=${activity.id}";
			}
		});

	}

	//添加备注
	function addNoteContent(){
		var time=new Date().toLocaleDateString().replace(/\//g, '-');
		//alert(time)
		$.ajax({
			url:"/crm/workbench/activity/addNoteContent",
			data:{"activityId":'${activity.id}',
			"noteContent":$("#remark").val()
			},
			dataType:'json',
			type:'post',
			success:function (data) {
				if(data.success){
					$("#divadd").append("<div class=\"remarkDiv\" style=\"height: 60px;\">\n" +
							"\t\t\t\t\t<img title=\"picture\" src=\"/crm/image/user-thumbnail.png\" style=\"width: 30px; height:30px;\">\n" +
							"\t\t\t\t\t<div style=\"position: relative; top: -40px; left: 40px;\" >\n" +
							"\t\t\t\t\t\t<h5 id=\"updateNoteContent${addactivityremark.id}\">"+$("#remark").val()+"</h5>\n" +
							"\t\t\t\t\t\t<font color=\"gray\">市场活动</font> <font color=\"gray\">-</font> <b>${activity.name}</b>\n" +
							"\t\t\t\t\t\t\t<small style=\"color: gray;\"> "+time+" 由${user.name}创建</small>\n" +
							"\t\t\t\t\t\t<div style=\"position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;\">\n" +
							"\t\t\t\t\t\t\t<a class=\"myHref\" onclick=\"updatebtn('${addactivityremark.id}','"+$("#remark").val()+"')\" href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-edit\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
							"\t\t\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;\n" +
							"\t\t\t\t\t\t\t<a class=\"myHref\" onclick=\"deletebtn('${addactivityremark.id}')\" href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-remove\" style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
							"\t\t\t\t\t\t</div>\n" +
							"\t\t\t\t\t</div>\n" +
							"\t\t\t\t</div>")
					//添加成功 清空输入框的内容
					$("#remark").val("");
				}
				//弹窗提示是否成功
				alert(data.mess);

			}
		})
	}

	//删除市场活动及其备注
	$('#deletebtn').click(function () {
		var isDel = confirm("是否删除该市场活动？");
		if(isDel){
			location.href="/crm/workbench/activity/deleteActivityInfo?id=${activity.id}";
		}
	});

	//修改 异步提交请求
	$('#update').click(function () {
		if($('#edit-marketActivityName').val()==''){
			//校验必填信息是否为空
			alert("请填写(加*)必填信息")
		}else{
			var now=new Date().toLocaleDateString().replace(/\//g, '-');
			$.ajax({
				url:'/crm/workbench/activity/updateActivity',
				data:{//除了这种方式 还可以使用表单序列化转化成字符串 $('#updateform').serialize();
					// 文本格式应该是contentType: "application/json
					// 不写默认为application/x-www-form-urlencoded
					"owner":$('#edit-marketActivityOwner').val(),
					"name":$('#edit-marketActivityName').val(),
					"startDate":$('#edit-startTime').val(),
					"endDate":$('#edit-endTime').val(),
					"cost":$('#edit-cost').val(),
					"description":$('#edit-describe').val(),
					"id":$('#id').val()
				},
				dataType:'json',
				type:'get',
				//contentType: "application/json",
				success:function (data) {
					if(data.success){
						location.href="/crm/workbench/activity/queryActivityDetail?id=${activity.id}";
					}
					//弹窗提示是否修改成功
					alert(data.mess);
				}
			})
		}

	});

	//异步查询选中的市场信息 回写到修改页面
	$("#updatebtn").click(function () {

		var id = '${activity.id}';
		$.ajax({
			url: "/crm/workbench/activity/queryActivityById",
			data: {"id": id},
			dataType: "json",
			type: 'get',
			success: function (data) {
				console.log(data)
				$('#edit-marketActivityName').val(data.name);
				$('#edit-startTime').val(data.startDate);
				$('#edit-endTime').val(data.endDate);
				$('#edit-cost').val(data.cost);
				$('#edit-describe').val(data.description);
				$("#id").val(data.id);
				//alert(dataa.owner)

				//查询所有者 拼接到select中
				var uid = data.owner;
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
	})
</script>
</html>