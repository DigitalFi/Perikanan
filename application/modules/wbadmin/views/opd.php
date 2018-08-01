<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/chosen.jquery.min.js"></script>

<script src="<?php echo base_url()?>assets/js/choosen/init.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery.tablesorter.min.js"></script>
<script src="<?php echo base_url()?>assets/js/moment.js"></script>
<script src="<?php echo base_url()?>assets/js/bootstrap-datetimepicker.js"></script>

<link href="<?php echo base_url()?>assets/css/tblsorter/tblsorter.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/prism.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/chosen.min.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css">


<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    document.getElementById('page_pos').value=page_num;  
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>wbadmin/opd/ajaxPaginationData/'+page_num,
        data:'page='+page_num+'&keywords='+keywords+'&sortBy='+sortBy,
        beforeSend: function () {
            $('.loading').show();
        },
        success: function (html) {
            $('#postList').html(html);
            $('.loading').fadeOut("slow");
        }
    });
}

$(document).ready(function() {
  $('#myModal').on('show.bs.modal', function(e) {
    $('.chosen-select', this).chosen({width: "40%"});
  });
});

function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
}

function add_new(){
  document.getElementById('flag_save').value='1';
}


$('document').ready(function()
{
    $('.select-all').click(function(){
        if(this.checked)
            $(".chk-box").prop("checked", true);
        else
            $(".chk-box").prop("checked", false);
    });
        
    $(".chk-box").click(function()
    {
        if($(".chk-box").length == $(".chk-box:checked").length)
        {
            $(".select-all").prop("checked", true);
        }
        else
        {
            $(".select-all").removeAttr("checked");
        }
    });
});

$(document).ready(function() { 
    $("table").tablesorter({ 

        widgets: ['zebra'],
        // pass the headers argument and assing a object 
        headers: { 
            // assign the secound column (we start counting zero) 
            0: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
            1: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            }, 
            // assign the third column (we start counting zero) 
            6: { 
                // disable it by setting the property sorter to false 
                sorter: false 
            } 
        } 
    }); 
});


function delete_data () {
  var data = $("#frm_page_list").serialize(); 
    $.ajax({
        url: "<?php echo base_url() ?>wbadmin/opd/row_delete", // link of your "whatever" php
        type: "POST",
        async: true,
        cache: false,
        data: data, // all data will be passed here
        success: function(response){ 
            $('#confirm_del').modal('hide');
            showAlert('messages', 'success', response, 5000) ;
            searchFilter(document.getElementById('page_pos').value);
        }
    });
 }

 function showAlert(containerId, alertType, message, delay_time) {
    $("#" + containerId).append('<div style="position:fixed;top: 50%;left: 40%;" class="alert alert-' + alertType + '" id="alert' + containerId + '">' + message + '</div>');
    $("#alert" + containerId).alert();

    window.setTimeout(function () { $("#alert" + containerId).alert('close'); }, delay_time);
}

$(function(){
    $('#myModal').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select").val('').end();
         $('#section').val('').trigger('chosen:updated');  

    });
});

function get_data(id){
    var url;
    var nmsection ;
    var arr_section;

    url= '<?php echo base_url() ?>wbadmin/opd/get_article_data';
    $('#flage_save').val('2');
    $.post(url, {
         article_id : id
    }, function(response){
        var obj = $.parseJSON(response);
        $.each(obj, function() {
            $('#hdn_article_id').val(this['fe_content_id']);
            $('#nm_opd').val(this['fe_content_title']);
            $('#no_arsip').val(this['fe_content_short_desc']);
            $('#judul_arsip').val(this['fe_full_content']);
            $('#txt_tgl_terbit').val(this['tgl_arsip']);
            $('#nm_opd').val(this['fe_section_name']).trigger('chosen:updated');
            $('#myModal').modal('show'); 
         });
    });
}

</script>

<style>
  #sortable1, #sortable2 {
    border: 1px solid #eee;
    width: 210px;
    min-height: 50px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
    cursor: move;
  }
  #sortable1 li, #sortable2 li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 200px;
  }

  .ui-sortable-placeholder { 
     background:yellow !important; 
     height: 40px !important; // this is the key, set your own height, start with small
     visibility: visible !important;
     boder: 1px dotted;
     margin: 0 0 -10px 0; // additionaly, you can position your placeholder, 
     }  
  </style>
