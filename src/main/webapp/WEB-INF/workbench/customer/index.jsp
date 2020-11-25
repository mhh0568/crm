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

	$(function(){
		
		//定制字段
		$("#definedColumns > li").click(function(e) {
			//防止下拉菜单消失
	        e.stopPropagation();
	    });
		
	});
	
</script>
</head>
<body>

	<!-- 创建客户的模态窗口 -->
	<div class="modal fade" id="createCustomerModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建客户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-customerOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-customerOwner">

								</select>
							</div>
							<label for="create-customerName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-customerName">
							</div>
						</div>
						
						<div class="form-group">
                            <label for="create-website" class="col-sm-2 control-label">公司网站</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="create-website">
                            </div>
							<label for="create-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-phone">
							</div>
						</div>
						<div class="form-group">
							<label for="create-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-describe"></textarea>
							</div>
						</div>
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                        <div style="position: relative;top: 15px;">
                            <div class="form-group">
                                <label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="3" id="create-contactSummary"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                                <div class="col-sm-10" style="width: 300px;">
                                    <input type="text" class="form-control" id="create-nextContactTime">
                                </div>
                            </div>
                        </div>

                        <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address"></textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="saveCustomer" class="btn btn-primary" data-dismiss="modal">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改客户的模态窗口 -->
	<div class="modal fade" id="editCustomerModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
					<input type="hidden" name="id" id="id">
						<div class="form-group">
							<label for="edit-customerOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="edit-customerOwner">
								  <option>zhangsan</option>
								  <option>lisi</option>
								  <option>wangwu</option>
								</select>
							</div>
							<label for="edit-customerName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-customerName" value="动力节点">
							</div>
						</div>
						
						<div class="form-group">
                            <label for="edit-website" class="col-sm-2 control-label">公司网站</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input type="text" class="form-control" id="edit-website" value="http://www.bjpowernode.com">
                            </div>
							<label for="edit-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="edit-phone" value="010-84846003">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="edit-describe"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>

                        <div style="position: relative;top: 15px;">
                            <div class="form-group">
                                <label for="edit-contactSummary" class="col-sm-2 control-label">联系纪要</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="3" id="edit-contactSummary"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
                                <div class="col-sm-10" style="width: 300px;">
                                    <input type="text" class="form-control" id="edit-nextContactTime">
                                </div>
                            </div>
                        </div>

                        <div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="edit-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="edit-address">北京大兴大族企业湾</textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="updateCustomer" class="btn btn-primary" data-dismiss="modal">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>客户列表</h3>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
	
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form id="form" class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input name="name" class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input name="owner" class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司座机</div>
				      <input name="phone" class="form-control" type="text">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司网站</div>
				      <input name="website" class="form-control" type="text">
				    </div>
				  </div>
				  
				  <button type="button" id="queryCustomer" class="btn btn-default">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" id="createCustomer-btn" class="btn btn-primary" data-toggle="modal" data-target="#createCustomerModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" id="updateCustomer-btn" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" id="deleteCustomer-btn" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" /></td>
							<td>名称</td>
							<td>所有者</td>
							<td>公司座机</td>
							<td>公司网站</td>
						</tr>
					</thead>
					<tbody id="showCustomer">

					</tbody>
				</table>
			</div>
			
			<div id="customerPage" style="height: 50px; position: relative;top: 30px;">

			</div>
			
		</div>
		
	</div>
