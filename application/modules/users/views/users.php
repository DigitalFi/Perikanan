
<script src="<?php echo base_url()?>assets/js/choosen/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/choosen-up" />

<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    document.getElementById('page_pos').value=page_num;  
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $('.loading').show();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>users/ajaxPaginationData/'+page_num,
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

    init_grid_data_manipulation();

    $(document).on('shown.bs.modal', function(e) {
      $('input:visible:enabled:first', e.target).focus();
    });


  url_kec='<?php echo base_url() ?>reff/kelurahanbykec_id'
  cascade_dropdown(url_kec, 'kecamatan', 'kelurahan', false);      

});

$(function(){
    $('#mdl_add').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select,checkbox").val('').end();
        $('#roles').val('').trigger('chosen:updated');
        $('#kecamatan').val('').trigger('chosen:updated');
        $('#kelurahan').val('').trigger('chosen:updated');
    });
});

function delete_data(){
  delete_record("<?php echo base_url() ?>users/row_delete",'frm_list')
}

function editdata(id){
  editdata_popup(id, '<?php echo base_url() ?>users/editdata', 'edit_container', 'mdl_edit'); 
}

</script>

<style>
.chosen-container{
    width: 50% !important;
}	

</style>

<div class="wrapper-content ibox float-e-margins m-t animated fadeInDown">
    <!-- content here -->
      <div class="container">
          <div class="row">
                 <div class="box-header">
                      <div class="box-tools">
                              <div class="breadcrumbs ace-save-state" id="breadcrumbs" style="width:70%">
                                <button type="button" data-toggle="modal" data-target="#mdl_add" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button>

                                <div class="nav-search" id="nav-search">
                                    <span class="input-icon">
                                      <input type="text" name="searchText" id="keywords" onkeydown = "if (event.keyCode == 13) searchFilter() "  placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                      <i class="ace-icon fa fa-search nav-search-icon"></i>
                                    </span>
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
                    echo '<table id="myTable" style="width:70%"  class="table table-condensed table-bordered tablesorter">';
                    echo '<thead>
                        <tr>
                          <th style="text-align:right; width:3px" >#</th>
                          <th style="width:3px" ><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                          <th>User Name</th>
                          <th>Email</th>
                          <th>Full Name</th>
                          <th>Role</th>
                          <th style="width:3px">Action</th>
                        </tr>
                        </thead>
                    <tbody>';
                    $rec_no =1;
                    if(!empty($posts)){  
                        $status ='';  
                        foreach($posts as $row){
                         // $opd = $row['id_opd'];

                         echo '<tr>
                              <td scope="row" align="right" style="width:3%" >'.$rec_no.'. </td>
                              <td style="width:3px" scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['user_id'].' /></td>
                              <td ><a href="javascript:editdata('."'".$row['user_id']."'".')">'.$row['user_name'].'</a></td>
                              <td>'.$row['email'].'</td>
                              <td>'.$row['full_name'].'</td>
                              <td>'.$row['roles_name'].'</td>
                              <td style="width:3px" align="center"><a href="javascript:editdata('."'".$row['user_id']."'".')"><i style="font-size:16px;" class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
                            </tr>';
                        $rec_no++;    
                        }
                      }else{
                         echo '<tr><td colspan="7" class="bg-danger">Data not available or not found</td></tr>';
                      }  
                    echo '</table>';
                      ?>
                  </div>
                  <?php echo $this->ajax_pagination->create_links(); ?>        
              </div>
           </form>   
              <div class="col-xs-12 text-right">
                      <div class="form-group" style="width:70%">
                          <button type="button" onclick="add_new()"  data-toggle="modal" data-target="#mdl_add" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                          <button type="button" data-toggle="modal" data-target="#confirm_del" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Delete</button> 
                      </div>
               </div>
          </div>
      </div>


