<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>Order Pizza</title>
</head>
<body>
	<form method="post">
		<div>
			<label for="crust">Crust Type</label>
			<select name="crust" id="crust">
				<option value="thin">Thin</option>
				<option value="handTossed">Hand Tossed</option>
				<option value="stuffed">Stuffed</option>
			</select>
		</div>
		<div>
			<label for="sauce">Sauce Type</label>
			<select name="sauce" id="sauce">
				<option value="red">Red Sauce</option>
				<option value="noSauce">No Sauce</option>
			</select>
		</div>
		<div>
			<label for="size">Size</label>
			<select name="size" id="size">
				<option value="small">Small</option>
				<option value="medium">Medium</option>
				<option value="large">Large</option>
			</select>
		</div>
		<div>
			<label>Toppings</label><br>
			<label> Pepperoni
				<input type="checkbox" name="toppings" value="pepperoni">
			</label><br>
			<label> Cheese
				<input type="checkbox" name="toppings" value="cheese">
			</label><br>
		</div>
		<div>
			<label for="address">Delivery Address</label>
			<input type="text" id="address" name="address">
		</div>

		<input type="submit" name="submit">
	</form>
</body>
</html>
