<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="operations.BookOperations" %>
<%@ page import="basis.Book" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>结果</title>
    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <script>
        var temp;
        function show_modal() {
            $('#myModal').modal('show');
            document.getElementById("bookID").value = temp;
        }
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
            search();
        }

        $(function() {
            $('#tab').bootstrapTable({
                locale:'zh-CN',//中文支持
                // queryParams:queryParams,//请求服务器时所传的参数
                sidePagination:'server',//指定服务器端分页
                pagination: true,//是否开启分页（*）
                pageNumber:1,//初始化加载第一页，默认第一页
                pageSize:3,//单页记录数
                pageList:[1,3,5]//分页步进值
            });
        });

        function queryParams(params){
            return{
                page:params.offset/params.limit+1,//第几页
                rows: params.limit,//每页多少条
                title:$('#title').val()
            }
        }

        function search(){
            $('#tab').bootstrapTable('refresh', {url: 'listContent',pageNumber:1,pageSize:3});
        }

    </script>
</head>
<body onload="load();">
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="deleteSuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>删除成功
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="deleteFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>删除失败
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="updateFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>更新失败
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="updateSuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>更新成功
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="insertFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>插入失败
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="insertSuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>插入成功
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="queryFailed">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>查询失败
</div>
<div class="alert alert-warning hide col-sm-offset-2 col-md-8" id="querySuccess">
    <a href="#" class="close" data-dismiss="alert">
        &times;
    </a>
    <strong>注意: </strong>查询成功
</div>
<div id="container" class="col-sm-offset-2 col-md-8">
    <table id="tab" class="table table-hover">
        <caption class="center table-header">书籍表</caption>
        <thead>
        <tr class="success">
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Writer</th>
            <th>Inventory</th>
            <th>Category</th>
            <th>Publish Date</th>
            <th>操作</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.lists}" var="keyword" varStatus="id">
            <tr class="warning">
                <td>${keyword.bookId}</td>
                <td>${keyword.name}</td>
                <td>${keyword.price}</td>
                <td>${keyword.writer}</td>
                <td>${keyword.quantity}</td>
                <td>${keyword.categoryId}</td>
                <td>${keyword.date}</td>
                <td>
                    <form action="BookManage?bookID=${keyword.bookId}&status=2" enctype = "multipart/form-data" method="post">
                        <button id="btn_edit" type="button" class="btn btn-primary" onclick="temp = '${keyword.bookId}';show_modal();" >修改</button>
                        <button type="submit" class="btn btn-primary" >删除</button>
                    </form>
                <td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="BookManage?status=1" method="post" enctype = "multipart/form-data">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">修改记录</h4>
                    </div>
                    <div class="modal-body">
                        <label  class="form-group" for="bookID">BookID:</label>
                        <div>
                            <input type="text" contenteditable="false" class="form-control" id="bookID" name="bookID" placeholder="请输入书的ID">
                        </div>
                        <label class="form-group" for="title">Book Name:</label>
                        <div>
                            <input type="text" class="form-control"  id="title" name="title" placeholder="请输入书名">
                        </div>
                        <label class="form-group" for="price">Book Price:</label>
                        <div>
                            <input type="text" class="form-control"  id="price" name="price" placeholder="请输入价格">
                        </div>
                        <label class="form-group" for="publishDate">BookPublishDate:</label>
                        <div>
                            <input type="text" class="form-control" id="publishDate"  name="publishDate" placeholder="请输入出版日期">
                        </div>
                        <label class="form-group" for="inventory">Inventory:</label>
                        <div>
                            <input type="text" class="form-control"  id="inventory"  name="inventory" placeholder="请输入库存">
                        </div>
                        <label class="form-group" for="category">Category:</label>
                        <div>
                            <input type="text" class="form-control" id="category"  name="category" placeholder="请输入类别">
                        </div>
                        <label class="form-group" for="writer">Writer:</label>
                        <div>
                            <input type="text" class="form-control" id="writer"  name="writer" placeholder="请输入作者">
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

    <form method="post">
        <button type="submit"  class="btn btn-default" onclick="this.form.action='/UserManager'" ><span class="glyphicon glyphicon-list" aria-hidden="true"></span> 查看用户表</button>
        <button type="submit"  class="btn btn-default" onclick="this.form.action='/OrderManager?status=0'" ><span class="glyphicon glyphicon-list" aria-hidden="true"></span> 查看订单&售后表</button>
        <button type="submit"  class="btn btn-default" onclick="this.form.action='BookIntroPage.html'" ><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 返回</button>
    </form>
</div>
</body>
</html>
