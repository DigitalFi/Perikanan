<script type="text/javascript">
$(document).ready(function() {
    $('.chosen-select', this).chosen({width: "100%"});
});


</script>
<style>
.custom-height-modal {
  height: 600px;
}
</style>
<form id="frm_edit" enctype="multipart/form-data" role="form">
  <div class="modal-body" id="scroll_div_edit" style="height:500px; width:100%; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;">
                  <input type="hidden" id="id_menu" name="id_menu" value="<?php echo $dt_init->id_menu ?>" > 
                  <!--modal content start here-->

                    <div class="form-group">
                      <label for="menuname">Menu name</label>
                      <input type="text" class="form-control" value="<?php echo $menu_label ?>" id="menuname"  required name="menuname" aria-describedby="emailHelp" placeholder="Url page">
                      <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                    <div class="form-group">
                      <label for="title">URL Page</label>
                      <input type="text" class="form-control" value="<?php echo $link_menu ?>" id="urlpage"  required name="urlpage" aria-describedby="emailHelp" placeholder="Url page">
                      <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>

                    <div class="row">
                      <div class="form-group">
                        <label for="short_desc">Page name</label></br>
                        <?php echo $cbo_page ?>
                        
                      </div>
                     
                      <div class="form-group">
                        <label for="short_desc">Article name</label></br>
                        <?php echo $cbo_article ?>
                        
                      </div>
                    </div>
                     
 
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Update</button>
              <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
            </div>
      <!-- modal add role end -->
       <script>

                $('#frm_edit').submit(function(e) {
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }
                toastr.options = {
                  timeOut: 3000,
                  positionClass:"toast-top-center"
                };

                if($('#article_type_edit').val()==''){
                  toastr["error"]("Article Type belum dipilih");
                  $('#article_type_edit').trigger('chosen:open');
                  return false;
                }

                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>admpage/front_menu/setting_menu',
                    cache       : false,
                    data        : formdata ? formdata : form.serialize(),
                    dataType    : 'json',
                    contentType : false,
                    processData : false,
                    error : function(xhr, ajaxOptions, thrownError){
                        console.log(xhr.status);
                        console.log(xhr.responseText);
                        console.log(thrownError);
                    },
                    success : function(response){
                                                  
                        if(response['error']=='true'){                                     
                          toastr["error"](response['msg']);
                        }else{
                          toastr['success'](response['msg']);
                        }                                       
                       $('#mdl_edit').modal('hide');
                    }
                });
                e.preventDefault();
            });
        </script>
</form>

