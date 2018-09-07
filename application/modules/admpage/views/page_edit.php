<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/style_drag_drop.css" media="screen" />
<script src="<?php echo base_url()?>assets/js/jquery-ui.min.js"></script>
<script>
$(document).ready(function() {
  $('.chosen-select', this).chosen({width: "100%"});

    $(document).on('shown.bs.modal', function(e) {
      $('input:visible:enabled:first', e.target).focus();
    });

$('#mdl_article_edit').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select,checkbox").val('').end();
        $('#article_id_edit').val('').trigger('chosen:updated');
        $('body').addClass('modal-open');
    });



  $("#page_type_edit").change(function() {
        if(this.value=='N'){
          $("#div_dtl_of_edit").show();
          $('#template_edit').trigger('chosen:open');
          $("#tmplate_dtl_edit").show();
        }else{
          $("#div_dtl_of_edit").hide();
          $("#tmplate_dtl_edit").hide();
        }
  });
});


</script>
<style>
#mdl_edit {
top:-25px;
}

.modal-open {
  overflow: inherit;
}

.modal-close {
  overflow: inherit;
}

</style>
<form id="frm_edit" enctype="multipart/form-data" role="form">
<div class="modal-body" style="height:550px; width:100%; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;">
  <!--modal content start here-->
  		<input type="hidden" id="id_page" name="id_edit" value="<?php echo $hdrInfo->id_pages ?>" > 
      <input type="hidden" id="id_article_coll_edit" name="id_article_coll_edit" > 
      <input type="hidden" id="count_default_temp_edit" name="count_default_temp_edit" > 
      <input type="hidden" id="selected_item_edit" name="selected_item_edit" > 
        <div class="form-group">
          <label for="Page Name">Nama Halaman</label>
          <input type="text" class="form-control" required id="nm_page_edit" value="<?php echo $hdrInfo->nm_page ?>" name="nm_page_edit" placeholder="Input nama halaman">
        </div> 

        <div class="row" style="width:50%">  
          <div class="col-md-4">
            <div class="form-group">
              <label for="Page Name">Halaman Utama?</label><br>
              <select id="page_type_edit" name="page_type_edit" data-placeholder="Choose an option" class="chosen-select" tabindex="2">
                    <option value=""></option>
                    <option <?php if($hdrInfo->main_page=='Y'){ echo 'selected'; }?> value="Y">Yes</option>
                    <option <?php if($hdrInfo->main_page=='N'){ echo 'selected'; }?> value="N">No</option>
              </select>                      
            </div> 
          </div>                   
          
          <?php if($hdrInfo->main_page=='Y'){ 
              $template_display ='style="display: none;"'; 
              }else{
                $template_display ="";
              }
          ?>
          <div class="col-md-8">
            <div id="div_dtl_of_edit" class="form-group" <?php echo $template_display ?>>
              <label for="Page Name">Detail Dari</label><br>
              <?php echo $cbo_template ?>                      
            </div>
          </div>
        </div>

          <div id="example-1-3-edit">
              <div class="row" >
                <div  class="col-md-4"> 
                  <label for="Page Name">Available Template</label><br>
                  <?php
                      echo '<div id="template_list_edit" class="column left first" style="width:250px;">';
                      echo '<ul class="sortable-list">';
                      foreach($available_template as $dt_template){
                          echo '<li style="padding-right:2px" value='.$dt_template['nm_template'].' class="sortable-item" id='.$dt_template['id_template'].'><i id="chkmark_edit_'.$dt_template['id_template'].'" style="display:none"  class="fa fa-check pull-left"></i>'.$dt_template['nm_template'].'
                          &nbsp;<button onclick="fill_selected_temp_id('.$dt_template['id_template'].');" id="btn_link_edit_'.$dt_template['id_template'].'" style="display:none" type="button" class="btn btn-danger btn-xs pull-right" data-toggle="modal" data-target="#mdl_article_edit"><i class="fa fa-link"></i></button>
                            <input type="hidden" id="txt_selected_temp_edit_'.$dt_template['id_template'].'" name="txt_selected_temp_edit_'.$dt_template['id_template'].'">
                          </li>';
                      }
                      echo '</ul>';
                      echo '</div>';
                  ?>
                </div>
                <div class="col-md-4"> 
                  <label for="Page Name">Default Template</label><br>
                  <div id="selected_template_edit" class="column left" style="width:250px;">
                    <ul class="sortable-list">
                    <?php
                            foreach($selected_template as $seltemp){
                              $temp_article = $seltemp['id_template']."|".$seltemp['id_article'];
                              if($temp_article==''){
                                $display = "";
                              }else{
                                $display = "style='display:none'";
                              }  

                                echo '<li style="padding-right:2px" value='.$seltemp['nm_template'].' class="sortable-item" id='.$seltemp['id_template'].'><i id="chkmark_edit_'.$seltemp['id_template'].'" "'.$display.'" class="fa fa-check pull-left"></i>'.$seltemp['nm_template'].'
                          &nbsp;<button onclick="fill_selected_temp_id('.$seltemp['id_template'].');" id="btn_link_edit_'.$seltemp['id_template'].'"  type="button" class="btn btn-danger btn-xs pull-right" data-toggle="modal" data-target="#mdl_article_edit"><i class="fa fa-link"></i></button>
                            <input type="hidden" value="'.$temp_article.'" id="txt_selected_temp_edit_'.$seltemp['id_template'].'" name="txt_selected_temp_edit_'.$seltemp['id_template'].'">
                          </li>';
                            }
                    ?>
                    </ul>
                  </div>
                </div>

                <div id="tmplate_dtl_edit" class="col-md-4" <?php echo $template_display ?>>
                  <label for="Page Name">Template Detail</label><br>
                  <div  class="column left" style="width:250px;">
                    <ul id="dtltemplate_edit" class="sortable-list">
                      <?php if(isset($template_used->nm_template)){?>
                  		  <li style="padding-right:2px" value="<?php echo (isset($template_used->nm_template))? $template_used->nm_template :'';?>" class="sortable-item" id="<?php echo (isset($template_used->id_template))? $template_used->id_template :''; ?>"><?php echo (isset($template_used->nm_template))?$template_used->nm_template:'' ?>
                      <?php }?>
                    </ul>
                  </div>
                </div>  
              </div>    
          </div>                    
          <script type="text/javascript">

            function getSelected_item(idx){
              $('#txt_selected_temp_edit_'+idx+'').val($('#selected_temp_id_edit').val()+'|'+$("#article_id_edit").chosen().val());
               $('#chkmark_edit_'+idx+'').show();
              $('#mdl_article_edit').modal('hide');
            }

            function fill_selected_temp_id(seltempid){
              $('#selected_temp_id_edit').val(seltempid);
            }

          $(document).ready(function(){
            var oldList_edit, newList_edit, item_edit;
            // Example 1.3: Sortable and connectable lists with visual helper
            $('#example-1-3-edit .sortable-list').sortable({
              connectWith: '#example-1-3-edit .sortable-list',
              placeholder: 'placeholder',
                start: function(event, ui) {
                    item_edit = ui.item;
                    newList_edit = oldList_edit = ui.item.parent().parent();
                },                          
                stop: function (evt, ui) {
                  templateid=ui.item.attr("id");
                  get_existing_config_edit(templateid);
                  if($('#dtltemplate_edit li').size()>1){
                      toastr.options = {
                              timeOut: 3000,
                              positionClass:"toast-top-center"
                      };
                      toastr['error']('Accept only one template');


                      return false;
                  }
                    if($('#selected_template_edit li').size()>0){
                      if(newList_edit.attr('id')=='selected_template_edit'){
                         id_obj = ui.item.attr("id");
                         $('#btn_link_edit_'+id_obj+'').show();

                         //alert("Moved " + id_obj + " from " + oldList_edit.attr('id') + " to " + newList_edit.attr('id'));
                      }
                    }

                   if(newList_edit.attr('id')=='template_list_edit'){
                        id_obj = ui.item.attr("id");
                         $('#btn_link_edit_'+id_obj+'').hide();
                         //alert("Moved " + id_obj + " from " + oldList_edit.attr('id') + " to " + newList_edit.attr('id'));
                   }

                   $('#count_default_temp_edit').val(($('#selected_template_edit li').length));
                },
                change: function(event, ui) {  
                      if(ui.sender) newList_edit = ui.placeholder.parent().parent();
                },
            });

          });

          // Example 2.1: Get items
            $('#example-1-3-edit .sortable-list').sortable({
              connectWith: '#example-1-3-edit .sortable-list'
            });

            function get_existing_config_edit(templateid){
               $('.loading').show();  
               $.ajax({
                  type: "POST",
                  url: '<?php base_url()?>page/get_template_existing_setting',
                  data: {template_id:templateid}, 
                  error : function(xhr, ajaxOptions, thrownError){
                      console.log(xhr.status);
                      console.log(xhr.responseText);
                      console.log(thrownError);
                  },
                  success : function(data){
                       $('.loading').hide();
                       $("#txt_selected_temp_edit_"+templateid+"").val(data);
                  }
              });
            }

          </script>

        <!--modal content end here-->
