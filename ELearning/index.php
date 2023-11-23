<?php
include('./dbConnection.php');
// Header Include from mainInclude 
include('./mainInclude/header.php');
?>
<!-- Start Video Background-->
<div class="container-fluid remove-vid-marg">
  <div class="vid-parent">
    <video playsinline autoplay muted loop>
      <source src="" />
    </video>
    <div class="vid-overlay" style="background-image: url('./image/banner2.jpg'); 
  background-size: cover;"></div>
  </div>
  <div class="vid-content">
    <h1 class="my-content">Welcome to Brighter Education Centre</h1>
    <small class="my-content">Uplifting the Education Standards</small><br />
    <?php
    if (!isset($_SESSION['is_login'])) {
      echo '<a class="btn btn-danger mt-3" href="#" data-toggle="modal" data-target="#stuRegModalCenter">Get Started</a>';
    } else {
      echo '<a class="btn btn-primary mt-3" href="student/studentProfile.php">My Profile</a>';
    }
    ?>

  </div>
</div> <!-- End Video Background -->

<div class="container-fluid bg-danger txt-banner"> <!-- Start Text Banner -->
  <div class="row bottom-banner">
    <div class="col-sm">
      <h5> <i class="fas fa-book-open mr-3"></i> 100+ Online Subjects</h5>
    </div>
    <div class="col-sm">
      <h5><i class="fas fa-users mr-3"></i> Expert Instructors</h5>
    </div>
    <div class="col-sm">
      <h5><i class="fas fa-keyboard mr-3"></i> Lifetime Access</h5>
    </div>
    <div class="col-sm">

    </div>
  </div> <!-- End Text Banner -->

  <div class="container mt-5"> <!-- Start Most Popular Course -->

  </div> <!-- End Most Popular Course 2nd Card Deck -->
  <div class="text-center m-2">
    <a class="btn btn-danger btn-sm" href="courses.php">View All Subjects</a>
  </div>
</div> <!-- End Most Popular Course -->

<?php
// Contact Us
include('./contact.php');
?>

<!-- Start Students Testimonial -->

</div> <!-- End Students Testimonial -->

<div class="container-fluid bg-danger"> <!-- Start Social Follow -->
  <div class="row text-white text-center p-1">
    <div class="col-sm">
      <a class="text-white social-hover" href="#"><i class="fab fa-facebook-f"></i> Facebook</a>
    </div>
    <div class="col-sm">
      <a class="text-white social-hover" href="#"><i class="fab fa-twitter"></i> Twitter</a>
    </div>
    <div class="col-sm">
      <a class="text-white social-hover" href="#"><i class="fab fa-whatsapp"></i> WhatsApp</a>
    </div>
    <div class="col-sm">
      <a class="text-white social-hover" href="#"><i class="fab fa-instagram"></i> Instagram</a>
    </div>
  </div>
</div> <!-- End Social Follow -->

<!-- Start About Section -->
<div class="container-fluid p-4" style="background-color:#E9ECEF">
  <div class="container" style="background-color:#E9ECEF">
    <div class="row text-center">
      <div class="col-sm">
        <h5>About Us</h5>
        <p> provides universal access to the world’s best education, partnering with top universities and organizations to offer courses online.</p>
      </div>
      <div class="col-sm">
        <h5>Category</h5>
        <a class="text-dark" href="#">Arts</a><br />
        <a class="text-dark" href="#">Sciences</a><br />
        <a class="text-dark" href="#">Computer Studies</a><br />

      </div>
      <div class="col-sm">

      </div>
    </div>
  </div> <!-- End About Section -->

  <?php
  // Footer Include from mainInclude 
  include('./mainInclude/footer.php');

  ?>