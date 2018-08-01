<link rel='stylesheet prefetch' href='<?php echo base_url()?>assets/css/bootstrap.form.css'>
<h3><?php echo lang('create_group_heading');?></h3>
<p><?php echo lang('create_group_subheading');?></p>

<div id="infoMessage"><?php echo $message;?></div>

<?php echo form_open("auth/create_group");?>

      <p>
            <?php echo lang('create_group_name_label', 'group_name');?> <br />
            <?php echo form_input($group_name , '', 'class="form-control"');?>
      </p>

      <p>
            <?php echo lang('create_group_desc_label', 'description');?> <br />
            <?php echo form_input($description , '', 'class="form-control"');?>
      </p>

      <p><?php echo form_submit('submit', lang('create_group_submit_btn'), 'class="btn btn-sm btn-success"');?></p>

<?php echo form_close();?>