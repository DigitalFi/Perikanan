
<script type="text/javascript">
$(document).ready(function() {
    $('.chosen-select', this).chosen({width: "100%"});
   // $('#article_type_edit').chosen({width: "40%"});   
    //$('#file_type_edit').chosen({width: "40%"});   


   $("#file_type_edit").change(function() {
        if(this.value=='1'){
          $("#div_file_edit").show();
          $("#div_url_edit").hide();
          $("#lbl_file_edit").text("File");
        }else{
          $("#div_file_edit").show();
          $("#div_url_edit").show();
          $("#lbl_file_edit").text("Cover Image");
        }
      $('#scroll_div_edit').scrollTop($('#scroll_div_edit')[0].scrollHeight - $('#scroll_div_edit')[0].clientHeight)  
    });

});


</script>
<style>
.custom-height-modal {
  height: 600px;
}
</style>
<form id="frm_edit" enctype="multipart/form-data" role="form">
  <div class="modal-body" id="scroll_div_edit" style="height:500px; width:100%; overflow-x:hidden; overflow-y: scroll; padding-bottom:10px;">
                  <input type="hidden" id="id_article" name="id_edit" value="<?php echo $dt_init->id_article ?>" > 
                  <!--modal content start here-->

                    <div class="form-group">
                      <label for="title">Judul Article</label>
                      <input type="text" class="form-control" id="title_edit" value="<?php echo $dt_init->title ?>" required name="title_edit" aria-describedby="emailHelp" placeholder="Edit judul article">
                      <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>
                    <div class="form-group">
                      <label for="short_desc">Ringkasan</label>
                      <input type="text" class="form-control" id="short_desc_edit" name="short_desc_edit" value="<?php echo $dt_init->short_description ?>" placeholder="Edit ringkasan singkat article">
                    </div>
                   
                    <div class="form-group">
                      <label for="short_desc">Detail Article</label>
                      <textarea class="form-control" id="article_content" required name="article_content_edit" rows="3"><?php echo $dt_init->article_content ?></textarea>
                      <script type="text/javascript">
                                              //<![CDATA[
                         CKEDITOR.replace( 'article_content_edit', {
                             extraPlugins: 'textindent',
                              height: 200,
                              //width : 700,

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
                      
                        <!-- <div class="col-md-4">
                            <div class="form-group">
                              <label for="Article Type">Article Untuk Kecamatan</label></br>
                              <?php echo $cbo_kecamatan ?>
                           </div>
                         </div> -->

                          <div class="col-md-4">
                           <label for="File Type">File Type</label></br>
                           <?php echo $cbo_file_type ?>
                        </div>

                      </div>  
                    </div>

                    <?php
                      if($dt_init->id_file_type=='1'){
                         $visibility = "style='display: none;'";
                      }else{
                         $visibility ='';
                      }
                    ?>
                 
                    <div class="form-group">
                      <div class="row">
                        <div class="col-md-6">
                          <label id="lbl_file_edit" for="file">File</label>
                          <input type="file" class="form-control" id="the_file" name="the_file_edit" >
                          <div><img style="width:30%" src="<?php echo base_url()?>img/<?php echo $dt_init->file_name ?>" class="img-responsive">
                          </div>
                        </div>  
                      </div>  
                    </div>

                    <div class="form-group" <?php echo $visibility ?> id="div_url_edit">
                      <label for="short_desc">Video Url</label>
                        <input type="text" value="<?php echo $dt_init->video_url ?>" class="form-control" id="url_edit" name="url_edit" placeholder="Input video url">
                    </div>

            </div>
            <div class="modal-footer">
              <button type="submit" onclick="CKupdate()" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Update</button>
              <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
            </div>
      <!-- modal add role end -->
       <script>

            function CKupdate(){
                for ( instance in CKEDITOR.instances )
                    CKEDITOR.instances[instance].updateElement();
            }

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
                    url         : '<?php echo base_url()?>admpage/article/update_article',
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
                       searchFilter(document.getElementById('page_pos').value);
                       $('#mdl_edit').modal('hide');
                    }
                });
                e.preventDefault();
            });
        </script>
</form>

