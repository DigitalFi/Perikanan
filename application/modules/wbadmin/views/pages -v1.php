<script src="<?php echo base_url()?>assets/js/ckeditor/ckeditor.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>

 <link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">
 <link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">

 <style>
.fixed-panel {
  min-height: 10px;
  max-height: 500px;
  overflow-y: scroll;
} 


.table-condensed{
  font-size: 12px;
}

#imaginary_container{
   /*  margin-top:20%; Don't copy this */
}
.stylish-input-group .input-group-addon{
    background: white !important; 
}
.stylish-input-group .form-control{
  border-right:0; 
  box-shadow:0 0 0; 
  border-color:#ccc;
}
.stylish-input-group button{
    border:0;
    background:transparent;
}

 </style>
 <script>
  function search_data(search_value){
    $('#loadingmessage').show(); 
    var url;
    url= '<?php echo base_url() ?>wbadmin/article_manag/search_article';
    $.post(url, {
            s_value : search_value
        }, function(response){
          //alert(response);
             $('#list_data_container').html(response);
             $('#loadingmessage').hide();
        });
  }

  function delete_data(id_value,page){
    $('#loadingmessage2').show(); 
    var url;
    if(page==''){
      url='<?php echo base_url()?>wbadmin/pages/delete';
    }else{
      url='<?php echo base_url()?>wbadmin/pages/delete/'+page;
    }
    $.post(url, {
            d_value : id_value
        }, function(response){
          $('#list_data_container').html(response);
          $('#confirm_del').modal('hide');
          $('#loadingmessage2').hide();
        });
  }


//  for select / deselect all

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

function Populate(){
  var favorite = [];
  $.each($("input[name='id_content']:checked"), function(){
       favorite.push($(this).val());
  });
  $('#tags').val(favorite.join("|"));
  //alert("My favourite sports are: " + favorite.join(", "));

}
</script>

  <script>
  $( function() {
    $( "#sortable1, #sortable2" ).sortable({
      connectWith: ".connectedSortable",
      placeholder: "ui-state-highlight"
    }).disableSelection();
  } );


 /* $(function() {
      $( "#sortable1" ).sortable({
          connectWith: ".connectedSortable",
          remove: function(event, ui) {
              ui.item.clone().appendTo('#sortable2');
              $(this).sortable('cancel');

          }
      }).disableSelection();

  $( "#sortable2" ).sortable({
          connectWith: ".connectedSortable",
          remove: function(event, ui) {
              //ui.item.clone().appendTo('#sortable1');
              $("#sortable2").sortable( "cancel" );
             
          }
      }).disableSelection();
  });*/
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


function save_datax () {
  var query = $('#frm_page').serialize();
  var url;
      url= '<?php echo base_url()?>wbadmin/pages/save_page_section';
        $.post(url, query, function (response) {
          alert(response);
           //$('#menutree_container').html(response);
        });
      // $('#myModal').modal('hide');
 }


  function save_data(datas){
    var url;
    url= '<?php echo base_url()?>wbadmin/pages/save_page_section';
    the_data = $("#hdn_item").val(); 
    $.post(url, {
            idmenu : the_data
        }, function(response){
          alert(response);
            //$('#confirm_del').modal('toggle');
            //$('#menutree_container').html(response);
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


<?php if($after_del !='1'){?>
 <input type="hidden" id ="tags" name="tags" /> 
 <div class="panel panel-default">
 <div class="panel-heading clearfix">
 <h4 class="panel-title pull-left" style="padding-top: 7.5px;">Manage Article</h4>
    
  <div class="row ">
    <div class="col-sm-6 col-sm-offset-3 pull-right">
      <div id="imaginary_container"> 
        <div class="input-group stylish-input-group">
            <input type="text" class="form-control" id="search" name="search"  placeholder="Search" >
            <span class="input-group-addon">
              <button type="button" onclick=" search_data($('#search').val())">
                  <span class="glyphicon glyphicon-search"></span>
              </button>  
            </span>
        </div>
      </div>
    </div>
  </div>
 </div>
  <div class="panel-body">
 <?php } ?> 
  <div id="loadingmessage" style="display:none">
       <img src="<?php echo base_url()?>assets/images/loader/loading.gif"/>
   </div>               

 
<form id="list_article" name="list_article" enctype="application/x-www-form-urlencoded" >
  <div id="list_data_container">
  <?php
  echo '<table class="table table-striped table-condensed">';
  echo '<thead class="nav">
      <tr>
        <th>#</th>
        <th><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
        <th>Page Name</th>
        <th>Section Name</th>
        <th>Main Page</th>
        <th>Sort Order</th>
        <th>Article</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>';
  $rec_no =1;   
  foreach($pages as $row){
    echo '<tr>
        <td scope="row">'.$rec_no.'</td>
        <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content" value='.$row->page_id.' /></td>
        <td><a href="javascript:edit_article('.$row->page_id.')">'.$row->page_name.'</a></td>
        <td>'.$row->section_name.'</td>
        <td>'.$row->is_main_page.'</td>
        <td>'.$row->sort_order.'</td>
        <td>'.$row->article_id.'</td>
        <td><a href="javascript:edit_article('.$row->page_id.')">Edit</a></td>
      </tr>';
  $rec_no++;    
  }
  echo '</table>';
    ?>

    <div><?php echo $this->pagination->create_links(); ?></div>
  </div>    
</form>



<?php if($after_del !='1'){?>
  <div class="panel-footer">
  <!-- <button type="button"  onclick="add_article()"  class="btn btn-success btn-sm">Add Page</button> --> 
  <button type="button"  data-toggle="modal" data-target="#mdl_page" class="btn btn-success btn-sm">Add Page</button> 
  <button type="button"  data-toggle='modal' data-target='#confirm_del' class="btn btn-danger btn-sm">Delete Page</button>
    </div>
</div>


<!-- Modal -->

  <div class="modal fade" id="mdl_page" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label">Page Management</h4>
       </div>
        <div class="modal-body">
         <!--modal content start here-->
            <form id="frm_page">
            <input type="text" id="hdn_item" name="hdn_item"/>
                <ul id="sortable1" class="connectedSortable">
                <?php 
                echo '<li class="ui-state-default" id="item-0"><span class="button btn-xs">Article<span></li>'; 
               foreach($data_section as $row){ 
                    echo '<li class="ui-state-default" id="item-'.$row->section_id.'">'.$row->section_name.'</li>'; 
                 } 
                 ?>
                </ul>
                <ul id="sortable2" class="connectedSortable">
                </ul>             
           </form>        
    <!--modal content end here-->
        </div>
        <div class="modal-footer">
         <button type="button" id="btn_save" onclick="save_data('$hdn_item').val()" class="btn btn-danger">Save it</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
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
                 <button type="button" onclick="delete_data(document.getElementById('tags').value, '<?php echo $hal; ?>' )" class="btn btn-danger">Yes</button>
                  <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
              </div>
            </div>
          </div>
        </div>  

<?php }?>

