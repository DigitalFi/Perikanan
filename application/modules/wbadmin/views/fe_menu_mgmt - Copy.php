<link href="<?php echo base_url()?>assets/css/jquery.treemenu.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">

<link href="<?php echo base_url()?>assets/css/choosen/prism.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/choosen/chosen.min.css" rel="stylesheet" type="text/css">

<script src="<?php echo base_url()?>assets/js/jquery.treemenu.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/chosen.jquery.min.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/prism.js"></script>
<script src="<?php echo base_url()?>assets/js/choosen/init.js"></script>

<script>
$(document).ready(function() {
  $('#myModal').on('show.bs.modal', function(e) {
    console.debug('modal shown!');
    $('.chosen-select', this).chosen({width: "450px"});
  });});
</script>


<script>
$(function(){
        $(".tree").treemenu({delay:300}).openActive();
    });
</script>

<script>
$("#myModal").on("click", function(e){
  e.preventDefault();
  var title = $(this).data('title');
  $("h4#modal-label").html(title);
});	


</script>
 <script>
    function save(add_rec){
        var query = $('#create_sub_menu').serialize();
        var url;
		if(add_rec=='2'){
		 	url= 'wbadmin/create_sub_menu_fe';
		}else if(add_rec=='1'){
		 	url= 'wbadmin/create_main_menu_fe';
		}else if(add_rec=='4'){
		 	url= 'wbadmin/update_menu_fe';
		}
        $.post(url, query, function (response) {
         	// $('#menutree_container').html(response);
        });
		refresh_article();
		$('#myModal').modal('hide');
		//$('#item-7 a').text($('#id_menu').val());
    }

	function del_rec(id){
		var url;
		url= 'delete_menu_adm';
		$.post(url, {
            idmenu : id
        }, function(response){
			 $('#confirm_del').modal('toggle');
             $('#menutree_container').html(response);
        });
	}
	
	
	function refresh_article(){
		var url;
		url= 'refresh_list_content';
		$.post(url, 
		function(response){
             $('#list_article_container').html(response);
        });
	}
	
	
</script>

<script>

function change_treemenu_attribute(li_ID, sortable_ID){
	$('#'+objID+'').attr("class","ui-state-default bg-info ui-sortable-handle tree-opened");
	$("#sortable_ID").css({ 'display': "block" });
}

function init_title(title_txt, content_text, id){
	$('#id_menu').val(id);
	$('h4#modal-label').html(title_txt)
	$("#confirm_del").find('.modal-body').text(content_text);
	//$("#cbo_data").prepend("<option value='#' >&nbsp;</option>");

}

function create_main_menu(){
	init_title('Create Main Menu','');
	$('#menutext').text("Menu Text:");
	$( "#sv_mode" ).val('1');
	$( "#lvl" ).val('1');
	$( "#url_container" ).hide();
	$( "#status_container" ).hide();
	
}


function create_sub_menu(sub_menu_label, parent_id,lvl,li_ID, sortable_ID ){
	init_title('Your will create sub menu from  <strong>'+sub_menu_label+'</strong>','','');
	$('#menutext').text("Sub Menu Text:");
	$('#parent_id').val(parent_id)
	$( "#lvl" ).val(lvl);
	$( "#sv_mode" ).val('2');
	if(lvl=='2'){
		$( "#icon_container" ).show();
		$( "#status_container" ).hide();
	}else if(lvl=='3'){
		$( "#icon_container" ).hide();
	}
}

	function get_data(id_menu, menu_label, lvl){
		var url;
		url= 'get_fe_menu';
		$.post(url, {
            idmenu : id_menu
        }, function(response){
			var obj = $.parseJSON(response);
			//var result;
			$.each(obj, function() {
				//alert (this['link_menu']);
				
				$('#lvl').val(lvl);
				$('#id_menu').val(this['id_menu']);
				$('#sv_mode').val('4');
				$('#parent_id').val(this['parent_id']);
				$("#menutext").val(this['menu_label']);
				$("#dd_status").val(this['is_active']);
				//$("#cbo_data").prepend("<option value='' >&nbsp;</option>");
				$('#cbo_data').val(this['link_menu']).trigger('chosen:updated');
             });
				//$("#comment").html(result);
        });
		$( "#status_container" ).show();
		display_data(menu_label, lvl);
	}

function display_data(menu_label, lvl){
	init_title('Edit Menu  <strong>'+menu_label+'</strong>','','');
	$( "#lvl" ).val(lvl);
	$( "#sv_mode" ).val('2');
	$('#myModal').modal('show');
}

$(function(){
	$('#myModal').on('hidden.bs.modal', function () {
		$(this).find("input,textarea,select,span").val('').end();
		$('.chosen-select').val('').trigger('chosen:updated');
		
		$(this).attr('name');
		
		refresh_article();
	
	});
});

</script>


<style>
	#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
	#sortable li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; height: 1.5em; }
	html>body #sortable li { height: 1.5em; line-height: 1.2em; }
	.ui-state-highlight { height: 1.5em; line-height: 1.2em; }
</style>

