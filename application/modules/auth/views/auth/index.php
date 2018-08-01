<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">

<h4><?php echo lang('index_heading');?></h4>
<p><?php echo lang('index_subheading');


//echo "saya adalah ". $this->session->userdata('user_id');
?></p>

<div id="infoMessage"><?php echo $message;?></div>

<table class="table table-bordered table-condensed" style="width: 60%" >
	<tr>
		<th><?php echo lang('index_fname_th');?></th>
		<th><?php echo lang('index_lname_th');?></th>
		<th><?php echo lang('index_email_th');?></th>
		<th><?php echo lang('index_groups_th');?></th>
		<th><?php echo lang('index_status_th');?></th>
		<th><?php echo lang('index_action_th');?></th>
	</tr>
	<?php foreach ($users as $user):?>
		<tr>
            <td><?php echo htmlspecialchars($user->first_name,ENT_QUOTES,'UTF-8');?></td>
            <td><?php echo htmlspecialchars($user->last_name,ENT_QUOTES,'UTF-8');?></td>
            <td><?php echo htmlspecialchars($user->email,ENT_QUOTES,'UTF-8');?></td>
			<td>
				<?php foreach ($user->groups as $group):?>
					<?php echo anchor("auth/auth/edit_group/".$group->id, htmlspecialchars($group->name,ENT_QUOTES,'UTF-8')) ;?>
                <?php endforeach?>
			</td>
			<td><?php echo ($user->active) ? anchor("auth/auth/deactivate/".$user->id, lang('index_active_link')) : anchor("auth/auth/activate/". $user->id, lang('index_inactive_link'));?></td>
			<td><?php echo anchor("auth/auth/edit_user/".$user->id, 'Edit') ;?></td>
		</tr>
	<?php endforeach;?>
</table>

<p>
<?php echo anchor('auth/create_user', lang('index_create_user_link'), 'class="btn btn-success btn-xs"')?>  
<?php echo anchor('auth/create_group', lang('index_create_group_link'),'class="btn btn-danger btn-xs"')?>
</p>