<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Upload_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
	}	
	
	function get_img_uploaded($data){
		$img_ext ='';
		$img_nm ='';
		$full_img_name = '';
		foreach($data as $dt){
			$img_nm = $dt['raw_name'];
			$img_ext = $dt['file_ext'];	
			$full_img_name = $img_nm.$img_ext;
		}
		//$full_img_name = "<img src='".base_url()."uploads/".$full_img_name."' />";
		return $full_img_name;
	}
	

}


?>