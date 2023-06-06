<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Ứng dụng Product Discount Calculator</h1>
<form action="/calculator" method="post">
    <div>
        <input type="text" name = "productDescription" placeholder="Product Description">
    </div>
    <div>
        <input type="number" name="listPrice" placeholder="List Price">
    </div>
    <div>
        <input type="number" name="discountPercent" placeholder="Discount Percent"><span class="input-group-text">%</span>
    </div>
    <div>
        <button type="submit">Calculate Discount</button>
    </div>
</form>
</body>
</html>