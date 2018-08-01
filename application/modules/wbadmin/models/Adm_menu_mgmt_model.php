<?php

class Adm_menu_mgmt_model extends CI_Model
{
	
function __construct()
    {
        parent::__construct();
    }
    
    /*
     * Get sys_admin_menu by id_menu
     */
    function get_sys_admin_menu($id_menu)
    {
        return $this->db->get_where('sys_admin_menu',array('id_menu'=>$id_menu))->row_array();
    }
    
    /*
     * Get all sys_admin_menu
     */
    function get_all_sys_admin_menu()
    {
        return $this->db->get('sys_admin_menu')->result_array();
    }
    
    /*
     * function to add new sys_admin_menu
     */
    function add_sys_admin_menu($params)
    {
        $this->db->insert('sys_admin_menu',$params);
        return $this->db->insert_id();
    }
    
    /*
     * function to update sys_admin_menu
     */
    function update_sys_admin_menu($id_menu,$params)
    {
        $this->db->where('id_menu',$id_menu);
        $response = $this->db->update('sys_admin_menu',$params);
        if($response)
        {
        //    return "sys_admin_menu updated successfully";
		echo '<script>$(function(){$(".tree").treemenu({delay:300}).openActive();});</script>';
		echo $this->display_menu(0);
        }
        else
        {
            echo "Error occuring while updating sys_admin_menu";
        }
    }
    
    /*
     * function to delete sys_admin_menu
     */
    function delete_sys_admin_menu($id_menu)
    {
		$this->recursive_delete($id_menu);
		$sql ="DELETE FROM sys_admin_menu WHERE id_menu = '".$id_menu."'";
		$this->db->query($sql);
		echo '<script>$(function(){$(".tree").treemenu({delay:300}).openActive();});</script>';
		echo $this->display_menu(0);
		
    }
	
	
	function recursive_delete($parent_id){
		$sql="SELECT a.id_menu, Deriv1.Count FROM `sys_admin_menu` a 
			LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_admin_menu` GROUP BY parent_id) Deriv1 
			ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='". $parent_id ."'";	
		$query=$this->db->query($sql);
		$script ='';
		foreach ($query->result() as $row){
			if ($row->Count > 0) {
				$sql2 ="DELETE FROM sys_admin_menu WHERE parent_id = '".$row->id_menu."' ";
				$this->db->query($sql2);
				$sql3 ="DELETE FROM sys_admin_menu WHERE id_menu = '".$row->id_menu."' ";
				$this->db->query($sql3);
				$this->recursive_delete($row->id_menu);
			}else{
				$sql2 ="DELETE FROM sys_admin_menu WHERE parent_id = '".$parent_id."' ";
				$this->db->query($sql2);
			}
		}
		
		
	}
	
    function display_menu($parent) {
		$sql = "SELECT a.id_menu, a.menu_label, a.link_menu, Deriv1.Count, a.parent_id, sort_order  FROM `sys_admin_menu` a 
		LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_admin_menu` GROUP BY parent_id) Deriv1 
		ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='". $parent ."' AND is_active = 'Y'  ORDER BY sort_order";
		$query =$this->db->query($sql);
	
		$script='';
		
		$item_menu="<ul  class=\"tree\" id='sortable".$parent."' >";
		$script.="<script>
		  $( function() {
			$( '#sortable".$parent."' ).sortable({
			  placeholder: 'ui-state-highlight',
			  update: function( event, ui ) {
			  var sorted = $( '#sortable".$parent."' ).sortable( 'serialize');
				$.ajax({
					 url: 'update_sort_order_adm',
					 type: 'POST',
					 data: {data_order: sorted},
					 success: function (data) {
							//  alert(data);
					 }
				  });			
				  }	  
			});
			$( '#sortable".$parent."' ).disableSelection();
		  } );
		  </script>";
			
