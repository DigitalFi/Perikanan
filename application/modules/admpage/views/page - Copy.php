<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/style_drag_drop.css" media="screen" />
<script src="<?php echo base_url()?>assets/js/jquery-ui.min.js"></script>
                                                                                                  
<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    document.getElementById('page_pos').value=page_num;  
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $('.loading').show();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>admpage/page/ajaxPaginationData/'+page_num,
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
  $('.chosen-select', this).chosen({width: "100%"});
    init_grid_data_manipulation();

    $(document).on('shown.bs.modal', function(e) {
      $('input:visible:enabled:first', e.target).focus();
    });

  $("#page_type").change(function() {
        if(this.value=='N'){
          $("#div_dtl_of").show();
          $('#template').trigger('chosen:open');
        }else{
          $("#div_dtl_of").hide();
        }
  });
});

$(function(){
    $('#mdl_add').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select,checkbox").val('').end();
        $('#article_type').val('').trigger('chosen:updated');
        $('#file_type').val('').trigger('chosen:updated');
    });

    $('#mdl_article').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select,checkbox").val('').end();
        $('#article_id').val('').trigger('chosen:updated');
    });
});

function delete_data(){
  delete_record("<?php echo base_url() ?>admpage/page/row_delete",'frm_list')
}

function editdata(id){
  editdata_popup(id, '<?php echo base_url() ?>admpage/page/editdata', 'edit_container', 'mdl_edit'); 
}


