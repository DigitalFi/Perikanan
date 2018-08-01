<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<div class="container">
<h4><?php echo lang('create_user_heading');?></h4>
<p><?php echo lang('create_user_subheading');?></p>

<div id="infoMessage"><?php echo $message;?></div>

<?php echo form_open("auth/create_user");?>
       <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('create_user_fname_label', 'first_name');?> 
            <?php echo form_input($first_name, '', 'class="form-control"');?>
          </div>
        </div>

       <div class="row"> 
         <div class="form-group col-xs-5 col-lg-1">
              <?php echo lang('create_user_lname_label', 'last_name');?> 
              <?php echo form_input($last_name, '', 'class="form-control"');?>
         </div>
        </div> 
      
          <div class="row"> 
           <div class="form-group col-xs-5 col-lg-1">
              <?php
              if($identity_column!=='email') {
                  echo lang('create_user_identity_label', 'identity');
                  echo form_error('identity');
                  echo form_input($identity,'', 'class="form-control"');
              }
              ?>
            </div>
        </div> 

     <div class="row">
        <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('create_user_company_label', 'company');?> 
            <?php echo form_input($company, '', 'class="form-control"');?>
        </div>
      </div>

      <div class="row">
        <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('create_user_email_label', 'email');?> 
            <?php echo form_input($email, '', 'class="form-control"');?>
      </div>
      </div>

      <div class="row">
        <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('create_user_phone_label', 'phone');?> 
            <?php echo form_input($phone, '', 'class="form-control"');?>
      </div>
      </div>

      <div class="row">
        <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('create_user_password_label', 'password');?> 
            <?php echo form_input($password, '', 'class="form-control"');?>
      </div>
      </div>

      <div class="row">
        <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('create_user_password_confirm_label', 'password_confirm');?> 
            <?php echo form_input($password_confirm, '', 'class="form-control"');?>
        </div>
      </div>


      <p><?php echo form_submit('submit', lang('create_user_submit_btn'), 'class="btn btn-sm btn-success"');?></p>

<?php echo form_close();?>
</div>