	foreach ($query->result() as $row){
		$msg_delete='';
		$lvl ='';
		$edit_lvl='';
		if($row->parent_id=='0'){
			$lvl='2';
		}else{
			$lvl='3';	
		}
		
		if($row->parent_id=='0' && $row->link_menu=='#'){
			$edit_lvl ='1';	
		}elseif($row->parent_id!='0' && $row->link_menu=='#'){
			$edit_lvl ='2';
		}elseif($row->parent_id!='0' && $row->link_menu!='#'){
			$edit_lvl='3';
		}
		
		 $msg_delete ="You will delete [".$row->menu_label."] menu. Are you sure?";
		if ($row->Count > 0) {
			if($row->parent_id=='0' || $this->is_menu_second_level($row->parent_id)){
				$msg_delete="You will delete main menu and sub of [".$row->menu_label."] menu, do you want to continue?";	
			}
			//echo "<li class=\"dir\"><a href='" . $row['link'] ."?pg=".$enc->encrypt($row['pid']). "'>". $row['label'] .  "</a>";
			$item_menu.= "<li  id='item-".$row->id_menu."' class=\"ui-state-default bg-info\" style='border-bottom: 1px dotted ; border-left: 1px dotted;'>". $row->menu_label .  "";
					$item_menu.=$this->display_menu($row->id_menu);
					$item_menu.= "&nbsp;<button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-title='Add Sub Menu' data-target='#myModal' onclick=\"create_sub_menu('".$row->menu_label."', '".$row->id_menu."','".$lvl."')\")>Add Sub Menu</button>&nbsp;<button type='button' onclick=\"get_data('".$row->id_menu."','".$row->menu_label."','".$edit_lvl."')\" class='btn btn-warning btn-xs'>Edit</button>&nbsp;<button type='button' onclick=\"document.getElementById('sv_mode').value='3';init_title('Delete confirmation', '".$msg_delete."', '".$row->id_menu."')\" class='btn btn-danger btn-xs' data-toggle='modal' data-target='#confirm_del'>Delete</button></li>";
		} elseif ($row->Count==0) {
			//echo "<li><a href='" . $row['link'] ."?pg=".$enc->encrypt($row['pid'])."'>" . $row['label'] . "</a></li>";
			if($this->is_menu_second_level($row->parent_id) || $row->parent_id==0 ){
			$item_menu.= "<li  id='item-".$row->id_menu."' class=\"ui-state-default bg-info\" style='border-bottom: 1px dotted ; border-left: 1px dotted;' >". $row->menu_label .  "";
				$item_menu.= "&nbsp;<button type='button' class='btn btn-info btn-xs' data-toggle='modal' data-title='Add Sub Menu' data-target='#myModal' onclick=\"create_sub_menu('".$row->menu_label."', '".$row->id_menu."','".$lvl."')\")>Add Sub Menu</button>&nbsp;<button type='button' onclick=\"get_data('".$row->id_menu."','".$row->menu_label."','".$edit_lvl."')\"  class='btn btn-warning btn-xs'>Edit</button>&nbsp;<button type='button' onclick=\"document.getElementById('sv_mode').value='3';init_title('Delete confirmation', '".$msg_delete."','".$row->id_menu."')\" class='btn btn-danger btn-xs' data-toggle='modal' data-target='#confirm_del'>Delete</button></li>";
			}else{
				$item_menu.= "<li id='item-".$row->id_menu."' class=\"ui-state-default bg-danger\">" . $row->menu_label . "&nbsp;<button type='button' onclick=\"get_data('".$row->id_menu."','".$row->menu_label."','".$edit_lvl."')\" class='btn btn-warning btn-xs'>Edit</button>&nbsp;<button type='button' onclick=\"document.getElementById('sv_mode').value='3';init_title('Delete confirmation', '".$msg_delete."','".$row->id_menu."')\" class='btn btn-danger btn-xs' data-toggle='modal' data-target='#confirm_del'>Delete</button></li></li>";
			}
		} else;
		}
		$item_menu.= "</ul>";
		return $item_menu.$script;
    }
	
	function is_menu_has_child($parent_id){
		$sql ="SELECT id_menu FROM sys_admin_menu WHERE parent_id ='$parent_id'";	
		echo "<br> $sql";
		$query = $this->db->query($sql);
		$row=$query->row();
		if(isset($row)){
			return true;	
		}else{
			return false;	
		}
		
	}
	function is_menu_second_level($parent_id){
		$sql ="SELECT parent_id  FROM  sys_admin_menu WHERE id_MENU = '$parent_id' ";	
		$query= $this->db->query($sql);
		$row = $query->row();
		if(isset($row)){
			if($row->parent_id=='0'){
				return true;
			}else{
				return false;
			}
		}
	}

	function insert_data_sub_menu($data){
		$menu_label = $data['menu_label'];
		$is_grp_hdr = $data['is_grp_hdr'];
		$parent_id = $data['parent_id'];
		$is_active = $data['is_active'];
		$sort_order = $data['sort_order'];
		$link_menu = $data['link_menu'];
		if($link_menu==''){
			$link_menu='#';	
		}
		$icon_menu = $data['icon_menu'];

		$sql = "INSERT INTO sys_admin_menu (menu_label,is_grp_hdr,parent_id,is_active,sort_order,link_menu,icon_menu) 
			VALUES ('$menu_label', '$is_grp_hdr', '$parent_id', '$is_active', '$sort_order', '$link_menu', '$icon_menu' )";
		$this->db->query($sql);

		echo '<script>$(function(){$(".tree").treemenu({delay:300}).openActive();});</script>';
		echo $this->display_menu(0);
	}
	
	function insert_data_main_menu($data){
		$menu_label = $data['menu_label'];
		$is_grp_hdr = $data['is_grp_hdr'];
		$parent_id = $data['parent_id'];
		$is_active = $data['is_active'];
		$sort_order = $data['sort_order'];
		$link_menu = $data['link_menu'];
		//$icon_menu = $data['icon_menu'];

		$sql = "INSERT INTO sys_admin_menu (menu_label,is_grp_hdr,parent_id,is_active,sort_order,link_menu) 
			VALUES ('$menu_label', '$is_grp_hdr', '$parent_id', '$is_active', '$sort_order', '$link_menu')";
		$this->db->query($sql);

		echo '<script>$(function(){$(".tree").treemenu({delay:300}).openActive();});</script>';
		echo $this->display_menu(0);
	}
	
	function update_sort_order($item){
		$i = 0;
		$check1 =str_replace("&","", $item);
		$arr_item =explode('item[]=',$check1);
		foreach ($arr_item as $value) {
			if($value!=''){
				$sql="UPDATE sys_admin_menu SET sort_order = $i WHERE id_menu = $value";
				$this->db->query($sql);
			}
			$i++;
		}
	}
}
?>