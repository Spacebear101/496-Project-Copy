<html>
<link rel="stylesheet" href="css/SceneBuilder.css">
<script src="ScreenBuilder.js"></script>
<?php
	include 'Screen Builder Back End.php';
?>
	
<!--so need to make a call to the database, or file system to find out how many projects there are to generate...
how many bullet points are needed-->
	<body> 
		<div class="dropdown" id="dpDIV">
			<button class="dropbtn">Scenes</button>
			<div class="dropdown-content">
				<button class="dpDown" name="Save Scene">Save Scene</button><br>
				<button class="dpDown" name="Create New Scene">Create New Scene</button><br>
				<button class="dpDown" name="Delete Scene">Delete Scene</button><br>
				<button class="dpDown" name="Change Background">Change Background Image</button><br>
				<button class="dpDown" name="Text Options">Text Options</button>
			</div>
		</div>
		<div class="main" id="option">
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<form class="option">
				<input type="text" name="option one" placeholder="First Response" required ><br>
				<input type="text" name="option two" placeholder="Second Response" required><br>
				<input type="text" name="option three" placeholder="Third Response"><br>
				<input type="text" name="option four" placeholder="Fourth Response"><br>
			</form>
		</div>
	</body>
</html>