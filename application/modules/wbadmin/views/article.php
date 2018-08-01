
<script src="<?php echo base_url()?>assets/js/moment.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>
<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<!--<link href="<?php echo base_url()?>assets/css/basic.min.css" rel="stylesheet">-->
<?php if(isset($error)){ 
		echo $error;
}?>
<?php echo form_open_multipart('upload/aksi_upload');?>
 
      <div class="form-group-sm">
           <label for="menutext">Title:</label>
            <input type="text" class="form-control" maxlength="75" style="width:60%" id="title" name="title">
      </div>
      <div class="form-group-sm">
           <label for="menutext">Short Description:</label>
            <input type="text" class="form-control" maxlength="75" style="width:60%" id="short_desc" name="short_desc">
      </div>
  	<div class="form-group-sm">
    	<label for="menutext">Content Detail:</label>
        <textarea name="editor1" id="editor1" rows="10" cols="80">
        </textarea>
    </div>
      <div class="form-group-sm">
           <label for="menutext">Label for Button:</label>
            <input type="text" class="form-control" maxlength="75" style="width:30%" id="lblbutton" name="lblbutton">
      </div>
  	<div class="form-group-sm">
    	<label for="menutext">Image Article :</label>
        <input class="form-control" style="width:600px" type="file" name="berkas" />
    </div>
    
  	<div class="form-group-sm">
        <label for="menutext">Set this page as:</label>
            <?php 
            $attributes = 'class="form-control" style="width:200px" id="section"';
            echo form_dropdown('section', $list_section, set_value('section'), $attributes); 
            ?>
    </div>
    
    <div class='col-md-3'>
        <div class="form-group">
     	<label for="menutext">Publish this article From:</label>
           <div class='input-group date' id='dtfrom'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
   <div class='col-md-3'>
        <div class="form-group">
      	<label for="menutext">Until:</label>
           <div class='input-group date' id='dtuntil'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>

<script type="text/javascript">
    $(function () {
        $('#dtfrom').datetimepicker();
        $('#dtuntil').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#dtfrom").on("dp.change", function (e) {
            $('#dtuntil').data("DateTimePicker").minDate(e.date);
        });
        $("#dtuntil").on("dp.change", function (e) {
            $('#dtfrom').data("DateTimePicker").maxDate(e.date);
        });
    });
</script>    
<?php echo form_close(); ?>
<script>
	CKEDITOR.replace( 'editor1', {
		extraPlugins: 'uploadimage',
		height: 200,
		width : 600,

		// Configure your file manager integration. This example uses CKFinder 3 for PHP.
		//filebrowserBrowseUrl: '../uploads/',
		//filebrowserImageBrowseUrl: '../uploads/',
		
		filebrowserUploadUrl: 'do_upload',
		//filebrowserImageUploadUrl: '../uploads/bookcase8.png',
		//image_alignClasses: [ 'image-align-left', 'image-align-center', 'image-align-right' ],
		//image_disableResizer: false
		
	} );
	
	//config.plugins = 'dialogui,dialog,about,a11yhelp,basicstyles,blockquote,clipboard,panel,floatpanel,menu,contextmenu,resize,button,toolbar,elementspath,enterkey,entities,popup,filebrowser,floatingspace,listblock,richcombo,format,horizontalrule,htmlwriter,wysiwygarea,image,indent,indentlist,fakeobjects,link,list,magicline,maximize,pastetext,pastefromword,removeformat,showborders,sourcearea,specialchar,menubutton,scayt,stylescombo,tab,table,tabletools,undo,wsc,lineutils,widgetselection,widget,filetools,notification,notificationaggregator,uploadwidget,uploadimage,uploadfile,uploadcare';
</script>

