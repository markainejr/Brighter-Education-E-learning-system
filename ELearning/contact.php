<?php
include('./dbConnection.php');

// Initialize variables
$name = $subject = $email = $message = '';
$successMessage = $errorMessage = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect form data
    $name = isset($_POST["name"]) ? $_POST["name"] : "";
    $subject = isset($_POST["subject"]) ? $_POST["subject"] : "";
    $email = isset($_POST["email"]) ? $_POST["email"] : "";
    $message = isset($_POST["message"]) ? $_POST["message"] : "";

    // Check if 'name', 'email', and 'message' are not empty
    if (empty($name) || empty($email) || empty($message)) {
        $errorMessage = "Name, Email, and Message fields cannot be empty!";
    } else {
        // Your database connection parameters
        // $servername = "your_servername";
        // $username = "your_username";
        // $password = "your_password";
        // $dbname = "your_database";

        // Create connection
        // $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // SQL to insert data into the 'contact_us' table
        $sql = "INSERT INTO contact_us (name, subjects, e_mail, feedback) VALUES ('$name', '$subject', '$email', '$message')";

        // Execute the query
        if ($conn->query($sql) === TRUE) {
            $successMessage = "Your message has been sent successfully!";
            // Reset form values
            $name = $subject = $email = $message = '';
        } else {
            $errorMessage = "Error sending message. Please try again later.";
        }

        // Close the database connection
        $conn->close();
    }
}
?>
<!--Start Contact Us-->
<!-- Your HTML form -->
<div class="container mt-4" id="Contact">
    <!--Start Contact Us Container-->
    <h2 class="text-center mb-4">Contact US</h2> <!-- Contact Us Heading -->
    <?php
    if (!empty($successMessage)) {
        echo '<div class="alert alert-success" role="alert">' . $successMessage . '</div>';
    }
    if (!empty($errorMessage)) {
        echo '<div class="alert alert-danger" role="alert">' . $errorMessage . '</div>';
    }
    ?>
    <div class="row"> <!--Start Contact Us Row-->
        <div class="col-md-8"> <!--Start Contact Us 1st Column-->
            <form action="" method="POST">
                <input type="text" class="form-control" name="name" placeholder="Name" value="<?php echo $name; ?>"><br>
                <input type="text" class="form-control" name="subject" placeholder="Subject" value="<?php echo $subject; ?>"><br>
                <input type="email" class="form-control" name="email" placeholder="E-mail" value="<?php echo $email; ?>"><br>
                <textarea class="form-control" name="message" placeholder="How can we help you?" style="height:150px;"><?php echo $message; ?></textarea><br>
                <input class="btn btn-primary" type="submit" value="Send" name="submit"><br><br>
            </form>
        </div> <!-- End Contact Us 1st Column-->

        <div class="col-md-4 stripe text-white text-center"> <!-- Start Contact Us 2nd Column-->
            <h4>Brighter Education</h4>
            <p>Brighter, info: 038-387-2833 <br /> www.Brightereduc.com </p>
        </div> <!-- End Contact Us 2nd Column-->
    </div> <!-- End Contact Us Row-->
</div> <!-- End Contact Us Container-->
<!-- End Contact Us -->
