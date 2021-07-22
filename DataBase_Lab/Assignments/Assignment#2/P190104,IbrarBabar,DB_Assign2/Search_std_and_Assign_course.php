<html>
<head>

    <title>Student Information</title>
    <style type="text/css">
#side_bar{
background-color: whitesmoke;
padding: 50px;
width: 150px;
height: 150px;
}
</style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<?php if (isset($_POST['roll_no'])) {

    $username = 'root';
    $password = '';
    // Check connection
    try {
        $conn = new PDO("mysql:host=localhost;dbname=university", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Connected successfully";
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }
    
    $roll_no = $_POST["roll_no"];

    // where user id = 1301 OR 1=1

    $query_1 = $conn->prepare("select * from student where roll_no = ?");
    $query_1->execute([$roll_no]);
    $result = $query_1->fetchAll(PDO::FETCH_ASSOC);

   // $query_1 = $conn->prepare("select * from study where roll_no = ?");
    //$query_1->execute([$roll_no]);
    //$result = $query_1->fetchAll(PDO::FETCH_ASSOC);
    
 //    die;
    ?>
    <h2>Searched Student <?php echo "Information"; ?></h2>
    <table class="table">
        <thead>
        <tr>
            <th>Roll NO</th>
            <th>Student Name</th>
            <th>Father Name</th>
            <th>Gender</th>
            <th>Contact</th>
            <th>Address</th>
        </tr>
        </thead>

        <tbody>
        <?php
        foreach ($result as $key=>$value){
            echo '<tr>
               <td>'.$value["roll_no"].'</td>
               <td>'.$value["st_name"].'</td>
               <td>'.$value["f_name"].'</td>
               <td>'.$value["gender"].'</td>
               <td>'.$value["contact"].'</td>
               <td>'.$value["address"].'</td>
            </tr>';
        }

        ?>
        

        </tbody>
    </table>
   
    <?php
                $roll_no = $_POST["roll_no"];
                $query_1 = $conn->prepare("select * from study where roll_no = ?");
                $query_1->execute([$roll_no]);
                $result = $query_1->fetchAll(PDO::FETCH_ASSOC);
        ?>
        <h2>Registered Courses</h2>
        <table class="table">
        <thead>
        <tr>
            <th>Roll NO</th>
            <th>Course Code</th>
        </tr>
        </thead>
        
        <tbody>
        <?php
        foreach ($result as $key=>$value){
            echo '<tr>
               <td>'.$value["roll_no"].'</td>
               <td>'.$value["course_code"].'</td>
            </tr>';
        }
        ?>
        </tbody>
    </table>
    <?php
                $roll_no = $_POST["roll_no"];
                $query_1 = $conn->prepare("select * from courses join study 
                using (course_code) join student using (roll_no) where roll_no != ?");
                $query_1->execute([$roll_no]);
                $result = $query_1->fetchAll(PDO::FETCH_ASSOC);
        ?>
        <h2>Available Courses</h2>
        <table class="table">
        <thead>
        <tr>
            <th>Course Code</th>
            <th>Credit Hour</th>
            <th>Course Name</th>
        </tr>
        </thead>
        
        <tbody>
        <?php 
        foreach ($result as $key=>$value){
            echo '<tr>
               <td>'.$value["course_code"].'</td>
               <td>'.$value["credit_hour"].'</td>
               <td>'.$value["course_name"].'</td>
               <td>
               <a href="Assign2.php" class="btn btn-primary" role="button">Register</a>  
               </td>
               </tr>';
        }
        ?>
        </tbody>
    </table>
    
    
  
    <?php
}
else {
    ?>
<div class="row">
<div class="col-md-4" id="side_bar">
<ul>
    <h2>Search Student.</h2>
    <form action="abc.php" method="POST">
        Roll NO:
        <input type="text" name="roll_no">
        <button>Search</button>
    </form>
</ul>
</div>
</div>
    

    <?php
}
?>
</body>
</html>
