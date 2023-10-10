

<%@page import="java.util.List"%>
<%@ page import="az.techno.model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.js"></script>
</head>
<body>
<%
    List<Product> list = (List<Product>) request.getAttribute("list");
%>

<form class="search-container" action="product" method="GET">
    <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" class="form-control" name="name">
    </div>
    <div class="mb-3">
        <label class="form-label">Price</label>
        <input type="text" class="form-control" name="price">
    </div>
    <input type="submit" class=" fa-bounce btn btn-primary" name="search" value="Search"/>
</form>

<table class="table table-dark table-striped-columns  text-center">
    <thead>
    <tr class="col">
        <th class="col">ID</th>
        <th class="col-6">Name</th>
        <th class="col" >Price</th>
        <th class="col">Quantity</th>
        <th class="col-2 " colspan="2">Operations</th>
    </tr>
    </thead>




    <tbody>
    <% for (Product p : list) {
    %>
    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getName()%></td>
        <td><%=p.getPrice()%></td>
        <td><%=p.getQuantity() == null ? "0" : p.getQuantity()%></td>
        <td>
            <input type="hidden" value="<%=p.getId()%>" name="id"/>
            <button onclick="setIdForDelete(<%=p.getId()%>)"data-bs-toggle="modal" data-bs-target="#exampleModal" name="action" value="delete" type="submit"  style="background: transparent"><i class="fa-solid fa-delete-left " style="color: #dc1818;"></i></button>
        </td>
        <td>
            <form action="productdetail" method="GET">
                <input type="hidden" value="<%=p.getId()%>" name="id"/>
                <button name="action" value="update" type="submit" style="background: transparent">
                    <i class="fa-solid fa-pen-to-square" style="color: #dc1818;"></i>
                </button>
            </form>
        </td>
    </tr>

    <% }%>
    </tbody>

</table>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Are you sure?</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <form action="productdetail" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
