<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Front_menu_model extends CI_Model{
	
	function __construct(){
	 // Call the Model constructor
		parent::__construct();
	}	

    
    function get_master_template(){
        $this->db->select('id_template, nm_template');
        $this->db->from('reff_template');
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function insertdata_page($arr_hdr, $arr_dtl){
        $this->db->trans_begin();
        $sql = $this->db->insert_string('tbl_pages', $arr_hdr);
        $insert_id = ''; $arr_response='';
        if (!$this->db->simple_query($sql))
        {
                $error = $this->db->error(); // Has keys 'code' and 'message'
                $this->db->trans_rollback();
                $msg_error =$error['message'];
                $arr_response = array(
                    'error'=> 'true',
                    'msg'=>$msg_error,
                );
        }else{
            $insert_id = $this->db->insert_id();
            foreach($arr_dtl as $idtemplate){
                if($idtemplate!=''){
                    $sql ="INSERT INTO tbl_component_page (id_pages, id_template) values ('$insert_id', '$idtemplate')";
                    if (!$this->db->simple_query($sql)){
                        $error = $this->db->error(); 
                        $this->db->trans_rollback();
                        $msg_error =$error['message'];
                        $arr_response = array(
                            'error'=> 'true',
                            'msg'=>'Succes insert data',
                        );
                    }
                }    
            }
        $arr_response = array(
            'error'=> 'false',
            'msg'=>'Succes insert data',
        );           
        $this->db->trans_commit();
        return $arr_response;
        }
    
    }

    function setting_menu($dt, $id){
        $where = "id_menu='$id'";
        $sql = $this->db->update_string('sys_front_menu', $dt, $where);
        if (!$this->db->simple_query($sql))
        {
            $error = $this->db->error(); 
            $msg_error =$error['message'];
            $arr_response = array(
                'error'=> 'true',
                'msg'=>$msg_error,
            );
        }else{
            $arr_response = array(
                'error'=> 'false',
                'msg'=>'Update data success',
            );
        }
        return $arr_response ;
    }

    function get_dataforinit($id){
        $this->db->select('id_menu, id_pages, menu_label, link_menu');
        $this->db->from('sys_front_menu');
        $this->db->where("id_menu='$id'");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;
    }

    function row_delete($arr_id){//prepare for image del
        $msg ='';
        foreach($arr_id as $id){    
            $fname = $this->getfilename($id);
            $img_path = "img/".$fname;
            $this->db->where('id_article', $id);
            $this->db->delete('tbl_article');
            if (file_exists($img_path)){
               unlink($img_path);
            }
        } 
        $msg='Records(s) deleted succesfully';
        return $msg;
    }
  
}
?>