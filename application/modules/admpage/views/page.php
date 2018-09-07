                                                                                                 
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
        $('body').addClass('modal-open');
    });

});

function add_data(id){
  editdata_popup(id, '<?php echo base_url() ?>admpage/page/add_data', 'add_container', 'mdl_add'); 
}
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

function getItems_individual(exampleNr)
{
  var columns = [];
  $(exampleNr).each(function(){
    var id = $(this).attr('id');

    var the_val = $(this).attr('value');
      columns.push(id+"|"+the_val);   
  });
  return (columns.join(','));
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

.modal-open {
  overflow:hidden;
  overflow-y:scroll;
  padding-right:0 !important;
}


#mdl_add {
top:-25px;
}

</style>
<div class="container">
          <div class="row">
                 <div class="box-header">
                      <div class="box-tools">
                              <div class="breadcrumbs " id="breadcrumbs" style="width:90%">
                                <div style="padding-bottom: 5px">
                                  <button type="button" onclick="add_data()" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button>
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
                          <button type="button" onclick="add_data()"   class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
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
              <div id="add_container">
                      <!-- content will be here -->
              </div>
          </div>
        </div>
      </div>
      <!-- modal add role end -->
  
      <!-- modal edit role -->
      <div class="modal fade" id="mdl_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">Edit Page Management</h4>
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