</div>
<div class="modal-footer">
    <button type="submit" id="btn_update" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Data" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
    <button type="button" class="btn btn-danger btn-sm" onclick="$('#mdl_edit').modal('hide');" ><i class="fa fa-close"></i> Close</button>
</div>
</form>
<script>
            $('#frm_edit').submit(function(e) {
                var selected_template_edit = getItems('#example-1-3-edit');
                $('#selected_item_edit').val(selected_template_edit);
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }
                  toastr.options = {
                    timeOut: 3000,
                    positionClass:"toast-top-center"
                  };

                if($('#page_type_edit').val()==''){
                  toastr["error"]("Type halaman belum dipilih");

                  $('#page_type_edit').trigger('chosen:open');
                  return false;
                }

                if($('#page_type_edit').val()=='N'){
                  if($("#template_id_edit").val()==''){
                        toastr["error"]("Detail dari belum dipilih");
                        $('#template_id_edit').trigger('chosen:open');
                        return false;
                  }
                }

                if($('#page_type_edit').val()=='N'){
                  if($('#selected_template_edit li').size()==0){
                    $("#selected_template_edit").removeClass("animated bounce");
                    toastr["error"]("Default Template belum dipilih");
                    $("#selected_template_edit").addClass("animated bounce");
                   
                    return false;
                  }
                }

                  var item_to_check = getItems_individual('#selected_template_edit li');
                  var arrID = item_to_check.split(','); 
                  var isItemBlank = false;
                  $.each(arrID, function(index, value) {
                    arrData = value.split('|');
                    id = arrData[0];
                    theval = arrData[1];
                    $("#"+id+"").removeClass("animated bounce");
                    if($("#txt_selected_temp_edit_"+id+"").val()==''){
                      toastr["error"]("Article untuk "+theval+" belum dipilih");
                      $("#"+id+"").addClass("animated bounce");
                      isItemBlank = true;
                    }
                 });

                 if(isItemBlank==true){
                    return false;
                 } 

                if($('#page_type_edit').val()=='N'){
                  if($('#tmplate_dtl_edit li').size()==0){
                    $("#tmplate_dtl_edit").removeClass("animated bounce");
                    toastr["error"]("Template detail belum dipilih");
                    $("#tmplate_dtl_edit").addClass("animated bounce");
                   
                    return false;
                  }
                }

                $('#btn_update').button('loading');
                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>admpage/page/update_page',
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
                      $('#btn_update').button('reset');
                        if(response['error']=='true'){                                     
                          toastr["error"](response['msg']);
                          return false;
                        }else{
                          toastr['success'](response['msg']);
                          searchFilter(document.getElementById('page_pos').value);
                          $('#mdl_edit').modal('hide');
                         }                                       
                   }

                });
                e.preventDefault();
            });
        </script>

        <div class="modal fade" id="mdl_article_edit" tabindex="-1" role="dialog" aria-labelledby="mdl_roleLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="mdl_roleLabel">List Article</h4>
                  </div>
                  <div class="modal-body">
                    <input type="hidden" id="selected_temp_id_edit">
                     <div id="div_dtl_of_edit" class="form-group" >
                          <label for="Page Name">Detail Dari</label><br>
                          <?php echo $cbo_article ?>                      
                      </div>
                  </div>
                  <div class="modal-footer">
                    <?php $hal = $this->uri->segment(4); ?>
                       <button type="button" onclick="getSelected_item($('#selected_temp_id_edit').val())" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Corfirm</button>
                        <button type="button"  class="btn btn-danger btn-sm" onclick="$('#mdl_article_edit').modal('hide');" ><i class="fa fa-ban"></i> Close</button>
                  </div>
              </div>
          </div>
      </div>        