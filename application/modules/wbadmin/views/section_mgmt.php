<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/dropzone.min.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/basic.min.css" rel="stylesheet">

<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url()?>assets/js/dropzone.min.js"></script>
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<style>
.dropzone {
	margin-top: 10px;
	width:200px;
	border: 2px dashed #0087F7;
}

#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
#sortable li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; height: 4.5em; }
html>body #sortable li { height: 4.5em; line-height: 3.2em; }
.ui-state-highlight { height: 4.5em; line-height: 3.2em; }

.grab {
  cursor: move;
  cursor: move;
  cursor:  -moz-move;
  cursor: -webkit-move;
}

</style>
<script>
function get_data(section_id, menu_label){
	var url;
	url= 'section_manag/get_section';
	$.post(url, {
		sectionid : section_id
	}, function(response){
		var obj = $.parseJSON(response);
		$.each(obj, function() {
			$('#section_id').val(this['section_id']);
			$('#remove_id').val(this['section_id']);
			$('#path').val(menu_label);
			$('#section_name').val(this['section_name']);
			$('#section_title').val(this['section_title']);
			CKEDITOR.instances['section_desc'].setData(this['section_desc'])
			$('#image_folder').val(this['image_folder']);//
			$('#section_desc').val(this['section_desc']);
			$('#status').val(this['is_visible']);
		 });
		 
		 $('#lbl_sec_name').attr('title', 'Nama Section di main page').tooltip('fixTitle');
		 $('#lbl_sec_title').attr('title', 'Judul untuk section:  ['+$('#section_name').val()+']').tooltip('fixTitle');
		 $('#lbl_sec_desc').attr('title', 'Deskripsi Singkat untuk section:  ['+$('#section_name').val()+']').tooltip('fixTitle');
		 $('#lbl_img_folder').attr('title', 'Folder untuk menyimpan file yang diupload untuk section:  ['+$('#section_name').val()+']').tooltip('fixTitle');
		//$("#comment").html(obj);
	});
	display_data(menu_label);
}

function update(flag){
	for (instance in CKEDITOR.instances) {
		CKEDITOR.instances[instance].updateElement();
	}
	var query = $('#frmsection').serialize();
	var url;
	url= 'section_manag/update_section';
	$.post(url, query, function (response) {
		//alert(response);
		 $('#section_container').html(response);
	});
	if(flag=='1'){
		$('#myModal').modal('hide');
	}
}

function display_data(menu_label){
	init_title('Edit Menu  <strong>'+menu_label+'</strong>','','');
	$('#myModal').modal('show');
}

function init_title(title_txt, content_text, id){
	$('#section_id').val(id);
	$('h4#modal-label').html(title_txt)
	$("#confirm_del").find('.modal-body').text(content_text);
}

</script>

<div class="panel panel-default" >
  <div class="panel-heading">Maintain Section Page</div>
  <div class="panel-body">
  <?php
   $attributes = array("name" => "frm_update");
   echo form_open("", $attributes);?>
   <div id="section_container">
   		<?php echo  $section;?>
   </div>
   <?php echo form_close(); ?>
  </div>
</div>
<input type="hidden" id="remove_id" name="remove_id" />
<input type="hidden" id="sv_mode" name="sv_mode" />
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label"></h4>
       </div>
        <div class="modal-body">
       	 <!--modal content start here-->
            <form id="frmsection">
            <input type="hidden" id="section_id" name="section_id" />
              <div class="form-group-sm">
               <label for="menutext">Section Name: <span id="lbl_sec_name" class="badge badge-info" title="" ><i>i</i></span></label>
  				<input type="text"  class="form-control" maxlength="75" style="width:60%" id="section_name" name="section_name">
              </div>
              <div class="form-group-sm">
               <label for="menutext">Section Title: <span id="lbl_sec_title" class="badge badge-info" title="" ><i>i</i></span></label>
  				<input type="text" class="form-control" maxlength="75" style="width:100%" id="section_title" name="section_title">
              </div>
                <div class="form-group-sm">
                    <label for="menutext">Section Description: <span id="lbl_sec_desc" class="badge badge-info" title="" ><i>i</i></span></label>
                    <textarea name="section_desc" id="section_desc" rows="10" cols="80">
                    </textarea>
                </div>
             <script>
                CKEDITOR.replace( 'section_desc', {
					extraPlugins: 'uploadimage',
                   height: 100,
                    width : 600,
					filebrowserUploadUrl: 'do_upload',
				  toolbarGroups: [
					{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
					{ name: 'paragraph',   groups: [ 'indent', 'blocks', 'align', 'bidi' ] },
					{ name: 'styles' },
					{ name: 'colors' }
					]
                });
            </script>

              <div class="form-group-sm">
               <label  for="menutext" >Section Image Folder: <span id="lbl_img_folder" class="badge badge-info" title="" ></span><i>i</i></span></label>
               
  				<input type="text" class="form-control" maxlength="75" style="width:30%" id="image_folder" name="image_folder">
              </div>
                 <div class="form-group-sm">
                    <label for="menutext">Activate This Section: <span id="lbl_sec_desc" class="badge badge-info" title="" ><i>i</i></span></label>
					<select class="form-control" style="width:20%"  name="status" id="status">
					  <option value="Y">Yes</option>
					  <option value="N">No</option>
					</select>                    
                </div>
                <div class="form-group-sm" id="icon_container">
                <label for="menu_icon">Section Image:</label>
               <div class="form-group-sm">
                    <div class="dropzone" style="height:20px">
                      <div class="dz-message">
                       <h3> Klik atau Drop gambar disini</h3>
                      </div>
                    </div>    
                 </div>
               </div>
           
           </form>        
		<!--modal content end here-->
        </div>
        <div class="modal-footer">
         <button type="button" onclick="update('1')" class="btn btn-danger">Update Section</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
<script>
	Dropzone.autoDiscover = false;
	
	var foto_upload= new Dropzone(".dropzone",{
	url: 'section_manag/proses_upload',
	maxFilesize: 2,
	method:"post",
	acceptedFiles:"image/*",
	paramName:"userfile",
	dictInvalidFileType:"This file type doesnt allowed",
	addRemoveLinks:true,
	 init: function() {
            this.on("success", function(file, response) {
				$('#section_id').val(response);
				//alert(response)
              //  var obj = jQuery.parseJSON(response)
               // console.log(obj);
            })
        }
	});
	
	foto_upload.on("addedfile", function(){
		update('0');
	});
	
	//Event ketika Memulai mengupload
	foto_upload.on("sending",function(a,b,c){
		a.id=$('#section_id').val();
		c.append("token_foto",a.id); //Menmpersiapkan token untuk masing masing foto
		c.append("section_id", $('#section_id').val());image_folder
		c.append("image_folder", $('#image_folder').val());
	});


//Event ketika foto dihapus
foto_upload.on("removedfile",function(a){
	$.ajax({
		type:"post",
		url:'section_manag/remove_foto/'+document.getElementById("remove_id").value+'',
		cache:false,
		dataType: 'json',
		success: function(){
			console.log("Foto terhapus");
		},
		error: function(){
			console.log("Error");
			//alert("Error"+file);
		}
	});
});


</script>
