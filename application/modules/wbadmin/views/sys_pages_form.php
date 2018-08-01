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
        <h2 style="margin-top:0px">Sys_pages <?php echo $button ?></h2>
        <form action="<?php echo $action; ?>" method="post">
	    <div class="form-group">
            <label for="varchar">Page Name <?php echo form_error('page_name') ?></label>
            <input type="text" class="form-control" name="page_name" id="page_name" placeholder="Page Name" value="<?php echo $page_name; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Section Name <?php echo form_error('section_name') ?></label>
            <input type="text" class="form-control" name="section_name" id="section_name" placeholder="Section Name" value="<?php echo $section_name; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Is Main Page <?php echo form_error('is_main_page') ?></label>
            <input type="text" class="form-control" name="is_main_page" id="is_main_page" placeholder="Is Main Page" value="<?php echo $is_main_page; ?>" />
        </div>
	    <div class="form-group">
            <label for="smallint">Sort Order <?php echo form_error('sort_order') ?></label>
            <input type="text" class="form-control" name="sort_order" id="sort_order" placeholder="Sort Order" value="<?php echo $sort_order; ?>" />
        </div>
	    <div class="form-group">
            <label for="varchar">Article Id <?php echo form_error('article_id') ?></label>
            <input type="text" class="form-control" name="article_id" id="article_id" placeholder="Article Id" value="<?php echo $article_id; ?>" />
        </div>
	    <input type="hidden" name="page_id" value="<?php echo $page_id; ?>" /> 
	    <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('pages') ?>" class="btn btn-default">Cancel</a>
	</form>
    </body>
</html>