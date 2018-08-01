<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/jquery-confirm.css" rel="stylesheet" type="text/css">

<script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
<script src="<?php echo base_url()?>assets/js/moment.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery-confirm.js"></script>

<script>
function close_edit(){
    window.location.href ='<?php echo base_url() ?>wbadmin/Article_manag/load_article';
}

function submitFile(){
      $('#loadingmessage').show();
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		//var data = CKEDITOR.instances.editor1.getData();
        var formUrl = "<?php echo base_url() ?>wbadmin/article_manag/update_article";
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
                     $('#loadingmessage').hide();
					alert(data);
                        //now get here response returned by PHP in JSON fomat you can parse it using JSON.parse(data)
                },
                error: function(jqXHR, textStatus, errorThrown){
					alert(errorThrown);
                        //handle here error returned
                }
        });
}


function del_image(id){
$.confirm({
    title: 'Delete Confirmation!',
    content: 'Are you sure want to delete image of this article',
    buttons: {
        confirm: function () {
            return $.ajax({
            url: '<?php echo base_url()?>wbadmin/article_manag/del_img_artilce/'+id,
            method: 'post',
            data: { 
                'img_folder':$('#imgfname').val()
            },
                }).done(function (response) {
                     $.alert({
                        title: 'Info',
                        content: response,
                    });                   
                   //alert(response);
                   $("#img_container").html('Image has been deleted');
               }).fail(function(){
                self.setContent('Delete Failed.');
            });

        },
        cancel: function () {
           // $.alert('Canceled!');
        }/*,
        somethingElse: {
            text: 'Something else',
            btnClass: 'btn-blue',
            keys: ['enter', 'shift'],
            action: function(){
                $.alert('Something else?');
            }
        }*/
    }
});    
}

                            
</script>

<div id="loadingmessage" style="display:none; position:fixed;top: 50%;left: 50%; transform: translate(-50%, -50%);">
    <img src="<?php echo base_url()?>assets/images/loader/loading_img.gif"/>
</div	
<!-- Modal -->
            <?php 
            $button ='';
             $img ='File Not available';
             $folder_name = strtolower(get_foldername_by_section_id($data_article->fe_section_name));
             $img_fname = base_url().'assets/images/upload/'.$folder_name.'/'.$data_article->fe_img_files;
            if($data_article->fe_img_files!=''){
                $img = '<img style="width:100px" src="'.$img_fname.'" class="img-thumbnail" alt="'.$data_article->fe_img_files.'">';
                $button ='<button type="button" onclick="del_image('."'".$data_article->fe_content_id."'".')" id="btn_del"  class="btn btn-xs btn-danger">Delete Image</button>';
            }

            ?>
			<form id="frm_article" class="frm_article" name="frm_article" action="" method="post" enctype="multipart/form-data">
                 <input type="hidden" id="tmpck" > 
                 <input type="hidden" id="imgfname" value="<?php echo 'assets/images/upload/'.$folder_name.'/'.$data_article->fe_img_files?>">
                 <input type="hidden" id="content_id" name="content_id" value="<?php echo $data_article->fe_content_id ?>" > 
                <div class="form-group-sm">
                    <label for="menutext">Create this article on Section:</label>
                        <?php 
                        $attributes = 'class="form-control" style="width:200px" id="section"';
                        echo form_dropdown('section', $list_section, $data_article->fe_section_name , $attributes); 
                        ?>
                </div>
                  <div class="form-group-sm">
                       <label for="menutext">Title:</label>
                        <input type="text" value="<?php echo $data_article->fe_content_title ?>" class="form-control" maxlength="75" style="width:60%" id="title" name="title">
                  </div>
                  <div class="form-group-sm">
                       <label for="menutext">Short Description:</label>
                        <input type="text" value="<?php echo $data_article->fe_content_short_desc ?>"  class="form-control" maxlength="75" style="width:60%" id="short_desc" name="short_desc">
                  </div>
                <div class="form-group-sm">
                    <label for="menutext">Content Detail:</label>
                    <textarea name="editor1" id="editor1" rows="10" cols="80">
                    <?php echo $data_article->fe_full_content ?>
                    </textarea>
                </div>
                  <div class="form-group-sm">
                       <label for="menutext">Label for Button:</label>
                        <input type="text" value="<?php echo $data_article->fe_content_btn_label ?>"  class="form-control" maxlength="75" style="width:30%" id="lblbutton" name="lblbutton">
                  </div>
                <div class="form-group-sm">
                    <label for="menutext">Image Article :</label>
                    <img id="blah1" alt="your image" width="100" height="100" />
                    <input class="form-control" style="width:60%" type="file" onchange="document.getElementById('blah1').src = window.URL.createObjectURL(this.files[0])" name="gambar" id="gambar" />
                    <div id="img_container">
                        <?php echo $img . $button ?> 
                    </div>
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
            </script> -->   
            <?php echo form_close(); ?>
            <script>
                CKEDITOR.replace( 'editor1', {
                    extraPlugins: 'uploadimage',
                    height: 200,
                    width : '100%',
            
                    // Configure your file manager integration. This example uses CKFinder 3 for PHP.
                    //filebrowserBrowseUrl: '../uploads/',
                    //filebrowserImageBrowseUrl: '../uploads/',
                    
                    filebrowserUploadUrl: '<?php echo base_url()?>wbadmin/do_upload',
                    //filebrowserImageUploadUrl: '../uploads/bookcase8.png',
                    //image_alignClasses: [ 'image-align-left', 'image-align-center', 'image-align-right' ],
                    //image_disableResizer: false
                    
                } );
                
                //config.plugins = 'dialogui,dialog,about,a11yhelp,basicstyles,blockquote,clipboard,panel,floatpanel,menu,contextmenu,resize,button,toolbar,elementspath,enterkey,entities,popup,filebrowser,floatingspace,listblock,richcombo,format,horizontalrule,htmlwriter,wysiwygarea,image,indent,indentlist,fakeobjects,link,list,magicline,maximize,pastetext,pastefromword,removeformat,showborders,sourcearea,specialchar,menubutton,scayt,stylescombo,tab,table,tabletools,undo,wsc,lineutils,widgetselection,widget,filetools,notification,notificationaggregator,uploadwidget,uploadimage,uploadfile,uploadcare';
            </script>
               
			</form>    
			<!--modal content end here-->
                    <div class="modal-footer" style="text-align:left">
                    <!--<input type="submit" value="Submit">-->
                   <button type="button" onclick="submitFile()"  class="btn btn-danger">Update</button>
                      <button type="button" onclick="close_edit()" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>

  <!-- Modal -->