<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Detail_model extends CI_Model{
	
	function __construct(){
	 // Call the Model constructor
		parent::__construct();
	}	

    function load_templatev1($page_id){
        $this->db->select("cp.id_template, rt.nm_template, rt.syntax_template");
        $this->db->from("tbl_component_page cp");
        $this->db->join("reff_template rt", "ON rt.id_template = cp.id_template", "inner");
        $this->db->where("cp.id_pages = '$page_id'");
	    $this->db->order_by('cp.id_pages');
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function load_template($page_id){
        $this->db->select("default_template, detail_of, template_used");
        $this->db->from("tbl_page_template");
        $this->db->where("id_pages='$page_id'");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;

    }
  
}
?>