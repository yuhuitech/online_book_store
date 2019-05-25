<%--
  Created by IntelliJ IDEA.
  User: suyuhui
  Date: 2018/6/13
  Time: 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="basis.Book" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>结果</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <script>
        var temp ;
    </script>
    <script>
        function load()
        {
            var temp ='${requestScope.status}';
            switch (temp) {
                case 'insertSuccess':
                    $('#insertSuccess').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'insertFailed':
                    $('#insertFailed').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'updateSuccess':
                    $('#updateSuccess').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'updateFailed':
                    $('#updateFailed').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'deleteSuccess':
                    $('#deleteSuccess').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'deleteFailed':
                    $('#deleteFailed').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'querySuccess':
                    $('#querySuccess').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
                case 'queryFailed':
                    $('#queryFailed').attr("class","alert alert-warning col-sm-offset-2 col-md-8");
                    break;
            }
        }
    </script>
</head>
<body onload="load();">

<div class="alert alert-warning hide" id="deleteSuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>删除成功
</div>
<div class="alert alert-warning hide" id="deleteFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>删除失败
</div>
<div class="alert alert-warning hide" id="updateFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>更新失败
</div>
<div class="alert alert-warning hide" id="updateSuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>更新成功
</div>
<div class="alert alert-warning hide" id="insertFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>插入失败
</div>
<div class="alert alert-warning hide" id="insertSuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>插入成功
</div>
<div class="alert alert-warning hide" id="queryFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>查询失败
</div>
<div class="alert alert-warning hide" id="querySuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>查询成功
</div>
<div id="container" class="col-sm-offset-2 col-md-8">
    <table class="table table-hover">
        <caption class="center table-header">订单查询表</caption>
        <thead>
        <tr class="success">
            <th>userID</th>
            <th>type</th>
            <th>userName</th>
            <th>tel</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.UserLists}" var="keyword" varStatus="id">
            <tr class="warning">
                <td>${keyword.userId}</td>
                <td>${keyword.type}</td>
                <td>${keyword.userName}</td>
                <td>${keyword.tel}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form method="post">
        <button type="submit"  class="btn btn-default" onclick="this.form.action ='BookResult.jsp'"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 返回书籍表</button>
    </form>
</div>
</body>
</html>
