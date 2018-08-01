<link rel='stylesheet prefetch' href='<?php echo base_url()?>assets/css/bootstrap.form.css'>
<div class="container">
<h3><?php echo lang('edit_user_heading');?></h3>
<p><?php echo lang('edit_user_subheading');?></p>

<div id="infoMessage"><?php echo $message;?></div>
<?php echo uri_string() ?>
<?php echo form_open(uri_string());?>

      <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('edit_user_fname_label', 'first_name');?> <br />
            <?php echo form_input($first_name, '', 'class="form-control"');?>
        </div>
      </div>  

      <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('edit_user_lname_label', 'last_name');?> <br />
            <?php echo form_input($last_name, '', 'class="form-control"');?>
          </div>
      </div>   

      <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('edit_user_company_label', 'company');?> <br />
            <?php echo form_input($company, '', 'class="form-control"');?>
          </div>
      </div>    

      <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('edit_user_phone_label', 'phone');?> <br />
            <?php echo form_input($phone, '', 'class="form-control"');?>
          </div>
      </div>    

      <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('edit_user_password_label', 'password');?> <br />
            <?php echo form_input($password, '', 'class="form-control"');?>
          </div>
      </div>    

      <div class="row">
         <div class="form-group col-xs-5 col-lg-1">
            <?php echo lang('edit_user_password_confirm_label', 'password_confirm');?><br />
            <?php echo form_input($password_confirm, '', 'class="form-control"');?>
          </div>
      </div>    
            <div class="row">
              <div class="form-group col-xs-5 col-lg-1">
      <?php if ($this->ion_auth->is_admin()): ?>

          <h4><?php echo lang('edit_user_groups_heading');?></h4>
          <?php foreach ($groups as $group):?>

              <label class="checkbox">
              <?php
                  $gID=$group['id'];
                  $checked = null;
                  $item = null;
                  foreach($currentGroups as $grp) {
                      if ($gID == $grp->id) {
                          $checked= ' checked="checked"';
                      break;
                      }
                  }
              ?>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"  name="groups[]" value="<?php echo $group['id'];?>"<?php echo $checked;?>>
              <?php echo htmlspecialchars($group['name'],ENT_QUOTES,'UTF-8');?>
              </label>
          <?php endforeach?>
      <?php endif ?>
              </div> 
            </div>  

      <?php echo form_hidden('id', $user->id);?>
      <?php echo form_hidden($csrf); ?>

      <p><?php echo form_submit('submit', lang('edit_user_submit_btn'), 'class="btn btn-sm btn-success"');?></p>

<?php echo form_close();?>
</div>