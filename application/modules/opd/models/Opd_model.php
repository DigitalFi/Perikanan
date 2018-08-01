<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Opd_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	

    function getRows($params = array()){
	 $this->db->select('fe_content_id, fe_content_title, fe_section_name, sys_page_section.section_name, fe_content_short_desc, display_start_from, fe_full_content, fe_img_files, status_active');
	 $this->db->from('sys_fe_content');
        $this->db->join('sys_page_section', 'sys_page_section.section_id = sys_fe_content.fe_section_name', 'left');
        //filter data by searched keywords
        $opd_section_id = get_sys_setting('007');
        $default_criteria = "fe_section_name ='$opd_section_id'";
        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(fe_content_title  LIKE '%".$params['search']['keywords']."%' OR  fe_content_short_desc  LIKE '%".$params['search']['keywords']."%' OR  fe_full_content  LIKE '%".$params['search']['keywords']."%') and fe_section_name ='$opd_section_id' ";
            $this->db->where($likeCriteria);
        }else{
        	$this->db->where($default_criteria);
        }
        //sort data by ascending or desceding order
		 $this->db->order_by('fe_content_id DESC');

        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
        //get records
        $query = $this->db->get();

       //  echo $this->db->last_query(). "<BR><BR>";
        //return fetched data
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }


    function get_article_by_id($article_id){
        $sql = "SELECT fe_content_id, fe_content_title, fe_section_name, sys_page_section.section_name, fe_content_short_desc, DATE_FORMAT(display_start_from,'%d/%m/%Y')  as tgl_arsip , fe_full_content, fe_content_btn_label, fe_img_files, status_active FROM sys_fe_content
        	INNER JOIN  sys_page_section ON sys_page_section.section_id = sys_fe_content.fe_section_name
                WHERE sys_fe_content.fe_content_id = '$article_id'";
               // echo $sql;
        $query = $this->db->query($sql);
        $dt_array = $query->result() ;
        echo json_encode($dt_array);            
    }    

}
?>