  <link rel='stylesheet prefetch' href='<?php echo base_url()?>assets/css/bootstrap.min.css'>
  <link rel="stylesheet" href="<?php echo base_url()?>assets/css/style.css">

<div class="wrapper">
  <?php 
  $attributes = array("class" => "form-signin", "id" => "loginform", "name" => "loginform");
  echo form_open("auth/login", $attributes);?>
      <h2 class="form-signin-heading">
        <h1><?php echo lang('login_heading');?></h1>
        <p><?php echo lang('login_subheading');?></p>
        <div id="infoMessage">
        <?php
        if(isset($message)){
         echo $message;
       }

         ?></div>
      </h2>
        <?php echo lang('login_identity_label', 'identity');?>
        <?php echo form_input($identity, '','class="form-control"');?> 
        <?php echo lang('login_password_label', 'password');?>
        <?php echo form_input($password,'','class="form-control"');?>     
      
      <?php echo lang('login_remember_label', 'remember');?>
      <?php echo form_checkbox('remember', '1', FALSE, 'id="remember"');?>
      <div>
      <a href="forgot_password"><?php echo lang('login_forgot_password');?></a>
      </div>
      
      <?php echo form_submit('submit', lang('login_submit_btn'), 'class="btn btn-lg btn-primary btn-block"');?>   
  <?php echo form_close(); ?>

  </div>