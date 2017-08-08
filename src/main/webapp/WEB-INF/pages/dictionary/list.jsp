<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>课程列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<style type="text/css">

.form-group{
	/* wieth:70%; */
}
</style>
</head>
<body style="width:98%">
	<div class="row">
		<div class="col-xs-12">
			<div>
				<input type="text" class="form-control-static" id="searchTypeName"
					placeholder="请输入类型名"> 
				<input type="text"
					class="form-control-static" id="searchTypeCode" placeholder="请输入类型编码">
				<input type="text"
					class="form-control-static" id="searchDatakey" placeholder="请输入Key">
				<button type="button" class="btn btn-default" id="search">查询</button>
				<a href="#" class="btn btn-primary" id="add" onclick="add()">新增</a>
			</div>
			<div class="table-responsive">
				<table id="mydatatables"
					class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						  
							<th>类型名称</th>
							<th>类型编码</th>
							<th>Key</th>
							<th>Value</th>
							<th>排序序号</th>
							<th>操作</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	
	<!-- 更新修改 -->
	<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
					
				</div><br />
				<div class="modal-body" style="padding:10px">
					<form id="myform"class="form-horizontal" role="form" style="width:100%" action="${path}/dictionary/doEdit.action">
						<input type="hidden" name="id" value="" id="id"/>
						
							<div class="form-group">
	                          <label class="col-sm-2 control-label" for="typename">类型名称：</label>
	                          <div class="col-sm-4">
	                             <input type="text" class="form-control" id="typename" name="typename" placeholder="请输入类型名称" value="">
	                          </div>
	                          <label class="col-sm-2 control-label" for="typecode">类型编码：</label>
	                          <div class="col-sm-4">
	                             <input type="text" class="form-control" id="typecode" name="typecode" placeholder="请输入类型编码" value="">
	                          </div>
	                        </div>
	                       
							<div class="form-group">
	                          <label class="col-sm-2 control-label" for="datakey">key</label>
	                          <div class="col-sm-4">
	                             <input type="text" class="form-control" id="datakey" name="datakey" placeholder="请输入key" value="">
	                          </div>
	                          <label class="col-sm-2 control-label" for="typecode">value</label>
	                          <div class="col-sm-4">
	                             <input type="text" class="form-control" id="datavalue" name="datavalue" placeholder="请输入value" value="12312312">
	                          </div>
	                        </div>
	                        
							<div class="form-group">
	                          <label class="col-sm-2 control-label" for="orders">序号</label>
	                          <div class="col-sm-4">
	                             <input type="number" class="form-control" id="orders" name="orders" placeholder="请输入排序序号" value="">
	                          </div>
	                         
	                        </div>
							
							
					  	<div >
						    <button type="button" class="btn btn-primary btn-lg btn-block" id="btnsub">提交</button>
						</div>
					  
				</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	
	
	
	
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>

	<script type="text/javascript">
	
		jQuery(function($) {
			mydatatables = $('#mydatatables').DataTable(
					
							{
								"lengthMenu" : [ [ 10, 20, 50, 1000 ],
										[ 10, 20, 50, "All" ] ],
								"pageLength" : 10,
								"searching" : true,
								"ordering" : true,
								"processing" : true,
								"serverSide" : true,
								"autoWidth" : false,
								
							    "dom": 'tiprl',//自定义显示项
								//跟数组下标一样，第一列从0开始，这里表格初始化时，
								"order" : [ [ 6, "desc" ] ],
								"ajax" : {
									"url" : "${path}/dictionary/dictionary/doSearchDictionary.action",
									"type" : "POST",
									"data" : function(pdata) {
										
										pdata.searchColumns={
												"TypenameLike":$("#searchTypeName").val(),
												"TypecodeLike":$("#searchTypeCode").val(),
												"DatakeyLike":$("#searchDatakey").val()
										}
										var data = JSON.stringify(pdata);
										
										return data;
									},
									stateSave: true,
									dataType : "json",
									processData : false,
									contentType : 'application/json;charset=UTF-8',
									error:function(data){
										alert(data.responseText);
									}
								},
								"columns" : [  {
									"data" : "typename"
								}, {
									"data" : "typecode"
								}, {
									"data" : "datakey"
								}, {
									"data" : "datavalue",
								}, {
									"data" : "orders",
								}, {
									"data" : "id",
									"orderable":false
								},{
									"data" : "ctime",
									"visible" : false
								}],
								"columnDefs" : [
										{
											"render" : function(data, type, row) {
												//row.account
												return '<a href="#" class="tooltip-success" data-rel="tooltip" title="修改" onclick="edit(\''+data+'\')"><span class="green"><i class="icon-edit bigger-120"></i></a>&nbsp;&nbsp;'
												+'<a href="javascript:void(0)" onclick="del(\''+data+'\')" class="tooltip-error" data-rel="tooltip" title="删除"><span class="red"><i class="icon-trash bigger-120"></i></a>&nbsp;&nbsp;';
												
											},
											"targets" : 5
										} ],

								"language" : {
									"url" : "${path}/resources/assets/language/zh_CN.txt"
								}
							});

			$("#search").click(function() {
				mydatatables.ajax.reload();
			});
			
			$("#courseName").keydown(function(e) {
				if(e.keyCode==13){
					mydatatables.ajax.reload();
				}
			});

		});
		
		function del(id){
			if(window.confirm("你确定要删除？")){
				$.getJSON("${path}/dictionary/dictionary/doDel.action?id="+id,
							function(data){
						alert(data.msg);
						if(data.status==1){
							mydatatables.ajax.reload();
						}
					});
			}
		}
		
		function add(){
			clean();
			$("#myModalLabel").html("添加字典");
			$('#Modal').modal('show')
		}
		
		function edit(id){
			//alert(id)
			clean();
			$("#myModalLabel").html("编辑字典");
			$.getJSON("${path}/dictionary/getDictionary.action?id=" + id,function(data) {
				if(data != null){
					//console.info(data);
					$("#id").val(data.id);
					$("#typename").val(data.typename);
					$("#typecode").val(data.typecode);
					$("#datakey").val(data.datakey);
					$("#datavalue").val(data.datavalue);
					$("#orders").val(data.orders);
					$('#Modal').modal('show')
				}else{
					alert("数据读取失败！")
				}
			});
		}
		
		$(document).ready(function() { 
			
			$("#btnsub").click(function(){
				
				if($("#typename").val() == ""){
					alert("请输入类型名称！");
					return;
				}else if($("#typecode").val() == ""){
					alert("请输入类型编码！");
					return;
				}else if($("#datavalue").val() == ""){
					alert("请输入value！");
					return;
				}
				
				$('#myform').ajaxSubmit({success:function(data){
					//console.info(data)
                	var jsonobj=JSON.parse(data);
                	if(jsonobj.status==1){
                		alert(jsonobj.msg);
                		mydatatables.ajax.reload(null,false);
                	}
                	$('#Modal').modal('hide')
                },error:function(data){
                	//console.info(data)
                	alert(data.responseText);
                	$('#Modal').modal('hide')
                }}); 
                return false;
			})
        });	
		function clean(){
			$("#myModalLabel").html("");
			$("#id").val("");
			$("#typename").val("");
			$("#typecode").val("");
			$("#datakey").val("");
			$("#datavalue").val("");
			$("#orders").val("");
		}
	</script>
</body>
</html>
