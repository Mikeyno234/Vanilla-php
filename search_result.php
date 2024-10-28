

<!DOCTYPE html>
<html lang="en">
<?php
session_start();
include('admin/db_connect.php');
ob_start();
$query = $conn->query("SELECT * FROM system_settings limit 1")->fetch_array();
foreach ($query as $key => $value) {
    if (!is_numeric($key))
        $_SESSION['system'][$key] = $value;
}
ob_end_flush();
include('header.php');

$bukus = [];

if (isset($_POST["cari"])) {
    $bukus = cari($_POST["keyword"], $conn);
} else {
    $result = mysqli_query($conn, 'SELECT * FROM books');

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $bukus[] = $row;
        }
    }
}

function cari($keyword, $conn){
    $keyword = mysqli_real_escape_string($conn, $keyword);
    $query = "SELECT * FROM books 
              WHERE title  LIKE '%$keyword%' 
              OR author LIKE '%$keyword%'
              OR price LIKE '%$keyword%'
              OR image_path LIKE '%$keyword%'
              ";


    $result = mysqli_query($conn, $query);

    $results = [];
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $results[] = $row;
        }
    }
    return $results;
}
?>



<style>
  #main-field{
    margin-top: 5rem!important;
  }
  .cart-img {
      width: calc(20%);
      height: 13vh;
      padding: 3px
  }
  .cart-img img{
    width: 100%;
    height: 100%;
  }
  .cart-qty {
    font-size: 14px
  }
  .dropdown-search-results {
      position: absolute;
      top: 70px;
      width: 100%;
      z-index: 1000;
      background-color: white;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      display: none;
  }
  .dropdown-search-results li {
      padding: 10px;
      cursor: pointer;
  }
  .dropdown-search-results li:hover {
      background-color: #f1f1f1;
  }
</style>
<body id="page-top">
    
    <div class="toast" id="alert_toast" role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-body text-white">
    </div>
  </div>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="./"><?php echo $_SESSION['system']['name'] ?></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto my-2 my-lg-0">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.php?page=home">Home</a></li>
                    <?php if(isset($_SESSION['login_id'])): ?>
                    <li class="nav-item dropdown">
                      <a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="true">
                        <div class="badge badge-danger cart-count">0</div>
                        <i class="fa fa-shopping-cart"></i>
                        <span>Cart</span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="width:25vw">
                        <div class="cart-list w-100" id="cart_product"></div>
                        <div class="d-flex bg-light justify-content-center w-100 p-2">
                            <a href="index.php?page=cart" class="btn btn-sm btn-primary btn-block col-sm-4 text-white"><i class="fa fa-edit"></i>  View Cart</a>
                        </div>
                      </div>
                      </li>
                  <?php endif; ?>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="index.php?page=about">About</a></li>
                    <?php if(isset($_SESSION['login_id'])): ?>
                        <?php endif; ?>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="search_result.php">Search</a></li>
                    <?php if(isset($_SESSION['login_id'])): ?>
                   <div class=" dropdown mr-4">
                        <a href="#" class="text-white dropdown-toggle"  id="account_settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo $_SESSION['login_name'] ?> </a>
                          <div class="dropdown-menu" aria-labelledby="account_settings" style="left: -2.5em;">
                            <a class="dropdown-item" href="javascript:void(0)" id="manage_my_account"><i class="fa fa-cog"></i> Manage Account</a>
                            <a class="dropdown-item" href="admin/ajax.php?action=logout2"><i class="fa fa-power-off"></i> Logout</a>
                          </div>
                    </div>
                  <?php else: ?>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="javascript:void(0)" id="login_now">Login</a></li>
                  <?php endif; ?>
                </ul>

               

            </div>
        </div>
    </nav>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="container">
     
      <br>
      <form action="" method="post">
          <input type="text" name="keyword" size="50" class="form-control" autofocus placeholder="Masukkan input pencarian" autocomplete="off" id="keyword">
          <br>
          <button type="submit" name="cari" class="btn btn-dark fs-5" id="tombol-cari">Cari</button>
      </form>
      <br>
      <table class="table">
        <thead>
          <tr>
            <th scope="col">No</th>
            <th scope="col">Title</th>
            <th scope="col">Author</th>
            <th scope="col">Price</th>
          </tr>
        </thead>
        <tbody>
          <?php $no = 1; foreach ($bukus as $buku) { ?>
            <tr>
              <th scope="row"><?php echo $no++; ?></th>
              <td><?php echo htmlspecialchars($buku['title']); ?></td>
              <td><?php echo htmlspecialchars($buku['author']); ?></td>
              <td>Rp <?php echo htmlspecialchars(number_format($buku['price'], 0, ',', '.')); ?></td>
            </tr>
          <?php } ?>
        
        </tbody>
      </table>
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
    <footer class=" py-5 bg-dark">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 text-center">
                            <h2 class="mt-0 text-white">Contact us</h2>
                            <hr class="divider my-4" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                            <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                            <div class="text-white"><?php echo $_SESSION['system']['contact'] ?></div>
                        </div>
                        <div class="col-lg-4 mr-auto text-center">
                            <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                            <a class="d-block" href="mailto:<?php echo $_SESSION['system']['email'] ?>"><?php echo $_SESSION['system']['email'] ?></a>
                        </div>
                    </div>
                </div>
                <br>
                <div class="container"><div class="small text-center text-muted"><?php echo $_SESSION['system']['name'] ?></div></div>
            </footer>
            
        
       <?php include('footer.php') ?>

</body>
</html>


