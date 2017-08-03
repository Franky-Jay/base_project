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
	<div class="container">
		<c:if test="${error!=null}">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="alert alert-danger" role="alert">${error}</div>
				</div>
			</div>

		</c:if>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form role="form" action="${path }/user/doUpdatePassword.action" method="post" class="editPwd">
					<%--<input type="hidden" value="${user.id }" name="id">--%>
					<div class="form-group">
						<label for="acount">原密码</label> <input id="acount" type="password" required="required"
															   class="form-control" name="oldpassword" placeholder="请输入原密码" <c:if test="${user!=null}">readonly</c:if>>
					</div>
					<div class="form-group">
						<label for="name">新密码</label> <input id="name" type="password" required="required"
															 class="form-control" name="newpassword" placeholder="请输入新密码">
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">修改</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="${path }/user/list.action" class="btn btn-default">返回</a>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/pages/common/rs_js.jsp"%>
</body>
</html>