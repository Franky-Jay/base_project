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
                //zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
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
