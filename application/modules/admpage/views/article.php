<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
                                                                                                  
<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    document.getElementById('page_pos').value=page_num;  
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $('.loading').show();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>admpage/article/ajaxPaginationData/'+page_num,
        data:'page='+page_num+'&keywords='+keywords+'&sortBy='+sortBy,
        beforeSend: function () {
           
        },
        success: function (html) {
            $('#postList').html(html);
            $('.loading').hide();
        }
    });
}

$(document).ready(function() {
    $('.chosen-select', this).chosen({width: "40%"});    
    $('#file_type').chosen({width: "20%"});   
    init_grid_data_manipulation();

    $(document).on('shown.bs.modal', function(e) {
      $('input:visible:enabled:first', e.target).focus();
    });

    $("#file_type").change(function() {
        if(this.value=='1'){
          $("#div_file").show();
          $("#div_url").hide();
          $("#lbl_file").text("File");
        }else{

          $("#div_file").show();
          $("#div_url").show();
          $("#lbl_file").text("Cover Image");
        }
    //$('#scroll_div_add').scrollTop($('#scroll_div_add').attr("scrollHeight"));
    $('#scroll_div_add').scrollTop($('#scroll_div_add')[0].scrollHeight - $('#scroll_div_add')[0].clientHeight);
    });
});

function delete_data(){
  delete_record("<?php echo base_url() ?>admpage/article/row_delete",'frm_list')
}

function editdata(id){
  editdata_popup(id, '<?php echo base_url() ?>admpage/article/editdata', 'edit_container', 'mdl_edit'); 
}


$(function(){
    $('#mdl_add').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select,checkbox").val('').end();
        $('#article_type').val('').trigger('chosen:updated');
        $('#file_type').val('').trigger('chosen:updated');
    });
});


</script>
<style>
.chosen-container{
    width: 100% !important;
} 


.chosen-container .chosen-drop {
  border-bottom: 0;
  border-top: 1px solid #aaa;
  top: auto;
  bottom: 40px;
}
.chosen-container.chosen-with-drop .chosen-single {
  border-top-left-radius: 0px;
  border-top-right-radius: 0px;
  border-bottom-left-radius: 5px;
  border-bottom-right-radius: 5px;
  background-image: none;
}
.chosen-container.chosen-with-drop .chosen-drop {
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  box-shadow: none;
  margin-bottom: -16px;
}

