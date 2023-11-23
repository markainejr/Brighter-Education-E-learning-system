<?php
if(!isset($_SESSION)){ 
  session_start(); 
}
define('TITLE', 'Dashboard');
define('PAGE', 'dashboard');
include('./adminInclude/header.php'); 
include('../dbConnection.php');

 if(isset($_SESSION['is_admin_login'])){
  $adminEmail = $_SESSION['adminLogEmail'];
 } else {
  echo "<d> location.href='../index.php'; </script>";
 }
$sql = "SELECT * FROM course";
$result = $conn->query($sql);
$totalcourse = $result->num_rows;

 $sql = "SELECT * FROM student";
 $result = $conn->query($sql);
 $totalstu = $result->num_rows;

 $sql = "SELECT * FROM courseorder";
 $result = $conn->query($sql);
 $totalsold = $result->num_rows;
?>
  <div class="col-sm-9 mt-5">
    <div class="row mx-5 text-center">
      <div class="col-sm-4 mt-5">
        <div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
          <div class="card-header">Courses</div>
          <div class="card-body">
            <h4 class="card-title">
              <?php echo $totalcourse; ?>
            </h4>
            <a class="btn text-white" href="courses.php">View</a>
          </div>
        </div>
      </div>
      <div class="col-sm-4 mt-5">
        <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
          <div class="card-header">Students</div>
          <div class="card-body">
            <h4 class="card-title">
              <?php echo $totalstu; ?>
            </h4>
            <a class="btn text-white" href="students.php">View</a>
          </div>
        </div>
      </div>
      <div class="col-sm-4 mt-5">
        <div class="card text-white bg-info mb-3" style="max-width: 18rem;">
          <div class="card-header">Sold</div>
          <div class="card-body">
            <h4 class="card-title">
              <?php echo $totalsold; ?>
            </h4>
            <a class="btn text-white" href="sellreport.php">View</a>
          </div>
        </div>
      </div>
    </div>
    <div class="mx-5 mt-5 text-center">
      <!--Table-->
      <p class=" bg-dark text-white p-2">Course Ordered</p>
      <?php
      $sql = "SELECT * FROM courseorder";
      $result = $conn->query($sql);
      if($result->num_rows > 0){
  echo '<table class="table">
    <thead>
    <tr>
      <th scope="col">Order ID</th>
      <th scope="col">Course ID</th>
      <th scope="col">Student Email</th>
      <th scope="col">Order Date</th>
      <th scope="col">Amount</th>
      <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>';
    while($row = $result->fetch_assoc()){
    echo '<tr>';
      echo '<th scope="row">'.$row["order_id"].'</th>';
      echo '<td>'. $row["course_id"].'</td>';
      echo '<td>'.$row["stu_email"].'</td>';
      echo '<td>'.$row["order_date"].'</td>';
      echo '<td>'.$row["amount"].'</td>';
      echo '<td><form action="" method="POST" class="d-inline"><input type="hidden" name="id" value='. $row["co_id"] .'><button type="submit" class="btn btn-secondary" name="delete" value="Delete"><i class="far fa-trash-alt"></i></button></form></td>';
      echo '</tr>';
    }
  echo '</tbody>
  </table>';
  } else {
    echo "0 Result";
  }
  if(isset($_REQUEST['delete'])){
    $sql = "DELETE FROM courseorder WHERE co_id = {$_REQUEST['id']}";
    if($conn->query($sql) === TRUE){
      // echo "Record Deleted Successfully";
      // below code will refresh the page after deleting the record
      echo '<meta http-equiv="refresh" content= "0;URL=?deleted" />';
      } else {
        echo "Unable to Delete Data";
      }
   }
  ?>
    </div>
  </div>
  </div>
  </div>
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#paymentModal">
  Add Payment
</button>
<!-- Payment Modal -->
<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="paymentModalLabel">Capture Payment</h5>
        <
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Payment Form -->
        <form id="paymentForm" method="post" action="">
          <!-- <input type= -->
          <div class="form-group">
            <label for="order_date">Order Date:</label>
            <input type="date" class="form-control" id="order_date" name="order_date" required>
          </div>
          <div class="form-group">
            <label for="stu_email">Student Email:</label>
            <select class="form-control" id="stu_email" name="stu_email" required>
              <!-- Fetch student emails from the database and populate the options dynamically -->
              <?php
                $sql = "SELECT stu_email FROM student";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                  echo '<option value="' . $row["stu_email"] . '">' . $row["stu_email"] . '</option>';
                }
              ?>
            </select>
          </div>
          <div class="form-group">
            <label for="course_id">Course:</label>
            <select class="form-control" id="course_id" name="course_id" required>
              <!-- Fetch course IDs and names from the database and populate the options dynamically -->
              <?php
                $sql = "SELECT course_id, Course_name FROM course";
                $result = $conn->query($sql);
                while ($row = $result->fetch_assoc()) {
                  echo '<option value="' . $row["course_id"] . '">' . $row["course_id"] . ' - ' . $row["Course_name"] . '</option>';
                }
              ?>
            </select>
          </div>
          <div class="form-group">
            <label for="amount">Amount:</label>
            <input type="number" class="form-control" id="amount" name="amount" required>
          </div>
          <button type="submit" class="btn btn-primary">Capture Payment</button>
        </form>
      </div>
    </div>
  </div>
</div>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST"&& isset($_POST["stu_email"]) && isset($_POST["course_id"])) {
  $order_date = $_POST["order_date"];
  $stu_email = $_POST["stu_email"];
  $course_id = $_POST["course_id"];
  $amount = $_POST["amount"];
  $status = "TXN_SUCCESS";
  $respmsg = "Txn Success";

  // Get the maximum current order_id
  $maxOrderIdQuery = "SELECT MAX(order_id) AS max_order_id FROM courseorder";
  $result = $conn->query($maxOrderIdQuery);
  $row = $result->fetch_assoc();
  $maxOrderId = $row["max_order_id"];

  // Increment the order_id by one
  $nextOrderId = $maxOrderId + 1;

  // Insert data into courseorder table with the new order_id
  $sql = "INSERT INTO courseorder (order_id, order_date, stu_email, course_id, amount, status, respmsg) VALUES ('$nextOrderId', '$order_date', '$stu_email', '$course_id', '$amount', '$status', '$respmsg')";
  
  if ($conn->query($sql) === TRUE) {
    echo '<div class="alert alert-success col-sm-6 ml-5 mt-2" role="alert"> "Payment captured successfully!";</div>';
  } else {
    echo '<div class="alert alert-danger col-sm-6 ml-5 mt-2" role="alert">"Error capturing payment. Please try again.";</div>';
  }
}
?>

  </div>  <!-- div Row close from header -->
 </div>  <!-- div Conatiner-fluid close from header -->
<?php
include('./adminInclude/footer.php'); 
?>