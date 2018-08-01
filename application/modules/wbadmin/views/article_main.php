<script src="<?php echo base_url()?>assets/js/moment.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>
<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet">
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>


 <link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
 <style>
.fixed-panel {
  min-height: 10px;
  max-height: 500px;
  overflow-y: scroll;
} 


.table-condensed{
  font-size: 12px;
}

#imaginary_container{
   /*  margin-top:20%; Don't copy this */
}
.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
	border-right:0; 
	box-shadow:0 0 0; 
	border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}

 </style>
 <script>
 	function search_data(search_value){
		$('#loadingmessage').show(); 
		var url;
		url= '<?php echo base_url() ?>wbadmin/article_manag/search_article';
		$.post(url, {
            s_value : search_value
        }, function(response){
          //alert(response);
             $('#list_data_container').html(response);
			       $('#loadingmessage').hide();
        });
	}

  function delete_data(id_value,page){
   // alert(id_value);
    $('#loadingmessage2').show(); 
    var url;
    if(page==''){
      url='<?php echo base_url()?>wbadmin/Article_manag/delete_selected_article';
    }else{
      url='<?php echo base_url()?>wbadmin/Article_manag/delete_selected_article/'+page;
    }
    $.post(url, {
            d_value : id_value
        }, function(response){
          $('#list_data_container').html(response);
          $('#confirm_del').modal('hide');
          $('#loadingmessage2').hide();
        });
  }

function delete_data1(){
        var query = $('#list_article').serialize();
        var url = '<?php echo base_url() ?>wbadmin/article_manag/delete_selected_article';
        $.post(url, query, function (response) {
         alert (response);
        });
}

	function add_article(){
		window.location.href = '<?php echo base_url() ?>wbadmin/article_manag/add_article';
	}

  function edit_article($id){
    window.location.href = '<?php echo base_url() ?>wbadmin/article_manag/edit_article/'+$id;
  }
//  for select / deselect all

$('document').ready(function()
{
    $('.select-all').click(function(){
        if(this.checked)
            $(".chk-box").prop("checked", true);
        else
            $(".chk-box").prop("checked", false);
    });
        
    $(".chk-box").click(function()
    {
		//alert ('jml check '+$(".chk-box").length +'jml yg di check'+  $(".chk-box:checked").length)
        if($(".chk-box").length == $(".chk-box:checked").length)
        {
            $(".select-all").prop("checked", true);
        }
        else
        {
            $(".select-all").removeAttr("checked");
        }
    });
});

function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
  //alert("My favourite sports are: " + favorite.join(", "));

}
</script>
<?php if($after_del !='1'){?>
 <input type="hidden" id ="tags" name="tags" /> 
 <div class="panel panel-default">
 <div class="panel-heading clearfix">
 <h4 class="panel-title pull-left" style="padding-top: 7.5px;">Manage Article</h4>
  	
  <div class="row ">
    <div class="col-sm-6 col-sm-offset-3 pull-right">
      <div id="imaginary_container"> 
        <div class="input-group stylish-input-group">
            <input type="text" class="form-control" id="search" name="search"  placeholder="Search" >
            <span class="input-group-addon">
              <button type="button" onclick=" search_data($('#search').val())">
                  <span class="glyphicon glyphicon-search"></span>
              </button>  
            </span>
        </div>
      </div>
    </div>
	</div>
 </div>
  <div class="panel-body">
 <?php } ?> 
  <div id="loadingmessage" style="display:none">
       <img src="<?php echo base_url()?>assets/images/loader/loading.gif"/>
   </div>               

 
<form id="list_article" name="list_article" enctype="application/x-www-form-urlencoded" >
  <div id="list_data_container">
	<?php
  echo '<table class="table table-striped table-condensed">';
	echo '<thead class="nav">
			<tr>
			  <th>#</th>
			  <th><input type="checkbox" OnChange="Populate()"  class="select-all" /></th>
			  <th>Title</th>
			  <th>Short Description</th>
			  <th>Image File</th>
        <th>Active Status</th>
        <th>Section</th>
        <th>Action</th>
			</tr>
		  </thead>
		  <tbody>';
	$rec_no =1;	  
	foreach($article as $row){
		$short_desc =$row->fe_content_short_desc;
    $full_content ='';
    $three_dot='';
		if(strlen($row->fe_content_short_desc)==0){
      $full_content = strip_tags_content($row->fe_full_content);
      $short_desc = substr($full_content,0,200);
   
      if(strlen($full_content)>=200){
        $three_dot = '...'; 
      }
		}

		echo '<tr>
			  <td scope="row">'.$rec_no.'</td>
			  <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content" value='.$row->fe_content_id.' /></td>
			  <td><a href="javascript:edit_article('.$row->fe_content_id.')">'.strip_tags_content($row->fe_content_title).'</a></td>
			  <td>'.$short_desc.$three_dot.'</td>
			  <td>'.$row->fe_img_files.'</td>
        <td>'.$row->status_active.'</td>
        <td>'.get_section_titel_by_id($row->fe_section_name).'</td>
        <td><a href="javascript:edit_article('.$row->fe_content_id.')">Edit</a></td>
			</tr>';
	$rec_no++;		
	}
	echo '</table>';
    ?>

    <div><?php echo $this->pagination->create_links(); ?></div>
  </div>    
</form>



<?php if($after_del !='1'){?>
  <div class="panel-footer">
  <button type="button"  onclick="add_article()"  class="btn btn-success btn-sm">Add Article</button> 
  <button type="button"  data-toggle='modal' data-target='#confirm_del' class="btn btn-danger btn-sm">Delete Article</button>
	<!--<button type="button"    data-toggle="modal" data-target="#myModal" class="btn btn-success btn-sm">Add Article</button> -->
    </div>
</div>



<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label">Add Article</h4>
       </div>
        <div class="modal-body">
       	 <!--modal content start here-->
         <div id="files"></div>
			<form id="data" name="data">
             
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
                    <input class="form-control" style="width:60%" type="file" name="berkas" />
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
      </form>
                    <!--modal content end here-->
                    </div>
                    <div class="modal-footer">
                    <input type="submit" value="Submit">
                      <button type="button" onclick="add_article()"  class="btn btn-danger">Save it</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
  </div>
<!-- Modal -->

  <div class="modal fade" id="confirm_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Delete Confirmation</h4>
              </div>
              <div class="modal-body">
               <div id="loadingmessage2" style="display:none">
                   <img src="<?php echo base_url()?>assets/images/loader/loading.gif"/>
               </div>              
               Are you sore want to delete this
              </div>
              <div class="modal-footer">
              <?php $hal = $this->uri->segment(4); ?>
                 <button type="button" onclick="delete_data(document.getElementById('tags').value, '<?php echo $hal; ?>' )" class="btn btn-danger">Yes</button>
                  <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
              </div>
            </div>
          </div>
        </div>  

<?php }?>