.chosen-container .chosen-results {
    max-height:150px;
}
</style>
<div class="container">
          <div class="row">
                 <div class="box-header">
                      <div class="box-tools">
                              <div class="breadcrumbs " id="breadcrumbs" style="width:90%">
                                <div style="padding-bottom: 5px">
                                  <button type="button" data-toggle="modal" data-target="#mdl_add" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button>
                                </div>
                                <div class="nav-search" id="nav-search">
                                    <div class="form-group has-feedback has-search">
                                      <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                      <input type="text" name="searchText" id="keywords" onkeydown = "if (event.keyCode == 13) searchFilter() " autocomplete="off" class="form-control" placeholder="Search">
                                    </div>
                                </div><!-- /.nav-search -->
                              </div>
                      </div>
                  </div><!-- /.box-header -->
               <form id="frm_list" > 
            <input type="hidden" id="page_pos">      
             <div id="messages" ></div>
            <div class="post-list" id="postList">
                 <div id="list_data_container">
                  <?php
                  echo '<table id="myTable" style="width:90%"  class="table table-hovered table-bordered">';
                  echo '<thead>
                      <tr>
                        <th style="text-align:right; width:3px" >#</th>
                        <th style="width:3px" ><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                        <th>Tittle</th>
                        <th>Short Description</th>
                        <th>Media Type</th>
                        <th>Article Type</th>
                        <th style="text-align:right;" >Create Date</th>
                        <th>Create By</th>
                        <th style="text-align:right;" >Update Date</th>
                        <th>update By</th>
                        <th>Publish By</th>
                       <th style="width:3px">Action</th>
                      </tr>
                      </thead>
                  <tbody>';
                  $rec_no =1;
                  if(!empty($posts)){  
                      $status ='';  
                      foreach($posts as $row){
                       echo '<tr>
                            <td scope="row" align="right" style="width:3%" >'.$rec_no.'. </td>
                            <td style="width:3px" scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['id_article'].' /></td>
                            <td ><a href="javascript:editdata('."'".$row['id_article']."'".')">'.$row['title'].'</a></td>
                            <td>'.$row['short_description'].'</td>
                            <td>'.$row['file_type'].'</td>
                            <td>'.$row['nm_template'].'</td>
                            <td align="right" >'.$row['create_date'].'</td>
                            <td align="right">'.$row['user_name'].'</td>
                            <td align="right" >'.$row['update_date'].'</td>
                            <td align="right">'.$row['update_by'].'</td>
                            <td align="right">'.$row['publish_by'].'</td>
                            <td style="width:3px" align="center"><a href="javascript:editdata('."'".$row['id_article']."'".')"><i style="font-size:16px;" class="fa fa-edit" aria-hidden="true"></i></a></td>
                          </tr>';
                      $rec_no++;    
                      }
                    }else{
                       echo '<tr><td colspan="8" class="bg-info">Data not available or not found</td></tr>';
                    }  
                  echo '</table>';
                    ?>
                </div>
                <?php echo $this->ajax_pagination->create_links(); ?>        
            </div>
         </form>   
              <div class="col-xs-12 text-right">
                      <div class="form-group" style="width:90%">
                          <button type="button" onclick="add_new()"  data-toggle="modal" data-target="#mdl_add" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                          <button id="btndelete" disabled type="button" data-toggle="modal" data-target="#confirm_del" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Delete</button>  
                      </div>
               </div>              
          </div>
      </div>
 <!-- modal add role -->
      <div class="modal fade" id="mdl_add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">Input Article</h4>
            </div>
           <form id="frm_add" enctype="multipart/form-data" role="form">
            <div class="modal-body" id="scroll_div_add" style="height:550px; width:100%; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;">
                  <input type="hidden" id="id_article" name="id_article" > 
                  <!--modal content start here-->
                  <div class="form-group">
                      <label for="title">Judul Article</label>
                      <input type="text" class="form-control" id="title" required name="title" aria-describedby="emailHelp" placeholder="Input judul article">
                      <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                    <div class="form-group">
                      <label for="short_desc">Ringkasan</label>
                      <input type="text" class="form-control" id="short_desc" name="short_desc" placeholder="Input ringkasan singkat article">
                    </div>

                    <div class="form-group">
                      <label for="short_desc">Detail Article</label>
                      <textarea class="form-control" id="article_content" required name="article_content" rows="3"></textarea>
                      <script type="text/javascript">
                                              //<![CDATA[
                         CKEDITOR.replace( 'article_content', {
                              extraPlugins: 'textindent',
                              height: 200,
                             // width :30,

                              // Configure your file manager integration. This example uses CKFinder 3 for PHP.
                              //filebrowserBrowseUrl: '../uploads/',
                              //filebrowserImageBrowseUrl: '../uploads/',
                              
                              //filebrowserUploadUrl: 'do_upload',
                              
                                                                  
                            } );

                      //]]>
                      </script>
                    </div>     

                    <div class="form-group">
                      <div class="row">
                        <div class="col-md-4">
                           <label for="Article Type">Article Type</label></br>
                           <?php echo $cbo_article_type ?>
                        </div> 
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="Article Type">File Type</label></br>
                            <?php echo $cbo_file_type ?>
                         </div>
                        </div>
                        <!-- <div class="col-md-4">
                          <div class="form-group">
                            <label for="Article Type">Article Untuk Kecamatan</label></br>
                            <?php echo $cbo_kecamatan ?>
                         </div>
                        </div> -->
                      </div>

                      <div class="form-group" id="div_file" style="display: none;">
                        <label id="lbl_file" for="short_desc">File</label>
                        <input type="file" class="form-control" id="the_file" name="the_file" >
                      </div>

                      <div class="form-group" id="div_url" style="display: none;">
                        <label for="short_desc">Video Url</label>
                          <input type="text" class="form-control" id="url" name="url" placeholder="Input video url">
                      </div>
                    </div>

                    <!--modal content end here-->
            </div>
            <div class="modal-footer">
                          <button type="submit" onclick="CKupdate()" id="btnsave" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Data" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
                          <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
            </div>
          </form>
          </div>
        </div>
      </div>
      <!-- modal add role end -->
       <script>

            function CKupdate(){
                for ( instance in CKEDITOR.instances )
                    CKEDITOR.instances[instance].updateElement();
            }

            $('#frm_add').submit(function(e) {
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }
                  toastr.options = {
                    timeOut: 3000,
                    positionClass:"toast-top-center"
                  };

                if($('#article_type').val()==''){
                  toastr["error"]("Article Type belum dipilih");
                  $('#article_type').trigger('chosen:open');
                  return false;
                }

                $('#btnsave').button('loading');
                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>admpage/article/insert_article',
                    cache       : false,
                    dataType    : 'json',
                    data        : formdata ? formdata : form.serialize(),
                    contentType : false,
                    processData : false,
                    error : function(xhr, ajaxOptions, thrownError){
                        console.log(xhr.status);
                        console.log(xhr.responseText);
                        console.log(thrownError);
                       // doModal('Error Info', xhr.responseText);
                    },
                    success : function(response){
                      $('#btnsave').button('reset');
                        if(response['error']=='true'){                                     
                          toastr["error"](response['msg']);
                          return false;
                        }else{
                          toastr['success'](response['msg']);
                          searchFilter(document.getElementById('page_pos').value);
                          $('#mdl_add').modal('hide');
                         }                                       
                   }

                });
                e.preventDefault();
            });
        </script>
      


      <!-- modal edit role -->
      <div class="modal fade" id="mdl_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">Edit Article</h4>
            </div>
              <div id="edit_container">
                      <!-- content will be here -->
              </div>
          </div>
        </div>
      </div>
      <!-- modal edit role end -->

      <div class="modal fade" id="confirm_del" tabindex="-1" role="dialog" aria-labelledby="mdl_roleLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="mdl_roleLabel">Delete Confirmation</h4>
                  </div>
                  <div class="modal-body">
                     Are you sure want to delete seleted data ?
                  </div>
                  <div class="modal-footer">
                    <?php $hal = $this->uri->segment(4); ?>
                       <button type="button" onclick="delete_data()" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Yes</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-ban"></i> No</button>
                  </div>
              </div>
          </div>
      </div> 



