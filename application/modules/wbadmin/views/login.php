<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>::Login Form::</title>
  <link rel='stylesheet prefetch' href='<?php echo base_url()?>assets/css/bootstrap.min.css'>
  <link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.css">
  
</head>

<body>
    <div class="wrapper">
  <?php 
  $attributes = array("class" => "form-signin", "id" => "loginform", "name" => "loginform");
  echo form_open("wbadmin/log_on", $attributes);?>
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control" name="username"  placeholder="Email Address" required="" autofocus="" />
      <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
      </label>
      <button class="btn btn-lg btn-primary btn-block" name="btnlogin" type="submit">Login</button>   
  <?php echo form_close(); ?>
  <?php 
  	if(isset($_POST['btnlogin'])){
		echo $this->session->flashdata('msg');
	}
	?>
  </div>
  
  
</body>
</html>
