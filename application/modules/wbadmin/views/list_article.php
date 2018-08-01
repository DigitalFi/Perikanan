<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/chosen.jquery.min.js"></script>

<script src="<?php echo base_url()?>assets/js/choosen/init.js"></script>
<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery.tablesorter.min.js"></script>

<link href="<?php echo base_url()?>assets/css/tblsorter/tblsorter.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/prism.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/chosen.min.css" rel="stylesheet" type="text/css">


<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    document.getElementById('page_pos').value=page_num;  
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>wbadmin/article_manag/ajaxPaginationData/'+page_num,
        data:'page='+page_num+'&keywords='+keywords+'&sortBy='+sortBy,
        beforeSend: function () {
            $('.loading').show();
        },
        success: function (html) {
            $('#postList').html(html);
            $('.loading').fadeOut("slow");
        }
    });
}

function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
}

function add_new(){
  document.getElementById('flag_save').value='1';
  document.getElementById('delimg').style='display: none';  
  document.getElementById('chkdel_img').checked=false;
}

function del_img(){
  if(document.getElementById('chkdel_img').checked==true){
    document.getElementById("file").value = "";
    document.getElementById('flag_img_del').value='1';
 
  }else{
    document.getElementById('flag_img_del').value='0';
  }
}

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

$(document).ready(function() { 
    $("table").tablesorter({ 

        widgets: ['zebra'],
        // pass the headers argument and assing a object 
        headers: { 
            // assign the secound column (we start counting zero) 
            0: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
            1: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
            // assign the third column (we start counting zero) 
            6: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            } 
        } 
    }); 
});


$(document).ready(function() {
  $('#myModal').on('show.bs.modal', function(e) {
    $('.chosen-select', this).chosen({width: "40%"});
  });
});

function delete_data () {
  var data = $("#frm_page_list").serialize(); 
    $.ajax({
        url: "<?php echo base_url() ?>wbadmin/article_manag/row_delete", // link of your "whatever" php
        type: "POST",
        async: true,
        cache: false,
        data: data, // all data will be passed here
        success: function(response){ 
            $('#confirm_del').modal('hide');
            showAlert('messages', 'success', response, 5000) ;
            searchFilter(document.getElementById('page_pos').value);
           // searchFilter(0);
        }
    });
 }

 function showAlert(containerId, alertType, message, delay_time) {
    $("#" + containerId).append('<div style="position:fixed;top: 50%;left: 40%;" class="alert alert-' + alertType + '" id="alert' + containerId + '">' + message + '</div>');
    $("#alert" + containerId).alert();

    window.setTimeout(function () { $("#alert" + containerId).alert('close'); }, delay_time);
}

$(function(){
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select,checkbox").val('').end();
        document.getElementById('chkdel_img').checked=false;
        $('#section').val('').trigger('chosen:updated');  
        document.getElementById('blah1').style='display: none'
        for ( instance in CKEDITOR.instances ){
          CKEDITOR.instances[instance].updateElement();
        }
        CKEDITOR.instances[instance].setData('');
    });
});

function get_data(id){
    var url;
    var nmsection ;
    var arr_section;

    url= '<?php echo base_url() ?>wbadmin/article_manag/get_article_data';
    $('#flage_save').val('2');
    $.post(url, {
         article_id : id
    }, function(response){
        var obj = $.parseJSON(response);
        $.each(obj, function() {
            $('#hdn_article_id').val(this['fe_content_id']);
            $('#title').val(this['fe_content_title']);
            $('#short_desc').val(this['fe_content_short_desc']);
            CKEDITOR.instances.editor1.setData(this['fe_full_content']);
            $('#lblbutton').val(this['fe_content_btn_label']);
            if(this['fe_img_files']!=null && this['fe_img_files']!=''){
              document.getElementById('blah1').style='display: block'
              document.getElementById('blah1').src='<?php echo base_url() ?>assets/images/upload/'+this['fe_img_files'];
              document.getElementById('delimg').style='display: block';
            }else{
              document.getElementById('delimg').style='display: none';
            }
            $('#section').val(this['fe_section_name']).trigger('chosen:updated');
            $('#myModal').modal('show'); 
         });
    });
}

</script>
<style>
  #sortable1, #sortable2 {
    border: 1px solid #eee;
    width: 210px;
    min-height: 50px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
    cursor: move;
  }
  #sortable1 li, #sortable2 li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 200px;
  }

  .ui-sortable-placeholder { 
     background:yellow !important; 
     height: 40px !important; // this is the key, set your own height, start with small
     visibility: visible !important;
     boder: 1px dotted;
     margin: 0 0 -10px 0; // additionaly, you can position your placeholder, 
     }  
  </style>
