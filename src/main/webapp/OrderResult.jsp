<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="basis.Bill" %>
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
        var temp;
        function show_modal() {
            $('#myModal').modal('show');
            document.getElementById("orderID").value = temp;
        }
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
            <th>orderID</th>
            <th>userID</th>
            <th>userName</th>
            <th>date</th>
            <th>status</th>
            <th>totalItem</th>
            <th>totalPrice</th>
            <th>操作</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.orderListResult}" var="keyword" varStatus="id">
            <tr class="warning">
                <td>${keyword.orderId}</td>
                <td>${keyword.userId}</td>
                <td>${keyword.account.userName}</td>
                <td>${keyword.orderDate}</td>
                <td>${keyword.status}</td>
                <td>${keyword.totalItem}</td>
                <td>${keyword.totalPrice}</td>
                <td>
                    <form action="OrderManager?orderID=${keyword.orderId}&status=3" enctype = "multipart/form-data" method="post">
                        <button id="btn_edit" type="button" class="btn btn-primary" onclick="temp = '${keyword.orderId}';show_modal();" >修改</button>
                        <button type="submit" class="btn btn-primary" >详情</button>
                    </form>
                <td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form method="post">
        <button type="submit"  class="btn btn-default" onclick="this.form.action ='BookResult.jsp'"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 返回书籍表</button>
    </form>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form action="OrderManager?status=1" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改记录</h4>
                </div>
                <div class="modal-body">
                    <label  class="form-group" for="orderID">OrderID:</label>
                    <div>
                        <input type="text" contenteditable="false" class="form-control" id="orderID" name="orderID" placeholder="请输入订单ID">
                    </div>
                    <label class="form-group" for="statusNow">Status:</label>
                    <div>
                        <input type="text" class="form-control"  id="statusNow" name="statusNow" placeholder="请输入现订单状态">
                    </div>
                    <label class="form-group" for="totalPrice">Price:</label>
                    <div>
                        <input type="text" class="form-control"  id="totalPrice" name="totalPrice" placeholder="请输入协商更改价格">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="reset"  class="btn btn-default" ><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span> 重置</button>
                    <button type="submit" id="btn_submit" class="btn btn-primary" ><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 修改</button>
                </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>