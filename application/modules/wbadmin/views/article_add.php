<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
<script src="<?php echo base_url()?>assets/js/moment.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>

<script>

function submitFile(){
   $('#loadingmessage').show();
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		//var data = CKEDITOR.instances.editor1.getData();
        var formUrl = "<?php echo base_url() ?>wbadmin/article_manag/save_article";
        var formData = new FormData($('.frm_article')[0]);

        $.ajax({
                url: formUrl,
                type: 'POST',
                data: formData,
                mimeType: "multipart/form-data",
                contentType: false,
                cache: false,
                processData: false,
                success: function(data, textSatus, jqXHR){
                  alert(data);
                  $('#loadingmessage').hide();
                  $('#btn_save').attr("disabled", true);
					//alert(data);
                   // window.location.href = '<?php echo base_url() ?>wbadmin/article_manag/add_article';
                        //now get here response returned by PHP in JSON fomat you can parse it using JSON.parse(data)
                },
                error: function(jqXHR, textStatus, errorThrown){
					alert(errorThrown);
                        //handle here error returned
                }
        });
}

$( document ).ready(function() {
$('#submit').submit(function(e){
   
    e.preventDefault(); 
         $.ajax({
             url:"<?php echo base_url() ?>wbadmin/article_manag/save_article",
             type:"post",
             data:new FormData(this),
             processData:false,
             contentType:false,
             cache:false,
             async:false,
              success: function(data){
                  alert(data);
           }
         });
    });  
});

function add_new(){
  window.location.href = '<?php echo base_url() ?>wbadmin/article_manag/add_article';
}

function close_ui(){
  window.location.href = '<?php echo base_url() ?>wbadmin/article_manag/load_article';
}

</script>


<div id="loadingmessage" style="display:none; position:fixed;top: 50%;left: 50%; transform: translate(-50%, -50%);">
    <img src="<?php echo base_url()?>assets/images/loader/loading_img.gif"/>
</div>	
<!-- Modal -->
			<form id="frm_article" class="frm_article" name="frm_article" action="" method="post" enctype="multipart/form-data">
                 <input type="hidden" id="tmpck" > 
                <div class="form-group-sm">
                    <label for="menutext">Create this article on Section:</label>
                        <?php 
                        $attributes = 'class="form-control" style="width:200px" id="section"';
                        echo form_dropdown('section', $list_section, set_value('section'), $attributes); 
                        ?>
                </div>
                  <div class="form-group-sm">
                       <label for="menutext">Title:</label>
                        <input type="text" class="form-control" maxlength="150" style="width:60%" id="title" name="title">
                  </div>
                  <div class="form-group-sm">
                       <label for="menutext">Short Description:</label>
                        <input type="text" class="form-control" maxlength="255" style="width:60%" id="short_desc" name="short_desc">
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
                    <img id="blah1" alt="your image" width="100" height="100" />
                    <input class="form-control" style="width:60%" type="file" onchange="document.getElementById('blah1').src = window.URL.createObjectURL(this.files[0])" name="gambar" id="gambar" />
                </div>
                    <!--<div class="form-group">
                    <label for="menutext">Publish this article From:</label>
                       <div class='input-group date' id='dtfrom' style="width:20%">
                            <input type='text' class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="menutext">Stop publish this article on:</label>
                       <div class='input-group date' id='dtuntil' style="width:20%">
                            <input type='text' class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
            <script type="text/javascript">
                $(function () {
                    $('#dtfrom').datetimepicker({
						widgetPositioning:{
							vertical: 'top'
						}
					});
                    $('#dtuntil').datetimepicker({
                        useCurrent: false,//Important! See issue #1075
						widgetPositioning:{
							vertical: 'top'
						}
                    });
                    $("#dtfrom").on("dp.change", function (e) {
                        $('#dtuntil').data("DateTimePicker").minDate(e.date);
                    });
                    $("#dtuntil").on("dp.change", function (e) {
                        $('#dtfrom').data("DateTimePicker").maxDate(e.date);
                    });
                });
            </script>-->    
            <?php echo form_close(); ?>
            <script>
                CKEDITOR.replace( 'editor1', {
                    extraPlugins: 'uploadimage',
                    height: 200,
                    width : '100%',
            
                    // Configure your file manager integration. This example uses CKFinder 3 for PHP.
                    filebrowserBrowseUrl: '<?php echo base_url()?>assets/images/upload/',
                    filebrowserImageBrowseUrl:  '<?php echo base_url()?>assets/images/upload/',
                    
                    filebrowserUploadUrl: '<?php echo base_url()?>wbadmin/do_upload',
                    //filebrowserImageUploadUrl: '../uploads/bookcase8.png',
                    //image_alignClasses: [ 'image-align-left', 'image-align-center', 'image-align-right' ],
                    //image_disableResizer: false
                    
                } );
                
                //config.plugins = 'dialogui,dialog,about,a11yhelp,basicstyles,blockquote,clipboard,panel,floatpanel,menu,contextmenu,resize,button,toolbar,elementspath,enterkey,entities,popup,filebrowser,floatingspace,listblock,richcombo,format,horizontalrule,htmlwriter,wysiwygarea,image,indent,indentlist,fakeobjects,link,list,magicline,maximize,pastetext,pastefromword,removeformat,showborders,sourcearea,specialchar,menubutton,scayt,stylescombo,tab,table,tabletools,undo,wsc,lineutils,widgetselection,widget,filetools,notification,notificationaggregator,uploadwidget,uploadimage,uploadfile,uploadcare';
            </script>
               
			  
			<!--modal content end here-->
                    <div class="modal-footer" style="text-align:left">
                    <!--<input type="submit" value="Submit">-->
                   <button type="button" id="btn_save" onclick="submitFile()"  class="btn btn-danger">Save it</button>
                      <button type="button" id="btn_close" onclick="close_ui()" class="btn btn-primary" data-dismiss="modal">Close</button>
                      <button type="button" id="btn_new" onclick="add_new()" class="btn btn-primary" data-dismiss="modal">Add New</button>
                    </div>
                    </div>
</form>  
  <!-- Modal -->