<div class="modal fade" tabindex="-1" id="mdl_add" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">User Management</h4>
      </div>
     <form id="frm_add" enctype="multipart/form-data" role="form">
      <div class="modal-body">
          <input type="hidden" id="user_id" name="user_id" > 
          <div class="form-group-sm">
               <label for="user_id">User Name:</label>
                <input type="text" required class="form-control" maxlength="35" style="width:60%" id="user_name" name="user_name">
          </div>
          <div class="form-group-sm">
               <label for="password"> Password:</label>
                <input type="password" style="width:30%" required class="form-control" maxlength="25" style="width:60%" id="Password" name="Password">
          </div>
          <div class="form-group-sm" data-validate="email">
               <label for="email"> Email:</label>
                <input type="email" required class="form-control" maxlength="128" style="width:60%" id="email" name="email">
          </div>
          <div class="form-group-sm" data-validate="full_name">
               <label for="full_name"> Full Name:</label>
                <input type="text" required class="form-control" maxlength="45" style="width:60%" id="full_name" name="full_name">
          </div>
          <div class="form-group" data-validate="role">
               <label for="email">User  Role:</label>
               <br/>
                <?php echo $dt_cbo_role ?>
          </div>

          <div class="form-group" data-validate="role">
            <label for="email">Kecamatan</label>
            <br/>
                <?php echo $dt_cbo_kec ?>
                <span id="loading_mini" style="display:none;">
                    <img src="<?php echo base_url().'assets/images/loading_small.gif'; ?>"/>
                    Loading data...
                </span>
          </div>

          <div class="form-group" data-validate="role">
               <label for="email">Kelurahan</label>
               <br/>
                <?php echo $dt_cbo_kel ?>
          </div>                                          
      </div>   
      <div class="modal-footer" style="text-align:right">
          <button type="submit" id="btnsave" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
          <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
      </div>
     </form>     
    </div><!-- /.modal-content -->
  </div> <!-- /.modal-dialog-->
</div><!-- /.modal -->

              <script language="javascript">
                  $('#frm_add').submit(function(e) {
                      var form = $(this);
                      var formdata = false;
                      if(window.FormData){
                          formdata = new FormData(form[0]);
                      }

                        if(document.getElementById('roles').value==''){
                          toastr.options = {
                                      timeOut: 3000,
                                      positionClass:"toast-top-center"
                                   };                            
                           toastr["warning"]("Rule tidak boleh kosong");
                           document.getElementById('roles').focus();
                           return false;
                        } 

                      var formAction = form.attr('action');
                      $.ajax({
                          type        : 'POST',
                          url         : '<?php echo base_url()?>users/savedata',
                          cache       : false,
                          data        : formdata ? formdata : form.serialize(),
                          contentType : false,
                          processData : false,
                          error : function(xhr, ajaxOptions, thrownError){
                              console.log(xhr.status);
                              console.log(xhr.responseText);
                              console.log(thrownError);
                          },
                          success : function(response){
                              toastr.options = {
                                      timeOut: 3000,
                                      positionClass:"toast-top-center"
                                   };                            
                               toastr["success"](response);
                               searchFilter(document.getElementById('page_pos').value);
                               $('#mdl_add').modal('hide');
                          }
                      });
                      e.preventDefault();
                  });
              </script>

       <div class="modal fade" id="confirm_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel">Delete Confirmation</h4>
                  </div>
                  <div class="modal-body">
                     Are you sore want to delete seleted data ?
                  </div>
                  <div class="modal-footer">
                        <button type="button"  onclick="delete_data()" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Yes</button>
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-ban"></i> No</button>
                  </div>
              </div>
          </div>
      </div> 

      <!-- Modal alert Popup -->
      <div class="modal fade success-popup" id="alert_dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              <h4 class="modal-title" id="myModalLabel">Input Validation</h4>
            </div>
            <div class="modal-body text-center">
               
                <p class="title">User Role is required. Please select from the list </p>
                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
            </div>
            
          </div>
        </div>
      </div>
<!-- Modal for Edit -->
<div class="modal fade" tabindex="-1" id="mdl_edit" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">User Management</h4>
      </div>
      <div class="modal-body" id="edit_container">
        <!-- form start here -->

        <!-- form end here -->
      </div><!-- .modal body -->
    </div><!-- /.modal-content -->
  </div> <!-- /.modal-dialog-->
</div><!-- /.modal -->
<!-- Modal for Edit end here -->

    <!-- content end here -->
  </div>
</div>