<div class="panel panel-default">
  <div class="panel-heading">Maintain User Menu</div>
  <div class="panel-body">
  <?php
   $attributes = array("name" => "frm_update");
   echo form_open("", $attributes);?>
  	<div id="menutree_container">
   <?php echo $tree_menu; ?>
   </div>
   <button type="button" onclick="create_main_menu()" data-toggle="modal" data-target="#myModal" class="btn btn-danger btn-sm">Add Main Menu</button>

   <?php echo form_close(); ?>
  </div>
</div>
<input type="hidden" id="sv_mode" name="sv_mode" />
<div id="comment"></div>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label"></h4>
       </div>
        <div class="modal-body">
       	 <!--modal content start here-->
            <form id="create_sub_menu">
            <input type="hidden" id="parent_id" name="parent_id" />
            <input type="hidden" id="id_menu" name="id_menu" />
             <input type="hidden" id="lvl" name="lvl" />
             <div class="form-group-sm">
                <label for="menutext">Menu Text: <span id="lbl_sec_name" data-toggle="tooltip" class="badge badge-info" title="Tulisan yang akan muncul di menu front end" ><i>i</i></span></label>
  				<input type="text" class="form-control" maxlength="75" style="width:60%" id="menutext" name="menu_text">
              </div>
              <div class="form-group-sm" id="status_container" style="width:20%">
               <label for="status_active">Status Active:<span id="lbl_sec_name" data-toggle="tooltip" class="badge bg-danger" title="Pilihan apakah menu akan ditampilkan atau tidak di menu front end" ><i>i</i></span></label>
                <select class="form-control" name="dd_status" id="dd_status">
                 <option>-Please select-</option>
                 <option value="Y">Yes</option>
                  <option value="N">No</option>
                </select>
              </div>
              <div class="form-group-sm" id="status_container" style="width:40%">
               <label for="status_active">This menu will open article/content:<span id="lbl_sec_name" data-toggle="tooltip" class="badge bg-danger" title="Article atau detail content yang akan diakses melalui menu ini. Ketik keyword untuk pencarian content lebih cepat" ><i>i</i></span></label>
                       <div id="list_article_container">
                        <?php echo $dt_cbo_article;                       //$attributes = 'class="form-control chosen-select" id="section"';
                       // echo form_dropdown('pages', $dt_cbo_article, set_value('pages'), $attributes); 
                        ?>
                </div>
              </div>
        		<!--modal content end here-->
		 <div class="modal-footer">
          <button type="button" onclick="save(document.getElementById('sv_mode').value)" class="btn btn-danger">Save it</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
        </div>
      </div>
    </div>
  </div>

<!-- Modal -->

 <!-- Modal -->
  <div class="modal fade" id="del" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-success">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label"></h4>
</div>
        <div class="modal-body">
       	 <!--modal content start here-->
            <form id="create_sub_menu">
            <input type="hidden" id="parent_id" name="parent_id" />
            <input type="hidden" id="id_menu" name="id_menu" />
            <input type="hidden" id="sv_mode" name="sv_mode" />
            
              <div class="form-group-sm">
                <label for="menutext">Menu Text: <span id="lbl_sec_name" data-toggle="tooltip" class="badge badge-info" title="Tulisan yang akan muncul di menu front end" ><i>i</i></span></label>
  				<input type="text" class="form-control" maxlength="75" style="width:60%" id="menutext" name="menu_text">
              </div>
              <div class="form-group-sm" id="status_container" style="width:20%">
               <label for="status_active">Status Active:<span id="lbl_sec_name" data-toggle="tooltip" class="badge bg-danger" title="Pilihan apakah menu akan ditampilkan atau tidak di menu front end" ><i>i</i></span></label>
                <select class="form-control" name="dd_status" id="dd_status">
                 <option>-Please select-</option>
                 <option value="Y">Yes</option>
                  <option value="N">No</option>
                </select>
              </div>
              <div class="form-group-sm" id="status_container" style="width:40%">
               <label for="status_active">This menu will open article/content:<span id="lbl_sec_name" data-toggle="tooltip" class="badge bg-danger" title="Article atau detail content yang akan diakses melalui menu ini. Ketik keyword untuk pencarian content lebih cepat" ><i>i</i></span></label>
                       <div id="list_article_container">
                        <?php echo $dt_cbo_article;                       //$attributes = 'class="form-control chosen-select" id="section"';
                       // echo form_dropdown('pages', $dt_cbo_article, set_value('pages'), $attributes); 
                        ?>
                </div>
              </div>
        		<!--modal content end here-->
		<div class="modal-footer">
         <button type="button" onclick="save(document.getElementById('sv_mode').value)" class="btn btn-danger">Save it</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
        
  <!-- Modal -->
  <div class="modal fade" id="confirm_del" role="dialog" >
    <div class="modal-dialog modal-medium">
      <div class="modal-content">
        <div class="modal-header bg-success">
  		<input type="hidden" id="id_menu" name="id_menu" />
         <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title " id="modal-label-delete">Delete Confirmation</h4>
       </div>
        <div class="modal-body">
       	 <!--modal content start here-->
			Are you sore want to delete this
		<!--modal content end here-->
        </div>
       <div class="modal-footer">
         <button type="button" onclick="del_rec(document.getElementById('id_menu').value)" class="btn btn-danger">Yes</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">No</button>
        </div>
      </div>
    </div>
  </div>
        
        
        