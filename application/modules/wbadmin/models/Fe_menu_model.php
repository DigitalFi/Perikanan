<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Fe_menu_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
	}	
	
	function get_fe_menu_by_id($id_menu){
		$sql = "SELECT id_menu,	menu_label,	is_grp_hdr,	parent_id,	is_active,	sort_order,	link_menu, section_id FROM sys_frontend_menu 
				WHERE id_menu = '$id_menu'";
		$query = $this->db->query($sql);
		$dt_array = $query->result() ;
		echo json_encode($dt_array);			
		
	}
	
	function get_last_sort_order($parent_id){
		$sql="SELECT sort_order FROM sys_frontend_menu WHERE parent_id = '$parent_id' ORDER BY sort_order DESC limit 0, 1";
		$query = $this->db->query($sql);
		$row = $query->row();
		
		$last_sort_order = 1; //default sort order start from 1
		if(isset($row)){
			$last_sort_order = $row->sort_order+1;		
		}
		
		return $last_sort_order;
	}
	
	function get_main_menu_last_sort_order(){
		$sql="SELECT sort_order FROM sys_frontend_menu WHERE parent_id = '0' ORDER BY sort_order DESC limit 0, 1";
		$query = $this->db->query($sql);
		$row = $query->row();
		
		$last_sort_order = 0;
		if(isset($row)){
			$last_sort_order = $row->sort_order+1;		
		}
		return $last_sort_order;
	}
	
}?>