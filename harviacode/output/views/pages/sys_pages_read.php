<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            body{
                padding: 15px;
            }
        </style>
    </head>
    <body>
        <h2 style="margin-top:0px">Sys_pages Read</h2>
        <table class="table">
	    <tr><td>Page Name</td><td><?php echo $page_name; ?></td></tr>
	    <tr><td>Section Name</td><td><?php echo $section_name; ?></td></tr>
	    <tr><td>Is Main Page</td><td><?php echo $is_main_page; ?></td></tr>
	    <tr><td>Sort Order</td><td><?php echo $sort_order; ?></td></tr>
	    <tr><td>Article Id</td><td><?php echo $article_id; ?></td></tr>
	    <tr><td></td><td><a href="<?php echo site_url('pages') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </body>
</html>