<html>
<head>
 <title>Registration Form</title>
</head>
<body>
<?php if (isset($_GET['form_submitted'])){
//this code is executed when the form is submitted
?>
<h2>Thank You <?php echo "Course Registration from"; ?>
</h2>
<p>You have been registered as
 <?php echo "<br />"; ?>
 <?php echo "course_code : " . $_GET['course_code'];?>
 <?php echo "<br />"; ?>
 <?php echo "credit_hour : " . $_GET['credit_hour'];?>
 <?php echo "<br />"; ?>
 <?php echo "course_name : " . $_GET['course_name'];?>
 <?php
 $username = 'root';
 $password = '';
 try {
 $conn = new
PDO("mysql:host=localhost;dbname=university", $username,
$password);
// set the PDO error mode to exception
 $conn->setAttribute(PDO::ATTR_ERRMODE,
PDO::ERRMODE_EXCEPTION);
 echo "Connected successfully";
 } catch (PDOException $e) {
 echo "Connection failed: " . $e->getMessage();
 }
 $course_code = $_GET["course_code"];
 $credit_hour = $_GET["credit_hour"];
 $course_name = $_GET["course_name"];
 //$conn->query("insert into courses values('$course_code ',' $credit_hour ',' $course_name')");
 $conn->query("insert into courses values(' $course_code ',' $credit_hour ',' $course_name')");

 
?>
</p>
<p>Go <a href="/lab/assign2.php">back</a> to the
form</p>
<?php }
else { ?>
 <h2>Course Registration Form</h2>
 <form action="Assign2.php" method="GET">
 course_code:
 <input type="text" placeholder="course_code"
name="course_code">
<br> credit_hour:
 <input type="text" placeholder="credit_hour"
name="credit_hour">
 <br> course_name:
 <input type="text" placeholder="course_name"
name="course_name">

 <input type="hidden" name="form_submitted"
value="1" />
 <br>
 <input type="submit" value="Submit">
 </form>
<?php } ?>
</body>
</html>
