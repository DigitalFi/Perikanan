<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Pages_model extends CI_Model{
    /*
     * get rows from the posts table
     */
    function getRows($params = array()){
        $this->db->select('page_id, page_name, fe_content_title, section_name, is_main_page, sort_order, article_id');
        $this->db->from('sys_pages');
        $this->db->join('sys_fe_content', 'sys_pages.article_id = sys_fe_content.fe_content_id', 'left');
        //filter data by searched keywords
        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(page_name  LIKE '%".$params['search']['keywords']."%' OR  section_name  LIKE '%".$params['search']['keywords']."%' OR  sys_fe_content.fe_content_title  LIKE '%".$params['search']['keywords']."%')";
            $this->db->where($likeCriteria);
        }
        //sort data by ascending or desceding order
        $this->db->order_by('page_id','desc');
       /* if(!empty($params['search']['sortBy'])){
            $this->db->order_by('page_id',$params['search']['sortBy']);
        }else{
            $this->db->order_by('page_id','desc');
        }*/
        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
        //get records
        $query = $this->db->get();
        //return fetched data
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function get_page_section(){
        $sql ="SELECT section_id, section_name, section_title FROM sys_page_section WHERE is_visible = 'Y'";
        $query=$this->db->query($sql);
        $query=$this->db->query($sql);
        $row=$query->result();
        return $row;
    }

    function save_pages($data){
        $this->db->insert('sys_pages', $data);
    }

    function update_pages($data, $id){
        $this->db->where('page_id', $id);
        $this->db->update('sys_pages', $data);
    }

    function delete_pages($data){
        foreach($data as $id){
            $sql ="DELETE FROM sys_pages WHERE page_id ='$id'";
            $this->db->query($sql);
 
        }
        echo "Data deleted succesfully";

    }

    function get_pages_by_id($id_pages){
        $sql = "SELECT page_id, page_name, section_name, is_main_page,  article_id FROM sys_pages 
                WHERE page_id = '$id_pages'";
        $query = $this->db->query($sql);
        $dt_array = $query->result() ;
        echo json_encode($dt_array);            
    }   

    function get_section_list(){
        $sql ="SELECT section_id, section_title FROM sys_page_section ORDER BY section_id";
        $query =$this->db->query($sql);
        $dt_section='';
        foreach($query->result() as $row){
            $dt_section .= $row->section_id ."|". $row->section_title.";";
        }
        echo $dt_section;
    }

}