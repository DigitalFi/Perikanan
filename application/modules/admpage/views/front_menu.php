<script src="<?php echo base_url()?>assets/js/jquery.treemenu.min.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery-ui.min_.js"></script>
<!-- <script src="<?php echo base_url()?>assets/js/jquery-sortable.js"></script> -->
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/jquery.treemenu.min.css">    
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/jquery-ui.css">

<script>
  
 $(function(){
        $("#tree1").treemenu({'delay': 200});
 });

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

      $(document).on('shown.bs.modal', function(e) {
        $('input:visible:enabled:first', e.target).focus();
      });

   
  });

  function delete_data(){
    delete_record("<?php echo base_url() ?>admpage/page/row_delete",'frm_list')
  }

  function editdata(id){
    editdata_popup(id, '<?php echo base_url() ?>admpage/front_menu/editdata', 'edit_container', 'mdl_edit'); 
  }

</script>
<style>
    .sortable {
        
        width: 80%;
        min-height: 20px;
        list-style-type: none;
        padding-bottom: 5px;
      }
      .sortable li{
        margin: 0 5px 5px 5px;
        padding-bottom: 5px;
        padding: 5px;
        font-size: 14px;
        width: 90% ;
      }  

  </style>
<div class="container">
          <div class="row">
                 
            <form id="frm_list" > 
            <input type="hidden" id="page_pos">      
            <div id="messages" ></div>
            <div class="post-list" id="postList">
                 <!-- <div id="list_data_container" style="width:400px; height:400px; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;"> -->
                    <?php echo display_tree_menu() ?>
                <!-- </div> -->
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
                  

              <!--modal content end here-->
            </div>
            <div class="modal-footer">
                          <button type="button" onclick="save_data(getItems('#example-1-3'))"  id="btnsave" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Data" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
                          <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
            </div>
          </form>
          </div>
        </div>
      </div>
      <!-- modal add role end -->
       <script>
          function save_data(item_template){

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
                data: { the_data: item_template, pg_name:$('#nm_page').val(), pg_type:$('#page_type').val(), template_id:$('#template_id').val() }, 
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
          }
        </script>
      


      <!-- modal edit role -->
      <div class="modal fade" id="mdl_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="exampleModalLabel">Menu Setting</h4>
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


