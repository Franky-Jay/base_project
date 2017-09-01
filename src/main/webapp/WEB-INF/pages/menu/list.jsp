<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>树形菜单列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<link rel="stylesheet"
	href="${path}/resources/assets/css/zTreeStyle.css" />
<style type="text/css">
	.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
</head>
<body style="width: 100%">


	<div class="container">
		<div class="row clearfix">
			<div class="col-md-6 column">
				<div class="content_wrap">
					<div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree"></ul>
					</div>
				</div>
			</div>
			<div class="col-md-6 column">
			
				<!-- 添加菜单（Modal） -->
				<div class="modal fade" id="Modal" tabindex="-1" role="dialog"
				     aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				                <h4 class="modal-title" id="myModalLabel"></h4>
				            </div>
				            <div class="modal-body">
				                <form id="myform" class="form-horizontal"  method="post" style="margin: 0 auto">
				                    <input type="hidden" id="pid" value="" name="pid">
				                    <input type="hidden" id="permissionId" value="" name="permissionId">
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="name">
				                            	<h3 class="panel-title" style="color: red" id="nameTitle">请输入菜单的名称</h3>
				                            </label>
				                        </div>
				                        <div class="controls">
				                            <input type="text" class="form-control" id="name" name="name" required>
				                        </div>
				                    </div>
				                    <br />
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="name">
				                                <h3 class="panel-title">设置菜单状态</h3>
				                            </label><br /> 
				                            <label class="radio-inline"> 
				                            	<input type="radio" value="1" name="status" checked="checked">可用
				                        	</label> 
				                        	<label class="radio-inline"> 
				                        		<input type="radio" value="0" name="status" id="status">不可用
				                        	</label>
				                        </div>
				                    </div>
				                    
				                    <input type="hidden" class="form-control" id="type" name="type">
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="name">
				                                <h3 class="panel-title">序号</h3>
				                            </label><br /> 
				                        	<div class="controls">
				                            	<input type="text" class="form-control" id="orders" name="orders">
				                        	</div>
				                        </div>
				                    </div>
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="name">
				                                <h3 class="panel-title">是否可查询列表</h3>
				                            </label><br /> 
				                            <label class="radio-inline"> 
				                            	<input type="radio" value="1" name="islist" checked="checked">是
				                        	</label> 
				                        	<label class="radio-inline"> 
				                        		<input type="radio" value="0" name="islist" id="islist">否
				                        	</label>
				                        </div>
				                    </div>
				                    <div class="control-group">
				                        <div class="input-group" style="float: left">
				                            <div class="input-group-btn">
				                                <button type="button" class="btn btn-default" tabindex="-1">请选择菜单图标</button>
				                                <button type="button" class="btn btn-default dropdown-toggle"
				                                        data-toggle="dropdown" tabindex="-1">
				                                    <span class="caret"></span>
				                                </button>
				                                <ul class="dropdown-menu">
				                                    <li class="divider"></li>
				                                    <li><a href="#" class="one">icon-desktop</a></li>
				                                    <li class="divider"></li>
				                                    <li><a href="#" class="two">icon-list</a></li>
				                                    <li class="divider"></li>
				                                </ul>
				                            </div>
				                            <!-- /btn-group -->
				                            <input type="text" class="form-control"  required readonly name="icon" id="icon">
				                        </div>
				                        <!-- /input-group -->
				                        <!-- /.col-lg-6 -->
				                        <br>
				                    </div> 
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="uri"><h3 class="panel-title">请输入URI路径</h3></label>
				                        </div>
				                        <div class="controls">
				                            <input type="text" class="form-control" id="uri" name="uri">
				                        </div>
				                    </div>
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="classpath"><h3 class="panel-title">请输入类的全路径</h3></label>
				                        </div>
				                        <div class="controls">
				                            <input type="text" class="form-control" id="classpath" name="classpath">
				                        </div>
				                    </div>
				                    <div class="control-group">
				                        <div class="panel-heading">
				                            <label class="control-label" for="uri"><h3 class="panel-title">业务数据编码</h3></label>
				                        </div>
				                        <div class="controls">
				                            <input type="text" class="form-control" id="businessCode" name="businessCode" >
				                        </div>
				                    </div>
				                    <div class="control-group">
				                        <br /> <br />
				                        <div class="row clearfix">
				                            <div class="col-md-12 column">
				                                <!--<button type="submit" class="btn btn-success btn-lg" >按钮</button>-->
				                                <button type="submit"
				                                        class="btn btn-success btn-lg btn-block" id="from"
				                                        style="text-shadow: black 5px 3px 3px;">
				                                    <span class="glyphicon glyphicon-plus" id="but"></span>
				                                </button>
				                            </div>
				                        </div>
				                    </div>
				                </form>
				            </div>
				        </div><!-- /.modal-content -->
				    </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->


			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>
	<script src="${path}/resources/assets/js/jquery.ztree.core.min.js"></script>
	<script src="${path}/resources/assets/js/jquery.ztree.excheck.min.js"></script>
	<script src="${path}/resources/assets/js/jquery.ztree.exedit.min.js"></script>
	<script type="text/javascript">
	var setting = {
			view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                expandSpeed: "show", //设置树展开的动画速度
                fontCss : setFontCss,
                showIcon: true, //是否显示图标
                showLine: true //是否显示连接线
            },
            callback: {
        		beforeEditName: editNode,
        		beforeRemove: removeNode,
        	},
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                enable: true,
        		showRenameBtn: true,
        		showRemoveBtn: true
            },
            async: {
                enable: true,
                autoParam: ["id"],
                url: "${path}/menu/getMenuTreeToJson.action",
              
            },
            data: {
				simpleData: {
					enable: true,
                    idKey: "id",  
                    pIdKey: "pId",  
                    rootPId: "0"
				}
			}
	};
	
	
	
	$(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting);
    });
	
	
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    
    function addHoverDom(treeId, treeNode) {
    	console.info("id=" + treeNode.id + "," + treeNode.level)
    	if(treeNode.level < 2){
    		var sObj = $("#" + treeNode.tId + "_span");
            if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
            var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
			+ "' title='add node''></span>";
            sObj.after(addStr);
            var btn = $("#addBtn_"+treeNode.tId);
            if (btn) btn.bind("click", function(){
                var zTree = $.fn.zTree.getZTreeObj("treeDemo");

                if(treeNode.level == 0){ //说明是添加一级菜单
                	
                	$('#Modal').modal('show')
                	
                }
                return false;
            }); 
    	}
        
    };
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };
    
    
    
    function setFontCss(treeId, treeNode) {
    	if(treeNode.level == 0){
    		return {color:"red",'font-weight':'bold'};
    	}
    	if(treeNode.level == 1){
    		return {color:"blue"};
    	}
    	if(treeNode.level == 2){
    		return {color:"black"};
    	}
    };
    
    function setRemoveBtn(treeId, treeNode) {
    	
    	return !treeNode.isParent;
    }
    
    
    //编辑节点
 	function editNode(treeId, treeNode) {
    	alert("123")
    	
    	
    	
    	return false;
    }
 	
 	function removeNode(treeId, treeNode) {
 		if(window.confirm("你确定要删除？")){
			$.getJSON("${path}/menu/rest/doDelete.action?id="+treeNode.id,
				function(data){
					if(data.status==1){
						var treeObj = $.fn.zTree.getZTreeObj(treeId);
						treeObj.reAsyncChildNodes(null, "refresh");
						alert(data.msg);
				    }
				}
			);
		}
    	return false;
    }
	</script>
	
</body>
</html>
