<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Products page</title>
    </head>
    <style>
        td, th {
            border: 1px solid black;
            text-align: left;
            padding: 8px;
            color:red;
        }
        tr:nth-child(even) {
            background-color: Beige;
            color: white;
        }
    </style>
    <body>
        <div style="background-color:#0000ff">
        <h2 style="text-align: center;">Welcome to GST Billing app</h2>
        <h3 style="text-align: center;">Add a product or bill the products</h3>
        <h4 style="text-align: center;"></div>
            <form action="BillProduct" method="post">
        <input style="position:absolute;right:39px;top:100px;background-color:orange;" type="submit" value="BILLING-Section"/></form> </h4>
        <form style="text-align: center;"
                action="addProduct" method="post">

                <table style="width: 100%;
                     display: flex;
                     justify-content: center;
                     align-content: center;
                     text-align: center;
                     font-family: 'Times New Roman';">
                     <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>GST applied</th>
                <th>Modify Product Data</th>
                  </tr>
                  <td>  <input type="number" name="product_code"/></td>
                  <td> <input type="text" name="product_name"/></td>
                  <td> <input type="number" name="product_price"/></td>
                  <td><input type="number" name="product_gst"/></td>
                  <td> <input type="submit" value="Enter New Product Details"></td>
                  <tr>
                      </tr>
                    </table>   
        </form>
        <hr>

        <h2 style="text-align: center">All Product Details</h2>

        <table style="width: 100%;
                     display: flex;
                     justify-content: center;
                     align-content: center;
                     text-align: center;
                     font-family: 'Times New Roman';">
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>GST applied</th>
                <th>Modify Product Data</th>
            </tr>
            <c:forEach items="${allProducts}" var="item">
                <tr>
                    <td><c:out value="${item.product_code}" /></td>
                    <td><c:out value="${item.product_name}" /></td>
                    <td><c:out value="${item.product_price}" /></td>
                    <td><c:out value="${item.product_gst}" /></td>
                    <td><input type="submit" value="Modify Product Data" onclick="loadEditOption(${item.product_code})"></td>
                </tr>
            </c:forEach>
        </table>
            <form action="updateProduct" method="post" id="edit_form" style="display: none;float:right;margin-right: 40px;margin-top: -140px">
                Enter the Id of the Product
                <br>
                <input type="number" id="prod_code" name="product_code"/>
                <br>
                Enter new Price/Unit of your product
                <br>
                <input type="number" name="product_price"/>
                <br>
                Enter new GST Rate in %
                <br>
                <input type="number" name="product_gst"/>
                <br>
                <input type="submit">
                <button onclick="hideForm()">Hide</button>
            </form>

    </body>
    <script>
        function loadEditOption(product_id)
        {
            document.getElementById("edit_form").style.display="block";
            document.getElementById("prod_code").value=product_id;
        }
        function hideForm()
        {
            document.getElementById("edit_form").style.display="none";
        }
    </script>

</html>
