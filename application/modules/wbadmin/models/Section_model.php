<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Section_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
	}	
	

function generate_section() {
		$sql = "SELECT section_id,	section_name
 		FROM sys_page_section  ORDER BY sort_order ";
		$query =$this->db->query($sql);
	
		$script='';
		$script.="<script>
		  $( function() {
			$( '#sortable_section' ).sortable({
			  placeholder: 'ui-state-highlight',
			  update: function( event, ui ) {
			  var sorted = $( '#sortable_section' ).sortable( 'serialize');
				$.ajax({
					 url: 'update_sort_order_section',
					 type: 'POST',
					 data: {data_order: sorted},
					 success: function (data) {
							 // alert(data);
					 }
				  });			
				  }	  
			});
			$( '#sortable_section' ).disableSelection();
		  } );
		  </script>";
			
	    $item_menu="<ul  id='sortable_section' >";
		foreach ($query->result() as $row){
			if (isset($row)) {
				$item_menu.= "<li style='height:50px; border-radius:5px; border:1px dotted; padding-top=22px;' id='item-".$row->section_id."' class=\"ui-state-default grab\">" . $row->section_name . "&nbsp;<button type='button' onclick=\"get_data('".$row->section_id."','".$row->section_name."')\" class='btn btn-primary btn-xs'>Maintain this section</button></li>";
			}
		}
		$item_menu.= "</ul>";
		
		return $item_menu.$script;
    }
	
	function update_sort_order($item){
		print_r($item);
		$i = 0;
		$check1 =str_replace("&","", $item);
		$arr_item =explode('item[]=',$check1);
		foreach ($arr_item as $value) {
			if($value!=''){
				$sql="UPDATE sys_page_section SET sort_order = $i WHERE section_id = $value";
				$this->db->query($sql);
			}
			$i++;
		}
	}
	
	function get_section_by_id($sec_id){
		$sql = "SELECT section_id,	section_name, section_title, section_desc, image_folder, image_section, is_visible FROM sys_page_section WHERE section_id = '$sec_id'";
		$query = $this->db->query($sql);
		$dt_array = $query->result() ;
		echo json_encode($dt_array);			
	}
	
	function update_section($sec_id,$params){
        $this->db->where('section_id', $sec_id);
		$response = $this->db->update('sys_page_section',$params);
        if($response)
        {
			echo $this->generate_section();
        }
        else
        {
            echo "Error occuring while updating sys_admin_menu";
        }
	}

	function store_img_section($img_name, $sec_id){
        $this->db->where('section_id',$sec_id);
        $response = $this->db->update('sys_page_section',$params);
        if($response)
        {
			echo $this->generate_section();
        }
        else
        {
            echo "Error occuring while updating sys_page_section";
        }
	}
	
	function is_section_exist($sec_id){
		$sql = "SELECT section_id FROM sys_page_section WHERE section_id = '$sec_id' ";	
		$query = $this->db->query($sql);
		$row = $this->query->result($query);
		if($row){
			return true;
		}else{
			return false;
		}
	}
	
	function get_list_section(){
		$this->db->from('sys_page_section');
		$this->db->order_by('section_name');
		$result = $this->db->get();
		$return = array();
		$dd[''] = 'Please Select';
		if ($result->num_rows() > 0){
			
			foreach($result->result_array() as $row){
				
				$return[$row['section_name']] = $row['section_name'];
			}
		}
		return $return;
	}
	
	function get_path_file_by_section_id($id){
		$path_file ='';
		$sql ="SELECT image_folder, image_section   FROM sys_page_section WHERE section_id = '$id'";
		$query=$this->db->query($sql);
		$row=$query->row();
		if($row){
			$path_file = $row->image_folder .'/'.$row->image_section;
		}
		return $path_file; 
	}

	
}
?>