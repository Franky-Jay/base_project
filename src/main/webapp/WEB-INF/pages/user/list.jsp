<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>用户列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<style type="text/css">
</style>
</head>
<body style="width:98%">
	<div class="row">
		<div class="col-xs-12">
			<div>
				<input type="text" class="form-control-static" id="searchName"
					placeholder="请输入姓名">
				<input type="text" class="form-control-static" id="searchAccount"
					placeholder="请输入账号">
					
					
					
				<button type="button" class="btn btn-default" id="search">查询</button>
				<a  href="${path }/user/edit.action" class="btn btn-primary" id="add">新增</a>
			</div>
			<div class="table-responsive">
				<table id="mydatatables"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>账号</th>
							<th>用户名</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>

					<tbody>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>

	<script type="text/javascript">
	
		jQuery(function($) {	
			mydatatables = $('#mydatatables').DataTable(
							{
								"lengthMenu" : [ [ 8, 10, 20, 50, 1000 ],
										[ 8, 10, 20, 50, "All" ] ],
								"pageLength" : 8,
								"searching" : true,
								"ordering" : true,
								"processing" : true,
								"serverSide" : true,
								"autoWidth" : false,
								"dom": '<"top"f >rt<"bottom"ilp><"clear">',//dom定位
							    "dom": 'tiprl',//自定义显示项
								//跟数组下标一样，第一列从0开始，这里表格初始化时，
								//第四列默认降序
								"order" : [ [ 2, "asc" ] ], //asc 升序  ， desc 降序
								"ajax" : {
									"url" : "${path}/user/rest/doSearch.action",
									"type" : "POST",
									"data" : function(pdata) {
										/* pdata.search = {
											"value" : $("#searchvalue").val(),
											"regex" : "false"
										}; */
										
										pdata.searchColumns={
												"NameLike":$("#searchName").val(),
												"AccountEqualTo":$("#searchAccount").val(),
										}
										var data = JSON.stringify(pdata);
										
										return data;
									},
									dataType : "json",
									processData : false,
									contentType : 'application/json;charset=UTF-8',
									error:function(data){
										alert(data.responseText);
									}
								},
								"columns" : [ {
									"data" : "account"
								}, {
									"data" : "name"
								}, {
									"data" : "createtime"
								},  {
									"data" : "id"//默认排序字段
								}],
								"columnDefs" : [
										
										{
											"render" : function(data, type, row) {
												//row.account
												return '<a href="${path }/user/edit.action?id='+row.id+'" class="tooltip-success" data-rel="tooltip" title="Edit"><span class="green"><i class="icon-edit bigger-120"></i></a>&nbsp;&nbsp;'
												+'<a href="javascript:void(0)" onclick="del(\''+row.id+'\')" class="tooltip-error" data-rel="tooltip" title="Delete"><span class="red"><i class="icon-trash bigger-120"></i></a>';
											},
											"targets" : 3
										} ],

								"language" : {
									"url" : "${path}/resources/assets/language/zh_CN.txt"
								}

							});

			$("#search").click(function() {
				/* var args = mydatatables.ajax.params();  */
				mydatatables.ajax.reload();
			}); 
			
			
			$("#searchName").keydown(function(e) {
				if(e.keyCode==13){
					mydatatables.ajax.reload();
				}
			});
			
			$("#searchAccount").keydown(function(e) {
				if(e.keyCode==13){
					mydatatables.ajax.reload();
				}
			});
			
			//全选
			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

			});

		});
		
		function del(id){
			if(window.confirm("你确定要删除？")){
					$.getJSON("${path}/user/doDel.action?id="+id,
								function(data){
									if(data.status==1){
										mydatatables.ajax.reload();
										alert(data.msg);
								    }
								}
					);
			}
		}
	</script>
</body>
</html>
