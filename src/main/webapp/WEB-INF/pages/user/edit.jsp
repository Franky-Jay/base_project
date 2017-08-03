<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head> 
<meta charset="utf-8" />
<title>新增用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="/WEB-INF/pages/common/rs_css.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<div class="row">
	   <div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" action="${path }/user/doEdit.action" method="post">
				<input type="hidden" value="${user.id }" name="id">
				<div class="form-group">
					<label for="acount">账号</label> <input id="acount" type="text" required="required"
					class="form-control" name="account" value="${user.account }" placeholder="请输入账号" <c:if test="${user!=null}">readonly</c:if>>
				</div>
				<div class="form-group">
					<label for="name">姓名</label> <input id="name" type="text" required="required"
						class="form-control" name="name" value="${user.name }" placeholder="请输入姓名">
				</div>
				<c:if test="${user eq null}">
					<div class="form-group">
						<label for="password">密码</label> <input id="password" type="password" required="required"
						   class="form-control" name="password" placeholder="请输入密码">
					</div>
				</c:if>

				<div class="text-center">
				<button type="submit" class="btn btn-primary">保存</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${path }/user/list.action" class="btn btn-default">返回</a>
				</div>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>
</body>

</html>