</body>
	<script>

		//删除
		$('#deleteCustomer-btn').click(function () {
			var ids=[];
			if($('.son:checked').length==0){
				alert("至少选中一条记录")
			}else{
				$('.son:checked').each(function () {
					//alert($(this).val())
					ids.push($(this).val())
				})
				$.ajax({
					url:"/crm/workbench/customer/deleteCustomer",
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
		$('#updateCustomer').click(function () {
			if($('#edit-customerName').val()==''){
				//校验必填信息是否为空
				alert("请填写(加*)必填信息")
			}else{
				$.ajax({
					url:'/crm/workbench/customer/updateCustomerById',
					data:{//除了这种方式 还可以使用表单序列化转化成字符串 $('#updateform').serialize();
						// 文本格式应该是contentType: "application/json
						// 不写默认为application/x-www-form-urlencoded
						"owner":$('#edit-customerOwner').val(),
						"name":$('#edit-customerName').val(),
						"website":$('#edit-website').val(),
						"phone":$('#edit-phone').val(),
						"description":$('#edit-describe').val(),
						"contactSummary":$('#edit-contactSummary').val(),
						"nextContactTime":$('#edit-nextContactTime').val(),
						"address":$('#edit-address').val(),
						"id":$('#id').val()
					},
					dataType:'json',
					type:'get',
					//contentType: "application/json",
					success:function (data) {
						//弹窗提示是否修改成功
						alert(data.mess);
						//重新加载页面的市场活动信息
						pageList(1,2);
					}
				})
			}

		});

		//异步查询选中的市场信息 回写到修改页面
		$("#updateCustomer-btn").click(function () {
			if ($('.son:checked').length == 1) {
				var id = $('.son:checked').val();
				$.ajax({
					url: "/crm/workbench/customer/queryCustomerById",
					data: {"id": id},
					dataType: "json",
					type: 'get',
					success: function (data) {
						//console.log(data)
						$('#edit-customerName').val(data.name);
						$('#edit-website').val(data.website);
						$('#edit-phone').val(data.phone);
						$('#edit-describe').val(data.description);
						$('#edit-contactSummary').val(data.contactSummary);
						$('#edit-nextContactTime').val(data.nextContactTime);
						$('#edit-address').val(data.address);
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
								$("#edit-customerOwner").text("");
								for (var i = 0; i < data.length; i++) {
									//拼接修改页面的所有者的下拉列表
									$("#edit-customerOwner").append("<option class='updateson' value=" + data[i].id + ">" + data[i].name + "</option>")
								}
								$('#edit-customerOwner option').each(function () {
									if ($(this).val() == uid) {
										//选中
										$(this).prop("selected", true);
									}
								})
								//手动打开模态窗口
								$("#editCustomerModal").modal('show');
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


		//点击查询
		$('#queryCustomer').click(function () {
			pageList(1,2);
		});
		//加载页面时调用该方法
		pageList(1,2);
		//递归调用
		function pageList(pageNo, pageSize) {
			var form = $('#form').serialize();
			$.ajax({
				url: "/crm/workbench/customer/queryCustomer?pageNo="+pageNo+"&pageSize="+pageSize,
				contentType: "application/json",
				data:
				     form,
				dataType: "json",
				type: "get",
				success: function (data) {
					//alert(data.list.length)
					//每次查询把前面的清空
					$("#showCustomer").html("");
					for (var i = 0; i < data.list.length; i++) {
						//console.log(data)
						//alert(data.list[i].owner)
						//拼接数据
						$("#showCustomer").append("<tr class=\"active\">\n" +
								"<td><input class='son'type='checkbox' value=" + data.list[i].id + "  /></td>\n" +
								"<td><a style=\"text-decoration: none; cursor: pointer;\" href=/crm/workbench/activity/queryActivityDetail?id="+data.list[i].id+">" + data.list[i].name + "</a></td>\n" +
								"<td>" + data.list[i].user.name + "</td>\n" +
								"<td>" + data.list[i].phone + "</td>\n" +
								"<td>" + data.list[i].website + "</td>\n" +
								"</tr>");
					}
					$("#customerPage").bs_pagination({
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

		//异步查询所有用户的姓名 显示在添加页面
		$("#createCustomer-btn").click(function () {
			$.ajax({
				url: "/crm/workbench/queryAllUser",
				type: "get",
				dataType: 'json',
				success: function (data) {
					//console.log(data)
					$("#create-customerOwner").html("");
					for (var i = 0; i < data.length; i++) {
						$("#create-customerOwner").append("<option value=" + data[i].id + ">" + data[i].name + "</option>")
					}
				}
			})

		});

		//保存客户
		$('#saveCustomer').click(function () {
			if($('#create-customerName').val()==''){
				alret("请填写(加*)必填信息!")
			}else{
				$.ajax({
					url:'/crm/workbench/customer/saveCustomer',
					data:{
						'owner':$('#create-customerOwner').val(),
						'name':$('#create-customerName').val(),
						'website':$('#create-website').val(),
						'phone':$('#create-phone').val(),
						'description':$('#create-describe').val(),
						'contactSummary':$('#create-contactSummary').val(),
						'nextContactTime':$('#create-nextContactTime').val(),
						'address':$('#create-address').val()
					},
					dataType:'json',
					type:'get',
					success:function (data) {
						alert(data.mess)
						$('#create-customerOwner').val('');
						$('#create-customerName').val('');
						$('#create-website').val('');
						$('#create-phone').val('');
						$('#create-describe').val('');
						$('#create-contactSummary').val('');
						$('#create-nextContactTime').val('');
						$('#create-address').val('');
						pageList(1,2)
					}
				})
			}
		});

		//创建顾客日历插件
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