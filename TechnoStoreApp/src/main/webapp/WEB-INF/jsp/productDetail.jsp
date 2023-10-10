
<%@ page import="az.techno.model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css"/>
</head>
<%
    Product p =(Product) request.getAttribute("product");
%>
<body>

<form action="productdetail" method="POST" class="save-container">
    <div class="mb-3">
        <input class="form-control" type="hidden" name="id" value="<%=p.getId()%>">
    </div>
    <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" name="name" value="<%=p.getName()%>" class="form-control" >
    </div>
    <div class="mb-3">
        <label class="form-label">Price</label>
        <input  class="form-control" type="text" name="price" value="<%=p.getPrice()%>">
    </div>
    <input class="btn btn-info"  type="submit" value="Save" name="save"/>
    <input name="action" value="update"  type="hidden"/>
</form>
</body>
</html>