<div class="container">
<input type="hidden" id ="tags" name="tags" /> 
<input type="hidden" id ="secnm" name="secnm" />

    <div class="row">
           <div class="box-header">
                <h4 class="box-title">Organisasi Perangkat Daerah</h4>
                <div class="box-tools">
                        <div class="loading" style="display: none; position: absolute;left: 50%;top: 50%;">
                            <div class="content">
                                <img src="<?php echo base_url().'assets/images/loader/loading.gif'; ?>"/>
                            </div>
                        </div>
                         <div class="input-group">
                             <button type="button" onclick="add_new()"   data-toggle="modal" data-target="#myModal" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                            <input type="text" onkeydown = "if (event.keyCode == 13) searchFilter() "    
                            name="searchText" id="keywords"  class="form-control input-sm pull-right" style="width: 200px; " placeholder="Search"/>
                           <div class="input-group-btn">
                                <button style="height: 30px; margin-top: -4px" onclick="searchFilter()" class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                </div>
            </div><!-- /.box-header -->
     <form id="frm_page_list" > 
        <input type="hidden" id="page_pos">      
         <div id="messages" ></div>
        <div class="post-list" id="postList">
             <div id="list_data_container">
              <?php
              echo '<table id="myTable"  class="table table-condensed table-bordered tablesorter">';
              echo '<thead>
                  <tr>
                    <th>#</th>
                    <th><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                    <th>Nama OPD</th>
                    <th>Nomer Arsip</th>
                    <th>Judul/Nama Arsip</th>
                    <th>Tanggal Terbit Arsip</th>
                    <th>Action</th>
                  </tr>
                  </thead>
              <tbody>';
              $rec_no =1;
              if(!empty($posts)){  
                  $status ='';  
                  foreach($posts as $row){
                      if($row['status_active']=='Y'){
                        $status = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>';
                      }else{
                        $status = '<i class="fa fa-square-o fa-2x" aria-hidden="true"></i>';
                      }
                   echo '<tr>
                        <td scope="row">'.$rec_no.'</td>
                        <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content[]" value='.$row['fe_content_id'].' /></td>
                        <td ><a href="javascript:get_data('."'".$row['fe_content_id']."'".')">'.$row['fe_content_title'].'</a></td>
                        <td>'.$row['fe_content_short_desc'].'</td>
                        <td>'.$row['fe_full_content'].'</td>
                        <td>'.indonesian_date($row['display_start_from'],'d/m/Y','').'</td>
                        <td align="center"><a href="javascript:get_data('."'".$row['fe_content_id']."'".')"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
                      </tr>';
                  $rec_no++;    
                  }
                }else{
                   echo '<tr><td colspan="8" class="bg-danger">Data not available or not found</td></tr>';
                }  
              echo '</table>';
                ?>
            </div>
            <?php echo $this->ajax_pagination->create_links(); ?>        
        </div>
     </form>   
        <div class="col-xs-12 text-right">
                <div class="form-group">
                    <button type="button" onclick="add_new()"  data-toggle="modal" data-target="#myModal" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                    <button type="button"  data-toggle="modal" data-target="#confirm_del" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Delete</button> 
                </div>
         </div>
    </div>
</div>

<!-- modal upload -->
     <div class="container">
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="padding-left: 15px; padding-right:10px">
                        <form id="frm_add_article" enctype="multipart/form-data" role="form">
                       
                        <input type="hidden" id ="flag_save" name="flag_save" />
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title">Manage OPD</h4>
                            </div>
                                      <input type="hidden" id="hdn_article_id" name="hdn_article_id" > 
                                          <div class="form-group-sm">
                                               <label for="menutext">Nama OPD:</label>
                                               <BR>
                                               <?php  echo $dt_cbo_opd; ?>
                                               <!--  <input type="text" class="form-control" maxlength="150" style="width:60%" id="nm_opd" name="nm_opd" required> -->
                                          </div>
                                          <div class="form-group-sm">
                                               <label for="menutext">Nomer Arsip:</label>
                                                <input type="text" class="form-control" maxlength="255" style="width:60%" id="no_arsip" name="no_arsip" required>
                                          </div>
                                        <div class="form-group-sm">
                                            <label for="menutext">Judul/Nama Arsip:</label>
                                            <input type="text" class="form-control" maxlength="255" style="width:60%" id="judul_arsip" name="judul_arsip" required>
                                        </div>
                                          <div class="form-group-sm">
                                               <label for="menutext">Tgl. Terbit Arsip:</label>
                                                <div style="width: 20%" class='input-group date' id='tgl_terbit'>
                                                   <input type='text' id="txt_tgl_terbit" name="txt_tgl_terbit" required class="form-control" />
                                                    <span class="input-group-addon">
                                                          <span class="glyphicon glyphicon-calendar">  </span>
                                                    </span>
                                              </div>
                                          </div>
                                           <script type="text/javascript">
                                            $(function () {
                                               $('#tgl_terbit').datetimepicker({
                                                    format: 'DD/MM/YYYY',
                                                    widgetPositioning: {
                                                                horizontal: 'left',
                                                                vertical: 'top'
                                                     }
                                                  });                                                
                                            });
                                        </script>                                       
                                           
                            <!--modal content end here-->
                                          <div class="modal-footer" style="text-align:right">
                                              <button type="submit" class="btn btn-success btn-sm"><i class="fa fa-save"></i> Save</button>
                                              <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
                                          </div>
                                          </div>
                      </form>  
                          
                    </div>
                </div>
            </div>

        </div>

       <script>
            $('#frm_add_article').submit(function(e) {

               
                var form = $(this);
                var formdata = false;
                if(window.FormData){
                    formdata = new FormData(form[0]);
                }

                var formAction = form.attr('action');
                $.ajax({
                    type        : 'POST',
                    url         : '<?php echo base_url()?>wbadmin/opd/upload_data',
                    cache       : false,
                    data        : formdata ? formdata : form.serialize(),
                    contentType : false,
                    processData : false,

                    success: function(response) {
                        if(response != 'error') {
                          showAlert('messages', 'success', response, 5000) ;
                          searchFilter(document.getElementById('page_pos').value);
                          $('#myModal').modal('hide');
                         } else {
                            $('#messages').addClass('alert alert-danger').text(response);
                        }
                    }
                });
                e.preventDefault();
            });
        </script>



<!-- modal upload end here -->


 <div class="modal fade" id="confirm_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Delete Confirmation</h4>
            </div>
            <div class="modal-body">
               <div id="loadingmessage2" style="display:none">
                   <img src="<?php echo base_url()?>assets/images/loader/loading.gif"/>
               </div>              
               Are you sore want to delete seleted data ?
            </div>
            <div class="modal-footer">
              <?php $hal = $this->uri->segment(4); ?>
                 <button type="button" onclick="delete_data()" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Yes</button>
                  <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-ban"></i> No</button>
            </div>
        </div>
    </div>
</div> 

