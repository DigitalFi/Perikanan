<link href="<?php echo base_url()?>assets/css/jquery.treemenu.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="<?php echo base_url()?>assets/css/bootstrap.form.css" rel="stylesheet" type="text/css">

<script src="<?php echo base_url()?>assets/js/jquery.treemenu.js"></script>
<script src="<?php echo base_url()?>assets/js/jquery-ui.js"></script>
<script>
$(function(){
        $(".tree").treemenu({delay:300}).openActive();
    });
	
</script>

 <script>
    function save(add_rec){
        var query = $('#create_sub_menu').serialize();
        var url;
		if(add_rec=='2'){
		 	url= 'wbadmin/create_sub_menu_adm';
		}else if(add_rec=='1'){
		 	url= 'wbadmin/create_main_menu_adm';
		}else if(add_rec=='4'){
		 	url= 'wbadmin/update_menu_adm';
		}
        $.post(url, query, function (response) {
         	 $('#menutree_container').html(response);
        });
		$('#myModal').modal('hide');
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
</script>

<script>
function init_title(title_txt, content_text, id){
	$('#id_menu').val(id);
	$('h4#modal-label').html(title_txt)
	$("#confirm_del").find('.modal-body').text(content_text);
}

function create_main_menu(){
	init_title('Create Main Menu','');
	$( "#sv_mode" ).val('1');
	$( "#lvl" ).val('1');
	$( "#icon_container" ).hide();
	$( "#url_container" ).hide();
}

function create_sub_menu(sub_menu_label, parent_id,lvl){
	init_title('Your will create sub menu from  <strong>'+sub_menu_label+'</strong>','','');
	$('#parent_id').val(parent_id)
	$( "#lvl" ).val(lvl);
	$( "#sv_mode" ).val('2');
	if(lvl=='2'){
		$( "#icon_container" ).show();
		$( "#url_container" ).hide();
	}else if(lvl=='3'){
		$( "#icon_container" ).hide();
		$( "#url_container" ).show();
	}
}

	function get_data(id_menu, menu_label, lvl){
		var url;
		url= 'wbadmin/get_adm_menu';
		$.post(url, {
            idmenu : id_menu
        }, function(response){
			var obj = $.parseJSON(response);
			//var result;
			$.each(obj, function() {
				$('#lvl').val(lvl);
				$('#id_menu').val(this['id_menu']);
				$('#sv_mode').val('4');
				$('#parent_id').val(this['parent_id']);
				$("#menutext").val(this['menu_label']);
				$("#menu_url").val(this['link_menu']);
				$("#menu_icon").val(this['icon_menu']);
				$("#ficon").attr('class', 'fa '+this['icon_menu']);
             });
				//$("#comment").html(result);
        });
		display_data(menu_label, lvl);
	}

function display_data(menu_label, lvl){
	init_title('Edit Menu  <strong>'+menu_label+'</strong>','','');
	$( "#lvl" ).val(lvl);
	$( "#sv_mode" ).val('2');
	if(lvl=='1'){
		$( "#icon_container" ).hide();
		$( "#url_container" ).hide();
	}else if(lvl=='2'){
		$( "#icon_container" ).show();
		$( "#url_container" ).hide();
	}else if(lvl=='3'){
		$( "#icon_container" ).hide();
		$( "#url_container" ).show();
	}
	$('#myModal').modal('show');
}

$(function(){
	$('#myModal').on('hidden.bs.modal', function () {
		$(this).find("input,textarea,select").val('').end();
	
	});
});
</script>


<style>
	#sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
	#sortable li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.2em; height: 1.5em; }
	html>body #sortable li { height: 1.5em; line-height: 1.2em; }
	.ui-state-highlight { height: 1.5em; line-height: 1.2em; }
</style>
    
<div class="panel panel-default" >
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
               <label for="menutext">Menu Text:</label>
  				<input type="text" class="form-control" maxlength="75" style="width:60%" id="menutext" name="menu_text">
              </div>
              <div class="form-group-sm" id="url_container">
               <label for="menu_url">Link url:</label>
  				<input type="text" class="form-control" maxlength="255" style="width:100%" id="menu_url" name="menu_url">
              </div>
               <div class="form-group-sm" id="icon_container">
                <label for="menu_icon">Icon Menu:</label>
                <div class="form-inline">
					<?php 
					$attributes = 'onchange="change_class(this.value);" class="form-control" style="width:200px" id="menu_icon"';
					echo form_dropdown('menu_icon', $list_icon, set_value('menu_icon'), $attributes); 
					?>
                    <span id="ficon" style="font-size:20px; border: solid 1px #CCC" class=""></span>
                </div>
              </div>
             
           </form>        
           <script language="javascript">
           	function change_class(cls_name){
				$("#ficon").attr('class', 'fa '+cls_name);
			}
           </script>
		<!--modal content end here-->
        </div>
        <div class="modal-footer">
         <button type="button" onclick="save(document.getElementById('sv_mode').value)" class="btn btn-danger">Save it</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
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

