<script src="<?php echo base_url()?>assets/js/jquery.tablesorter.min.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>

<link href="<?php echo base_url()?>assets/css/tblsorter/tblsorter.css" rel="stylesheet">
<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/prism.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/chosen.min.css" rel="stylesheet" type="text/css">

<script src="<?php echo base_url()?>assets/js/choosen/chosen.jquery.min.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/prism.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/init.js"></script>


<script>
function searchFilter(page_num) {
    page_num = page_num?page_num:0;
    var keywords = $('#keywords').val();
    var sortBy = $('#sortBy').val();
    $.ajax({
        type: 'POST',
        url: '<?php echo base_url(); ?>pages/ajaxPaginationData/'+page_num,
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

function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
  //alert("My favourite sports are: " + favorite.join(", "));

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
        //alert ('jml check '+$(".chk-box").length +'jml yg di check'+  $(".chk-box:checked").length)
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

  $( function() {
    $( "#sortable1, #sortable2" ).sortable({
      connectWith: ".connectedSortable",
      placeholder: "ui-state-highlight"
    }).disableSelection();
  } );

$(function() {
    $('#sortable2').sortable({
    //axis: 'y',
        update: function (event, ui) {
            var data = $('#sortable2').sortable('serialize');
            $("#hdn_item").val(data);
            // POST to server using $.post or $.ajax
            /* $.ajax({
            data: data,
            type: 'POST',
            url: '/your/url/here'
            });*/
        }
    });

});


$(document).ready(function() {
  $('#mdl_page').on('show.bs.modal', function(e) {
    $('.chosen-select', this).chosen({width: "350px"});
  });
get_section();
});


function save_data () {
  var query = $('#frm_page').serialize();
  var url;
  if($('#dtflag').val()!='1'){
      url= '<?php echo base_url()?>pages/insertpage';
  }else{
      url= '<?php echo base_url()?>pages/updatepage';
  }
        $.post(url, query, 
        function (response) {
            $('#mdl_page').modal('hide');
            searchFilter(0);
       });
 }

function delete_data () {
  var data = $("#frm_page_list").serialize(); 
    $.ajax({
        url: "<?php echo base_url()?>pages/deletepage", // link of your "whatever" php
        type: "POST",
        async: true,
        cache: false,
        data: data, // all data will be passed here
        success: function(data){ 
            $('#confirm_del').modal('hide');
            searchFilter(0);
        }
    });
 }

$(function(){
    $('#mdl_page').on('hidden.bs.modal', function () {
        $(this).find("input,textarea,select").val('').end();
        $('#cbo_article').val('').trigger('chosen:updated');  
        $("#sortable2").empty();  
    });
});

function get_data(id_page){
    var url;
    var nmsection ;
    var arr_section;
    url= 'pages/get_page_data';
    $('#dtflag').val('1');
    generate_master_section();
    $.post(url, {
         id_page : id_page
    }, function(response){
        var obj = $.parseJSON(response);
        $.each(obj, function() {
            $('#hdn_pg_id').val(this['page_id']);
            $('#pgname').val(this['page_name']);
            $('#hdn_item').val(this['section_name']);
            $('#ismainpage').val(this['is_main_page']);
            $('#cbo_article').val(this['article_id']).trigger('chosen:updated');
            $('#mdl_page').modal('show'); 
         });
        nmsection = $('#hdn_item').val();
        arr_section = nmsection.split('|'); 
        arr_section.forEach(function(section){
            section_db = get_section_by_id(section);
            if(section=='A'){
                section_db='Article';
            }
            $('#sortable2').append( '<li id="item-'+section+'" class="ui-state-default">' + section_db + '</li>' );
        });
    });
}

function get_section(){
    var the_value;
    $.ajax({
        type:"POST",
        url:"pages/get_section_list",
        success:function(response){
            $('#secnm').val(response);
        }
    });
}

function get_section_by_id(ids){
    var list_section = $('#secnm').val();
    var retval;
    arr_sec =list_section.split(';');
    for(var row_section of arr_sec) {    
        dt_section = row_section.split('|');
        if(dt_section[0]==ids){
            retval = dt_section[1];
            return retval;
            break;
        }
    }
 }

function generate_master_section(){
    var list_section = $('#secnm').val();
    var retval;
    arr_sec =list_section.split(';');
    $("#sortable1").empty();
    $('#sortable1').append( '<li id="item-A" class="ui-state-default">Article</li>' );
    for(var row_section of arr_sec) {
        dt_section = row_section.split('|');
        if(dt_section!=''){
            $('#sortable1').append( '<li id="item-'+dt_section[0]+'" class="ui-state-default">' + dt_section[1] + '</li>' );
        }    
    }
    
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
                <h4 class="box-title">Page Management</h4>
                <div class="box-tools">
                        <div class="loading" style="display: none; position: absolute;left: 50%;top: 50%;">
                            <div class="content">
                                <img src="<?php echo base_url().'assets/images/loader/loading.gif'; ?>"/>
                            </div>
                        </div>
                         <div class="input-group">
                            <input type="text" onkeydown = "if (event.keyCode == 13) searchFilter() "    
                            name="searchText" id="keywords"  class="form-control input-sm pull-right" style="width: 150px; " placeholder="Search"/>
                           <div class="input-group-btn">
                                <button style="height: 30px" onclick="searchFilter()" class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                            </div>
                        </div>
                </div>
            </div><!-- /.box-header -->
     <form id="frm_page_list" >       
        <div class="post-list" id="postList">
             <div id="list_data_container">
              <?php
              echo '<table id="myTable"  class="table table-condensed table-bordered tablesorter">';
              echo '<thead>
                  <tr>
                    <th>#</th>
                    <th><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
                    <th>Page Name</th>
                    <th>Section Item</th>
                    <th>Main Page</th>
                    <th>Article</th>
                    <th>Action</th>
                  </tr>
                  </thead>
              <tbody>';
              $rec_no =1;
              if(!empty($posts)){  
                  $m_page ='';  
                  foreach($posts as $row){
                      if($row['is_main_page']=='1'){
                        $m_page = '<i class="fa fa-check-square-o fa-2x" aria-hidden="true"></i>';
                      }else{
                        $m_page = '<i class="fa fa-square-o fa-2x" aria-hidden="true"></i>';
                      }
                   echo '<tr>
                        <td scope="row">'.$rec_no.'</td>
                        <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_pages[]" value='.$row['page_id'].' /></td>
                        <td><a href="javascript:get_data('."'".$row['page_id']."'".')">'.$row['page_name'].'</a></td>
                        <td>'.get_section_in_array($row['section_name']).'</td>
                        <td align="center">'.$m_page.'</td>
                        <td>'.$row['fe_content_title'].'</td>
                        <td align="center"><a href="javascript:get_data('."'".$row['page_id']."'".')"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a></td>
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
                    <button type="button"  data-toggle="modal" data-target="#mdl_page" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add New</button> 
                    <button type="button"  data-toggle="modal" data-target="#confirm_del" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Delete</button> 
                </div>
         </div>
    </div>
</div>

<!-- Modal -->
  <div class="modal fade" id="mdl_page" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label">Page Management</h4>
       </div>
        <div class="modal-body">
         <!--modal content start here-->
            <form id="frm_page" >
                <input type="hidden" id="hdn_item" name="hdn_item"/>
                <input type="hidden" id="hdn_pg_id" name="hdn_pg_id">
                <input type="hidden" id="dtflag" name="dtflag">
                
                <div style="width: 100%;">
                  <div style="float: left; width: 25%;">
                    <ul id="sortable1" class="connectedSortable">
                      <?php 
                    echo '<li class="ui-state-default" id="item-A">Article</li>'; 
                      foreach($data_section as $row){ 
                        echo '<li class="ui-state-default" id="item-'.$row->section_id.'">'.$row->section_title.'</li>'; 
                      } 
                      ?>
                    </ul>
                  </div>
                  
                  <div style="float: left; width: 25%;">    
                    <ul id="sortable2" class="connectedSortable">
                    </ul>
                  </div>
                  <div style="float: left; width: 50%;">
                       <div class="form-group-sm form-horizontal">
                             <label for="menutext">Page Name:</label>
                              <input type="text" value="" class="form-control" maxlength="75" style="width:100%" id="pgname" name="pgname">
                        </div>
                        <div class="form-group-sm form-horizontal">
                             <label for="menutext">Article for this template:</label><br>
                              <?php  echo $dt_cbo_article;?>
                        </div>
                        <div class="form-group-sm form-horizontal">
                             <label for="menutext">This is for Main page:</label>
                                <select name="ismainpage" id="ismainpage" style="width:30%" class="form-control">
                                    <option value="1">Yes</option>
                                    <option value="0">No</option>
                                </select>
                        </div>
                  </div>
                </div>    
           </form>        
    <!--modal content end here-->
        </div>
        <div class="modal-footer">
         <button type="button" id="btn_save" onclick="save_data()" class="btn btn-danger btn-sm"><i class="fa fa-save"></i> Save it</button>
          <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
        </div>
      </div>
    </div>
  </div>

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