<div class="container">
<input type="hidden" id ="tags" name="tags" /> 
<input type="hidden" id ="secnm" name="secnm" />

    <div class="row">
           <div class="box-header">
                <h4 class="box-title">Article Management</h4>
                <div class="box-tools">
                        <div class="loading" style="display: none; position: absolute;left: 50%;top: 50%;">
                            <div class="content">
                                <img src="<?php echo base_url().'assets/images/loader/loading.gif'; ?>"/>
                            </div>
                        </div>
                         <div class="input-group">
                             <button type="button" onclick="add_new()"   data-toggle="modal" data-target="#myModal" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                            <input type="text" onkeydown = "if (event.keyCode == 13) searchFilter() "    
                            name="searchText" id="keywords"  class="form-control input-sm pull-right" style="width: 200px; " placeholder="Search"/>
                           <div class="input-group-btn">
                                <button style="height: 30px; margin-top: -4px" onclick="searchFilter()" class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                </div>
            </div><!-- /.box-header -->
     <form id="frm_page_list" > 
        <input type="hidden" id="page_pos">      
         <div id="messages" ></div>
        <div class="post-list" id="postList">
             <div id="list_data_container">
              <?php
              echo '<table id="myTable"  class="table table-condensed table-bordered tablesorter">';
              echo '<thead>
                  <tr>
                    <th>#</th>
                    <th><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                    <th>Title</th>
                    <th>Section Name</th>
                    <th>Short Description</th>
                    <th>Active</th>
                    <th>Action</th>
                  </tr>
                  </thead>
              <tbody>';
              $rec_no =1;
              if(!empty($posts)){  
                  $status ='';  
                  foreach($posts as $row){
                      if($row['status_active']=='Y'){
                        $status = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>';
                      }else{
                        $status = '<i class="fa fa-square-o fa-2x" aria-hidden="true"></i>';
                      }
                   echo '<tr>
                        <td scope="row">'.$rec_no.'</td>
                        <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['fe_content_id'].' /></td>
                        <td ><a href="javascript:get_data('."'".$row['fe_content_id']."'".')">'.$row['fe_content_title'].'</a></td>
                        <td>'.$row['section_name'].'</td>
                        <td>'.$row['fe_content_short_desc'].'</td>
                        <td align="center">'.$status.'</td>
                        <td align="center"><a href="javascript:get_data('."'".$row['fe_content_id']."'".')"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
                      </tr>';
                  $rec_no++;    
                  }
                }else{
                   echo '<tr><td colspan="8" class="bg-danger">Data not available or not found</td></tr>';
                }  
              echo '</table>';
                ?>
            </div>
            <?php echo $this->ajax_pagination->create_links(); ?>        
        </div>
     </form>   
        <div class="col-xs-12 text-right">
                <div class="form-group">
                    <button type="button" onclick="add_new()"  data-toggle="modal" data-target="#myModal" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                    <button type="button"  data-toggle="modal" data-target="#confirm_del" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Delete</button> 
                </div>
         </div>
    </div>
</div>

<!-- modal upload -->
     <div class="container">
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="padding-left: 15px; padding-right:10px">
                        <form id="frm_add_article" enctype="multipart/form-data" role="form">
                       
                        <input type="hidden" id ="flag_save" name="flag_save" />
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">Manage Article</h4>
                            </div>
                                      <input type="hidden" id="hdn_article_id" name="hdn_article_id" > 
                                        <div class="form-group-sm">
                                            <label for="menutext">Create this article on Section:</label>
                                            <br>
                                                <?php  echo $dt_cbo_article; ?>
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
                                            <img style="display: none" id="blah1" alt="your image" width="15%" /><div style="display:none;"  id="delimg"><input OnChange="return del_img()"  type="checkbox" id="chkdel_img" name="chkdel_img" > Delete image (Check this, to delete image on save)</div>
                                            <input type="hidden" id="flag_img_del" name="flag_img_del">
                                            <input class="form-control" style="width:60%" type="file" onchange="document.getElementById('blah1').style='display: block'; document.getElementById('blah1').src = window.URL.createObjectURL(this.files[0]);document.getElementById('delimg').style='display:block'" name="file" id="file" />
                                        </div>                                        
                                             
                                  
                                    <script>
                                        CKEDITOR.replace( 'editor1', {
                                            extraPlugins: 'uploadimage',
                                            height: 200,
                                            width : '100%',
                                    
                                            // Configure your file manager integration. This example uses CKFinder 3 for PHP.
                                            filebrowserBrowseUrl: '<?php echo base_url()?>assets/images/upload/',
                                            filebrowserImageBrowseUrl:  '<?php echo base_url()?>assets/images/upload/',
                                            
                                            filebrowserUploadUrl: '<?php echo base_url()?>wbadmin/do_upload',

                                        } );
                                        
                                    </script>
       
                            <!--modal content end here-->
                                          <div class="modal-footer" style="text-align:right">
                                              <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
                                              <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                                          </div>
                                          </div>
                      </form>  
                          
                    </div>
                </div>
            </div>

        </div>

       <script>
            $('#frm_add_article').submit(function(e) {

                for (instance in CKEDITOR.instances) {
                  CKEDITOR.instances[instance].updateElement();
                }              
                
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }

                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>wbadmin/Article_manag/upload_data',
                    cache       : false,
                    data        : formdata ? formdata : form.serialize(),
                    contentType : false,
                    processData : false,

                    success: function(response) {
                        if(response != 'error') {
                          showAlert('messages', 'success', response, 5000) ;
                          searchFilter(document.getElementById('page_pos').value);
                          $('#myModal').modal('hide');
                         } else {
                            $('#messages').addClass('alert alert-danger').text(response);
                        }
                    }
                });
                e.preventDefault();
            });
        </script>



<!-- modal upload end here -->


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
               Are you sore want to delete seleted data ?
            </div>
            <div class="modal-footer">
              <?php $hal = $this->uri->segment(4); ?>
                 <button type="button" onclick="delete_data()" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Yes</button>
                  <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-ban"></i> No</button>
            </div>
        </div>
    </div>
</div> 