// Get items
function getItems(exampleNr)
{
  var columns = [];

  $(exampleNr + ' ul.sortable-list').each(function(){
    columns.push($(this).sortable('toArray').join(','));        
  });

  return columns.join('|');
}
</script>
<style type="text/css">
/*.modal-dialog {
  width: 100%;
  height: 100%;
  padding: 0;
}

.modal-content {
  height: 100%;
  border-radius: 0;
}  

.modal-dialog {
    margin: 0vh auto 0px auto
}*/
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
                        <th>Page Name</th>
                        <th style="text-align:right;" >Create Date</th>
                        <th>Create By</th>
                        <th style="text-align:right;" >Update Date</th>
                        <th>update By</th>
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
                            <td style="width:3px" scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['id_pages'].' /></td>
                            <td ><a href="javascript:editdata('."'".$row['id_pages']."'".')">'.$row['nm_page'].'</a></td>
                            <td align="right" >'.$row['create_date'].'</td>
                            <td align="right">'.$row['create_by'].'</td>
                            <td align="right" >'.$row['update_date'].'</td>
                            <td align="right">'.$row['update_by'].'</td>
                            <td style="width:3px" align="center"><a href="javascript:editdata('."'".$row['id_pages']."'".')"><i style="font-size:16px;" class="fa fa-edit" aria-hidden="true"></i></a></td>
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
              <h4 class="modal-title" id="exampleModalLabel">Page Management</h4>
            </div>
           <form id="frm_add" enctype="multipart/form-data" role="form">
            <div class="modal-body" style="height:550px; width:100%; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;">
              <!--modal content start here-->
                  <input type="hidden" id="id_article_coll" name="id_article_coll" > 
                  <input type="hidden" id="count_default_temp" name="count_default_temp" > 
                  <input type="hidden" id="selected_item" name="selected_item" > 
                    <div class="form-group">
                      <label for="Page Name">Nama Halaman</label>
                      <input type="text" class="form-control" required id="nm_page" name="nm_page" placeholder="Input nama halaman">
                    </div> 

                    <div class="row" style="width:50%">  
                      <div class="col-md-4">
                        <div class="form-group">
                          <label for="Page Name">Halaman Utama?</label><br>
                          <select id="page_type" name="page_type" data-placeholder="Choose an option" class="chosen-select" tabindex="2">
                                <option value=""></option>
                                <option value="Y">Yes</option>
                                <option value="N">No</option>
                          </select>                      
                        </div> 
                      </div>                   
                      
                      <div class="col-md-8">
                        <div id="div_dtl_of" class="form-group" style="display: none;">
                          <label for="Page Name">Detail Dari</label><br>
                          <?php echo $cbo_template ?>                      
                        </div>
                      </div>
                    </div>

                      <div id="example-1-3">
                          <div class="row" >
                            <div  class="col-md-4"> 
                              <label for="Page Name">Available Template</label><br>
                              <?php
                                  echo '<div id="template_list" class="column left first" style="width:250px;">';
                                  echo '<ul class="sortable-list">';
                                  foreach($data_master_template as $dt_template){
                                      echo '<li style="padding-right:2px" class="sortable-item" id='.$dt_template['id_template'].'>'.$dt_template['nm_template'].'
                                      &nbsp;<button onclick="fill_selected_temp_id('.$dt_template['id_template'].');" id="btn_link_'.$dt_template['id_template'].'" style="display:none" type="button" class="btn btn-danger btn-xs pull-right" data-toggle="modal" data-target="#mdl_article"><i class="fa fa-link"></i></button>
                                        <input type="hidden" id="txt_selected_temp_'.$dt_template['id_template'].'" name="txt_selected_temp_'.$dt_template['id_template'].'">
                                      </li>';
                                  }
                                  echo '</ul>';
                                  echo '</div>';
                              ?>
                            </div>
                            <div class="col-md-4"> 
                              <label for="Page Name">Default Template</label><br>
                              <div id="selected_template" class="column left" style="width:250px;">
                                <ul class="sortable-list">
                              
                                </ul>
                              </div>
                            </div>

                            <div class="col-md-4">
                              <label for="Page Name">Template Detail</label><br>
                              <div  class="column left" style="width:250px;">
                                <ul id="dtltemplate" class="sortable-list">
                              
                                </ul>
                              </div>
                            </div>  
                          </div>    
                      </div>                    
                      <script type="text/javascript">

                        function getSelected_item(idx){
                          $('#txt_selected_temp_'+idx+'').val($('#selected_temp_id').val()+'|'+$("#article_id").chosen().val());
                          $('#mdl_article').modal('hide');
                        }

                        function fill_selected_temp_id(seltempid){
                          $('#selected_temp_id').val(seltempid);
                        }

                      $(document).ready(function(){
                        var oldList, newList, item;
                        // Example 1.3: Sortable and connectable lists with visual helper
                        $('#example-1-3 .sortable-list').sortable({
                          connectWith: '#example-1-3 .sortable-list',
                          placeholder: 'placeholder',
                            start: function(event, ui) {
                                item = ui.item;
                                newList = oldList = ui.item.parent().parent();
                            },                          
                            stop: function (evt, ui) {
                              if($('#dtltemplate li').size()>1){
                                  toastr.options = {
                                          timeOut: 3000,
                                          positionClass:"toast-top-center"
                                  };
                                  toastr['error']('Accept only one template');
                                  return false;
                               }
                                if($('#selected_template li').size()>0){
                                  if(newList.attr('id')=='selected_template'){
                                     id_obj = ui.item.attr("id");
                                     $('#btn_link_'+id_obj+'').show();

                                     //alert("Moved " + id_obj + " from " + oldList.attr('id') + " to " + newList.attr('id'));
                                  }
                               }

                               if(newList.attr('id')=='template_list'){
                                    id_obj = ui.item.attr("id");
                                     $('#btn_link_'+id_obj+'').hide();
                                     //alert("Moved " + id_obj + " from " + oldList.attr('id') + " to " + newList.attr('id'));
                               }

                               $('#count_default_temp').val(($('#selected_template li').length));
                            },
                            change: function(event, ui) {  
                                  if(ui.sender) newList = ui.placeholder.parent().parent();
                            },
                        });

                      });

                      // Example 2.1: Get items
                        $('#example-1-3 .sortable-list').sortable({
                          connectWith: '#example-1-3 .sortable-list'
                        });

                      </script>

                    <!--modal content end here-->
            </div>
            <div class="modal-footer">
                <button type="submit" id="btnsave" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Data" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
                <button type="button" class="btn btn-danger btn-sm" onclick="$('#mdl_add').modal('hide');" ><i class="fa fa-close"></i> Close</button>
            </div>
          </form>
          </div>
        </div>
      </div>
      <!-- modal add role end -->
       <script>

          /*function save_data(item_template){

            toastr.options = {
                    timeOut: 3000,
                    positionClass:"toast-top-center"
            };

            if($('#nm_page').val()==''){
              toastr["error"]('Page name tida boleh kosong');
              $('#nm_page').focus();
              return false;
            }


              $.ajax({
                type: "POST",
                dataType    : 'json',
                url: '<?php echo base_url()?>admpage/page/insert_page',
                data: { 
                        the_data: item_template, 
                        pg_name:$('#nm_page').val(), 
                        pg_type:$('#page_type').val(), 
                        template_id:$('#template_id').val(),
                        count_default_temp:$('#count_default_temp').val(), 
                      }, 
                error : function(xhr, ajaxOptions, thrownError){
                    console.log(xhr.status);
                    console.log(xhr.responseText);
                    console.log(thrownError);
                },
                success : function(response){
                  $('#btnsave').button('reset');
                              
                  if(response['error']=='true'){                                     
                    toastr["error"](response['msg']);
                    return false;
                  }else{
                    toastr['success'](response['msg']);
                    searchFilter(document.getElementById('page_pos').value);
                    //$('#mdl_add').modal('hide');
                   }
                }
              });
          }*/
          $('#frm_add').submit(function(e) {
                var selected_template = getItems('#example-1-3');
                $('#selected_item').val(selected_template);
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }
                  toastr.options = {
                    timeOut: 3000,
                    positionClass:"toast-top-center"
                  };

               /* if($('#article_type').val()==''){
                  toastr["error"]("Article Type belum dipilih");
                  $('#article_type').trigger('chosen:open');
                  return false;
                }*/

                //$('#btnsave').button('loading');
                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>admpage/page/insert_page',
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
                      //$('#btnsave').button('reset');
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

    <div class="modal fade" id="mdl_article" tabindex="-1" role="dialog" aria-labelledby="mdl_roleLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="mdl_roleLabel">List Article</h4>
                  </div>
                  <div class="modal-body">
                    <input type="hidden" id="selected_temp_id">
                     <div id="div_dtl_of" class="form-group" >
                          <label for="Page Name">Detail Dari</label><br>
                          <?php echo $cbo_article ?>                      
                      </div>
                  </div>
                  <div class="modal-footer">
                    <?php $hal = $this->uri->segment(4); ?>
                       <button type="button" onclick="getSelected_item($('#selected_temp_id').val())" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Corfirm</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-ban"></i> Close</button>
                  </div>
              </div>
          </div>
      </div> 




      <div class="modal fade" id="confirm_del" tabindex="-1" role="dialog" aria-labelledby="mdl_roleLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="mdl_roleLabel">Delete Confirmation</h4>
                  </div>
                  <div class="modal-body">
                      Are Your Sure want to delete?
                  </div>
                  <div class="modal-footer">
                    <?php $hal = $this->uri->segment(4); ?>
                       <button type="button" onclick="delete_data()" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Yes</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-ban"></i> No</button>
                  </div>
              </div>
          </div>
      </div> 



