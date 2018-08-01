<!--<div class="pull-right">
	<a href="<?php echo site_url('sys_admin_menu/add'); ?>" class="btn btn-success">Add</a> 
</div>

<table class="table table-striped table-condensed table-hover" style="font-size:12px">
<thead class="bg-primary">
    <tr>
		<th>Id Menu</th>
		<th>Menu Label</th>
		<th>Is Grp Hdr</th>
		<th>Parent Id</th>
		<th>Is Active</th>
		<th>Sort Order</th>
		<th>Link Menu</th>
		<th>Actions</th>
    </tr>
    </thead>
	<?php foreach($sys_admin_menu as $s){ ?>
    <tbody>
    <tr>
		<td><?php echo $s['id_menu']; ?></td>
		<td><?php echo $s['menu_label']; ?></td>
		<td><?php echo $s['is_grp_hdr']; ?></td>
		<td><?php echo $s['parent_id']; ?></td>
		<td><?php echo $s['is_active']; ?></td>
		<td><?php echo $s['sort_order']; ?></td>
		<td><?php echo $s['link_menu']; ?></td>
		<td>
            <a href="<?php echo site_url('sys_admin_menu/edit/'.$s['id_menu']); ?>" class="btn btn-info btn-xs">Edit</a> 
            <a href="<?php echo site_url('sys_admin_menu/remove/'.$s['id_menu']); ?>" class="btn btn-danger btn-xs">Delete</a>
        </td>
    </tr>
    </tbody>
	<?php } ?>
</table>

-->