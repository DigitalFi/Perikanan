<!-- <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/style_drag_drop.css" media="screen" /> -->
<!-- <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/ui.easytree.css" media="screen" /> -->

 <!-- <script src="<?php echo base_url()?>assets/js/jquery-ui.min.js"></script> -->
<!-- <script src="<?php echo base_url()?>assets/js/jquery.easytree.min.js"></script>  -->


  <link href="<?php echo base_url()?>assets/css/ui.fancytree.css" rel="stylesheet">
  <script src="<?php echo base_url()?>assets/js/jquery.fancytree.ui-deps.js"></script>
  <script src="<?php echo base_url()?>assets/js/jquery.fancytree.js"></script>
  <script src="<?php echo base_url()?>assets/js/jquery.fancytree.dnd.js"></script>
  <script src="<?php echo base_url()?>assets/js/jquery.fancytree.edit.js"></script>

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


<script type="text/javascript">
  $(function(){
    // Attach the fancytree widget to an existing <div id="tree"> element
    // and pass the tree options as an argument to the fancytree() function:
    $("#front_menu_tree").fancytree({
      checkbox: true,
      activeVisible: true,
      extensions: ["dnd", "edit"],
       titlesTabbable: true,
      click: function(event, data) {
        //logEvent(event, data, ", targetType=" + data.targetType);
        // return false to prevent default behavior (i.e. activation, ...)
        //return false;

       // alert(data.node.getLevel());
        //alert(node.countChildren);
/*
        if(node.getLevel() = 2) {
           
        }*/
 alert(data.node.title);
        
      },
      dnd: {
        autoExpandMS: 400,
        focusOnClick: true,
        preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
        preventRecursiveMoves: true, // Prevent dropping nodes on own descendants
        dragStart: function(node, data) {
          /** This function MUST be defined to enable dragging for the tree.
           *  Return false to cancel dragging of node.
           */
          return true;
        },
        dragEnter: function(node, data) {

          /** data.otherNode may be null for non-fancytree droppables.
           *  Return false to disallow dropping on node. In this case
           *  dragOver and dragLeave are not called.
           *  Return 'over', 'before, or 'after' to force a hitMode.
           *  Return ['before', 'after'] to restrict available hitModes.
           *  Any other return value will calc the hitMode from the cursor position.
           */
          // Prevent dropping a parent below another parent (only sort
          // nodes under the same parent)
/*           if(node.parent !== data.otherNode.parent){
            return false;
          }
          // Don't allow dropping *over* a node (would create a child)
          return ["before", "after"];
*/
           return true;
        },
        dragDrop: function(node, data) {
          alert('test');
          /** This function MUST be defined to enable dropping of items on
           *  the tree.
           */
          data.otherNode.moveTo(node, data.hitMode);
        }
      },
      activate: function(event, data) {
//        alert("activate " + data.node);
      },
      lazyLoad: function(event, data) {
        data.result = {url: "ajax-sub2.json"}
      }
    });
  });
</script>

<div class="container">
          <div class="row">
                 
            <form id="frm_list" > 
            <input type="hidden" id="page_pos">      
            <div id="messages" ></div>
            <div class="post-list" id="postList">
                 <!-- <div id="list_data_container" style="width:400px; height:400px; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;"> -->
                  <div id='front_menu_tree' style="width:50%;">
                    <?php echo display_tree_menu() ?>
                  </div>
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


