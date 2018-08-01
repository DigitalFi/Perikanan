<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Adm_menu_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
	}	
	
	function generate_adm_menu($parent){
		$next_id_menu ='';
		$sqlhdr = "SELECT a.id_menu, a.menu_label, a.link_menu, Deriv1.Count, a.parent_id  FROM `sys_admin_menu` a 
		LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_admin_menu` GROUP BY parent_id) Deriv1 
		ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent' and is_active = 'Y' ORDER BY sort_order";
		$queryhdr =$this->db->query($sqlhdr);
		
		$menu_item = "<div id='sidebar-menu' class='main_menu_side hidden-print main_menu'>";
		foreach ($queryhdr->result() as $row){
			if($row->Count>0){		
				$menu_item.="<div class='menu_section'>";
				$menu_item.="<h3>".$row->menu_label."</h3>";
				$menu_item.="<ul class='nav side-menu'>";
					$prev_id_menu = $this->get_menu_first_level($row->id_menu);
					//if(isset($prev_id_menu)){
						$menu_item.=$this->get_item_menu_first_level($row->id_menu);
					//}
					$next_id_menu = $prev_id_menu->id_menu;
					$row_sub_menu = $this->get_menu_first_level($next_id_menu);
			  }//elseif($row->Count==0){
					$menu_item.="</ul>";
				$menu_item.="</div>";
			    $menu_item.="</li>";
			}//foreach ($queryhdr->result() as $row){
			$menu_item.="</ul>
		</div>";
		return $menu_item;	
	}

	function get_item_menu_first_level($parent_id){
		$menu_item='';
		$sql = "SELECT id_menu, menu_label, parent_id, link_menu, icon_menu FROM sys_admin_menu WHERE parent_id = '$parent_id'  ORDER BY sort_order ";
		$query = $this->db->query($sql);
		foreach($query->result() as $row){
				$menu_item.="<li><a><i class='fa ".$row->icon_menu."'></i>".$row->menu_label."<span class='fa fa-chevron-down'></span></a>";
				$menu_item.= $this->generate_sub_menu($row->id_menu);
		}
		return $menu_item;
	}
	
	private function generate_sub_menu($parent_id){ // TO DO: ehanhace to unlimited menu
		$item_sub_menu='';
		$sql_sub = "SELECT a.id_menu, a.menu_label, a.link_menu,  Deriv1.Count, a.parent_id  FROM `sys_admin_menu` a 
				LEFT OUTER JOIN (SELECT parent_id, COUNT(*) AS Count FROM `sys_admin_menu` GROUP BY parent_id) Deriv1 
				ON a.id_menu = Deriv1.parent_id WHERE a.parent_id='$parent_id' and is_active = 'Y' ORDER BY sort_order ";
		$querysub =$this->db->query($sql_sub);	
		$item_sub_menu="<ul class='nav child_menu'>";
		foreach ($querysub->result() as $row){
			if($row->Count>0){
					$item_sub_menu.="<li><a href='#'>".$row->menu_label."</a><ul class='nav child_menu'>";
					$item_sub_menu.=$this-> generate_sub_menu($row->id_menu);
					$item_sub_menu.="</li>";
			}elseif($row->Count==0){
				$item_sub_menu.="<li><a href='".base_url().$row->link_menu."'>".$row->menu_label."</a></li>";
			}else;
		}
			$item_sub_menu.="</ul>";
		return $item_sub_menu;
	}
	
	function get_menu_first_level($parent_id){
		$sql = "SELECT id_menu, menu_label, parent_id, link_menu FROM sys_admin_menu WHERE parent_id = '$parent_id' ORDER BY sort_order ";
		$query = $this->db->query($sql);
		$rows = $query->row();
		$row_first_menu = '';
		if (isset($rows)){
			$row_first_menu = $rows;	
		}
		return $row_first_menu;
	}

	function get_list_icon(){
		$this->db->from('sys_icon_menu');
		$this->db->order_by('icon_menu');
		$result = $this->db->get();
		$return = array();
		if ($result->num_rows() > 0)
			{
			foreach($result->result_array() as $row)
				{
				$return[$row['icon_menu']] = $row['icon_menu'];
				}
			}
		return $return;
	}
	
	function get_last_sort_order($parent_id){
		$sql="SELECT sort_order FROM sys_admin_menu WHERE parent_id = '$parent_id' ORDER BY sort_order DESC limit 0, 1";
		$query = $this->db->query($sql);
		$row = $query->row();
		
		$last_sort_order = 1; //default sort order start from 1
		if(isset($row)){
			$last_sort_order = $row->sort_order+1;		
		}
		
		return $last_sort_order;
	}
	function get_main_menu_last_sort_order(){
		$sql="SELECT sort_order FROM sys_admin_menu WHERE parent_id = '0' ORDER BY sort_order DESC limit 0, 1";
		$query = $this->db->query($sql);
		$row = $query->row();
		
		$last_sort_order = 0;
		if(isset($row)){
			$last_sort_order = $row->sort_order+1;		
		}
		return $last_sort_order;
	}
	
	function get_adm_menu_by_id($id_menu){
		$sql = "SELECT id_menu,	menu_label,	is_grp_hdr,	parent_id,	is_active,	sort_order,	link_menu,	icon_menu FROM sys_admin_menu 
				WHERE id_menu = '$id_menu'";
		$query = $this->db->query($sql);
		$dt_array = $query->result() ;
		echo json_encode($dt_array);			
		
	}
}?>