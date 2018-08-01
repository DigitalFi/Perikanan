<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
<script src="<?php echo base_url()?>assets/js/moment.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>

<script>
function close_edit(){
    window.location.href ='<?php echo base_url() ?>wbadmin/Article_manag/load_article';
}

function submitFile(){
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
					alert(data);
                        //now get here response returned by PHP in JSON fomat you can parse it using JSON.parse(data)
                },
                error: function(jqXHR, textStatus, errorThrown){
					alert(errorThrown);
                        //handle here error returned
                }
        });
}

</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("input[id^='upload_file']").each(function() {
            var id = parseInt(this.id.replace("upload_file", ""));
            $("#upload_file" + id).change(function() {
                if ($("#upload_file" + id).val() !== "") {
                    $("#moreImageUploadLink").show();
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        var upload_number = 4;
        $('#attachMore').click(function() {
            //add more file
            var nm_blah = "blah"+upload_number;
            var nm_blah2 = "'"+nm_blah+"'";
            var obj_upload ="upload_file"+upload_number+"";
            var msg_del = "'Are you really want to delete ?'";

            //alert(obj_upload);

            var moreUploadTag = '';
            moreUploadTag += '<div class="form-group-sm"><label for="upload_file' + upload_number + '">Image File ' + upload_number + '</label>';
            moreUploadTag += '<img id="blah' + upload_number + '" alt="your image" width="100" height="100" />';
            moreUploadTag += '<input class="form-control" style="width:60%" type="file" onchange="document.getElementById('+nm_blah2+').src = window.URL.createObjectURL(this.files[0])" name="upload_file'+ upload_number +'" id="upload_file' + upload_number + '" />';
            moreUploadTag += '<div class="form-group-sm">';
            moreUploadTag += '<label for="menutext">File Description ' + upload_number + ':</label>';
            moreUploadTag += '<input type="text" class="form-control" maxlength="75" style="width:30%" id="fdesc'+ upload_number +'" name="fdesc[]">';
            moreUploadTag += '</div>';
            moreUploadTag += '<div id="moreImageUploadLink" style="display:none;margin-left: 10px;"><a href="javascript:void(0);" id="attachMore">Attach another file</a></div>';  
            moreUploadTag += '&nbsp;<a href="javascript:del_file('+"'"+upload_number+"'"+')" style="cursor:pointer;" onclick="return confirm('+msg_del+')">Delete ' + upload_number + '</a>';
            $('<dl id="delete_file' + upload_number + '">' + moreUploadTag + '</dl>').fadeIn('slow').appendTo('#moreImageUpload');
 

            document.getElementById(obj_upload).click();
            upload_number++;
        });

    });
</script>
<script type="text/javascript">
    function del_file(eleId) {
        var ele = document.getElementById("delete_file" + eleId);
       ele.parentNode.removeChild(ele);
    }
</script>	
<!-- Modal -->
            <?php 

                $section_name = $data_article->fe_section_name;
            ?>
			<form id="frm_article" class="frm_article" name="frm_article" action="" method="post" enctype="multipart/form-data">
                 <input type="hidden" id="tmpck" > 
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
                <?php 
                    $i=1;
                    foreach($file_dtl->result() as $dt){
                     $img ='File Not available';
                    if($dt->files_name!=''){
                        $img = '<img style="width:100px" src="'.base_url().'assets/images/upload/'.strtolower(get_foldername_by_section_id($section_name)).'/'.$dt->files_name.'" class="img-thumbnail" alt="'.$data_article->fe_img_files.'">';
                    }
               ?>  
               <dl id="delete_file<?php echo $i ?>">
                <div class="form-group-sm">
                    <label for="menutext">Image Article :</label>
                    <?php echo $img ?>
                    <input class="form-control" style="width:60%" value="<?php echo $dt->files_name ?>" type="file" name="upload_file<?php echo $i ?>" id="upload_file<?php echo $i ?>" />
                   <div class="form-group-sm">
                       <label for="menutext">File Description:</label>
                        <input type="text" class="form-control" value="<?php echo $dt->file_desc ?>" maxlength="75" style="width:30%" id="fdesc<?php echo $i ?>" name="fdesc[]">
                  </div>
                  &nbsp;<a href="javascript:del_file('<?php echo $i ?>')" style="cursor:pointer;" onclick="return confirm('Are you really want to delete ?')">Delete </a>

                </div>
                </dl>
                <?php  $i++; } ?>
                <div id="moreImageUpload"> </div> <!-- container to put obje html upload on the fly -->
                  
               
                   <div id="moreImageUploadLink" style="margin-left: 10px;">
                        <a href="javascript:void(0);" id="attachMore">Attach another file</a>
                    </div>  
                              
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
            <?php echo form_close(); ?>   
			  
			<!--modal content end here-->
                    <div class="modal-footer" style="text-align:right">
                    <!--<input type="submit" value="Submit">-->
                   <button type="button" onclick="submitFile()"  class="btn btn-danger">Update</button>
                      <button type="button" onclick="close_edit()" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>

  <!-- Modal -->