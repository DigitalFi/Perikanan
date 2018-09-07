<link rel="stylesheet" type="text/css" href="<?php echo base_url()?>assets/css/style_drag_drop.css" media="screen" />
<script src="<?php echo base_url()?>assets/js/jquery-ui.min.js"></script>
<script>
$(document).ready(function() {
  $('.chosen-select', this).chosen({width: "100%"});

    $(document).on('shown.bs.modal', function(e) {
      $('input:visible:enabled:first', e.target).focus();
    });

  $("#page_type").change(function() {
        if(this.value=='N'){
          $("#div_dtl_of").show();
          $('#template').trigger('chosen:open');
          $("#tmplate_dtl").show();
        }else{
          $("#div_dtl_of").hide();
          $("#tmplate_dtl").hide();
        }
  });
});
</script>
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
                          echo '<li style="padding-right:2px" value='.$dt_template['nm_template'].' class="sortable-item" id='.$dt_template['id_template'].'><i id="chkmark_'.$dt_template['id_template'].'" style="display:none"  class="fa fa-check pull-left"></i>'.$dt_template['nm_template'].'
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

                <div id="tmplate_dtl" class="col-md-4" style="display: none">
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
               $('#chkmark_'+idx+'').show();
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
                   templateid=ui.item.attr("id");
                   get_existing_config(templateid);


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


            function get_existing_config(templateid){
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
                       $("#txt_selected_temp_"+templateid+"").val(data);
                  }
              });
            }

          </script>

        <!--modal content end here-->
</div>
<div class="modal-footer">
    <button type="submit" id="btnsave" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Processing Data" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
    <button type="button" class="btn btn-danger btn-sm" onclick="$('#mdl_add').modal('hide');" ><i class="fa fa-close"></i> Close</button>
</div>
</form>
<script>
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

                if($('#page_type').val()==''){
                  toastr["error"]("Type halaman belum dipilih");

                  $('#page_type').trigger('chosen:open');
                  return false;
                }

                if($('#page_type').val()=='N'){
                  if($("#template_id").val()==''){
                        toastr["error"]("Detail dari belum dipilih");
                        $('#template_id').trigger('chosen:open');
                        return false;
                  }
                }

                if($('#page_type').val()=='N'){
                  if($('#selected_template li').size()==0){
                    $("#selected_template").removeClass("animated bounce");
                    toastr["error"]("Default Template belum dipilih");
                    $("#selected_template").addClass("animated bounce");
                   
                    return false;
                  }
                }
                  var item_to_check = getItems_individual('#selected_template li');
                  var arrID = item_to_check.split(','); 
                  var isItemBlank = false;
                  $.each(arrID, function(index, value) {
                    arrData = value.split('|');
                    id = arrData[0];
                    theval = arrData[1];
                    $("#"+id+"").removeClass("animated bounce");
                    if($("#txt_selected_temp_"+id+"").val()==''){
                      toastr["error"]("Article untuk "+theval+" belum dipilih");
                      $("#"+id+"").addClass("animated bounce");
                      isItemBlank = true;
                    }
                 });

                 if(isItemBlank==true){
                    return false;
                 } 


                if($('#page_type').val()=='N'){
                  if($('#tmplate_dtl li').size()==0){
                    $("#tmplate_dtl").removeClass("animated bounce");
                    toastr["error"]("Template detail belum dipilih");
                    $("#tmplate_dtl").addClass("animated bounce");
                   
                    return false;
                  }
                }

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