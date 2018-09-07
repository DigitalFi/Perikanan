
<script type="text/javascript">
$(document).ready(function() {
    $('.chosen-select', this).chosen({width: "40%"});
});
</script>
<form id="frm_edit" enctype="multipart/form-data" role="form">
  <div class="modal-body">
      <input type="hidden" id="role_id" value="<?php echo $dtrole->roles_id ?>" name="role_id" > 
      <!--modal content start here-->
      <div class="form-group-sm">
         <label for="menutext">Role Name:</label>
          <input type="text" value="<?php echo $dtrole->roles_name ?>" required class="form-control" maxlength="150" style="width:60%" id="roles_name" name="roles_name">
      </div>
      <div class="form-group-sm">
         <label for="menutext"> Description:</label>
          <input type="text" value="<?php echo $dtrole->roles_desc ?>" class="form-control" maxlength="255" style="width:60%" id="roles_desc" name="roles_desc">
      </div>
      <div class="form-group" data-validate="role">
         <label for="menu_access">Menu will be able  to Access:</label>
         <br/>
          <?php echo $dt_cbo_menu ?>
      </div>  
  </div>
  <div class="modal-footer">
      <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Update</button>
      <button type="button" onclick="$('#list_continer').show('slow'); $('#edit_container').hide('slow')" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
  </div>
      <!-- modal add role end -->
       <script>
            $('#frm_edit').submit(function(e) {
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }
                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>users/user_roles/updatedata',
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
                                  positionClass:"toast-bottom-right"
                               };                            
                       toastr["info"](response);
                       searchFilter(document.getElementById('page_pos').value);
                       $('#mdl_edit').modal('hide');
                    }
                });
                e.preventDefault();
            });
        </script>
</form>

