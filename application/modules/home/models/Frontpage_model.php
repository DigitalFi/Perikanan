<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Frontpage_model extends CI_Model{
	
	function __construct(){
	 // Call the Model constructor
		parent::__construct();
	}	

    function load_template_v1($page_id){
        $this->db->select("cp.id_template, rt.nm_template, rt.syntax_template");
        $this->db->from("tbl_component_page cp");
        $this->db->join("reff_template rt", "ON rt.id_template = cp.id_template", "inner");
        $this->db->where("cp.id_pages = '$page_id'");
        $this->db->order_by("id_pages","asc");
        $this->db->limit(1);
	    $this->db->order_by('cp.id_pages');

        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function load_template($idpage=''){
        $this->db->select("tp.id_pages, tpt.id_template");
        $this->db->from("tbl_pages AS tp");
        $this->db->join("tbl_page_template AS tpt", "ON tp.id_pages = tpt.id_pages", "inner");
        if($idpage==''){
            $this->db->where("tp.id_pages='1'");
        }else{
            $this->db->where("tp.id_pages='$idpage'");
        }
        $this->db->order_by('tp.id_pages');
        $query = $this->db->get();
        //echo $this->db->last_query();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

  
}
?>