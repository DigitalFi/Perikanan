<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url()?>assets/js/dropzone.min.js"></script>
<link href="<?php echo base_url()?>assets/css/dropzone.min.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/basic.min.css" rel="stylesheet">
<style>
.dropzone {
	margin-top: 10px;
	width:600px;
	border: 2px dashed #0087F7;
}

</style>
<form>
 
      <div class="form-group-sm">
           <label for="menutext">Title:</label>
            <input type="text" class="form-control" maxlength="75" style="width:60%" id="menutext" name="menu_text">
      </div>
  	<div class="form-group-sm">
    	<label for="menutext">Content Detail:</label>
        <textarea name="editor1" id="editor1" rows="10" cols="80">
        </textarea>
    </div>
    <div class="form-group-sm">
        <div class="dropzone">
          <div class="dz-message">
           <h3> Klik atau Drop gambar disini</h3>
          </div>
        
        </div>    
     </div>
    
</form>
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
<script>
	Dropzone.autoDiscover = false;
	
	var foto_upload= new Dropzone(".dropzone",{
	url: 'wbadmin/proses_upload',
	maxFilesize: 2,
	method:"post",
	acceptedFiles:"image/*",
	paramName:"userfile",
	dictInvalidFileType:"This file type doesnt allowed",
	addRemoveLinks:true,
	 init: function() {
            this.on("success", function(file, response) {
				alert(response);
              //  var obj = jQuery.parseJSON(response)
               // console.log(obj);
            })
        }
	});
	
	//Event ketika Memulai mengupload
	foto_upload.on("sending",function(a,b,c){
		a.token=Math.random();
		c.append("token_foto",a.token); //Menmpersiapkan token untuk masing masing foto
		c.append("data", "slider/");
	});
	
//Event ketika foto dihapus
foto_upload.on("removedfile",function(a){
	var token=a.token;
	$.ajax({
		type:"post",
		data:{token:token},
		url:'wbadmin/remove_foto',
		cache:false,
		dataType: 'json',
		success: function(){
			console.log("Foto terhapus");
		},
		error: function(){
			console.log("Error");

		}
	});
});	
</script>
