<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	

    function getRows($params = array()){
         $this->db->select('sys_users.user_id, email, user_name, pwd, full_name, mobile, sys_roles.roles_id, roles_name');
         $this->db->from('sys_users');
         $this->db->join('sys_roles', 'sys_users.roles_id = sys_roles.roles_id', 'inner');

        //filter data by searched keywords
        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(user_name  LIKE '%".$params['search']['keywords']."%')";
            $this->db->where($likeCriteria);
        }

        //sort data by ascending or desceding order
		 $this->db->order_by('user_name DESC');

        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
        //get records
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function insertdata($dt_hdr){
        $sql_hdr = $this->db->insert_string('sys_users', $dt_hdr);
        if (!$this->db->simple_query($sql_hdr))
        {
                $error = $this->db->error(); // Has keys 'code' and 'message'
                $msg_error =$error['message'];
                $this->db->trans_rollback();
                return $msg_error;
        }else{
           
            return "Data saved succesfully" ;
        }
    }

    function updatedata($dt_hdr, $id){
        $where = "user_id = '$id'"; 
        $sql_hdr = $this->db->update_string('sys_users', $dt_hdr, $where);
        if (!$this->db->simple_query($sql_hdr))
        {
                $error = $this->db->error(); // Has keys 'code' and 'message'
                $msg_error =$error['message'];
                $this->db->trans_rollback();
                return $msg_error;
        }else{
            return "Data updated succesfully" ;
        }
    }

    function getdatauser_hdr($id){
        $this->db->select('user_id, email, user_name, pwd, full_name, roles_id, id_kecamatan');
        $this->db->from('sys_users');
        $this->db->where(" user_id='$id' ");
        $query = $this->db->get();
        $converter = new Encryption;
        foreach ($query->result() as $row) {
            $pwd = $converter->decode($row->pwd);   
            $arr[] = array(
                   'user_id' => $row->user_id,
                   'email' => $row->email,
                   'user_name' => $row->user_name,
                   'pwd' => $pwd,
                   'full_name' => $row->full_name,
                   'roles_id' => $row->roles_id
            );
        }
        return ($query->num_rows() > 0)?$arr[0]:FALSE;
    }

     function getdatauser_hdr_for_init($id){
        $this->db->select('user_id, email, user_name, pwd, full_name, roles_id, id_kecamatan, id_kelurahan');
        $this->db->from('sys_users');
        $this->db->where(" user_id='$id' ");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;
    }   


	function deletedata($arr_id){
        foreach($arr_id as $id){    
            $this->db->where('user_id', $id);
            $this->db->delete('sys_users');
        } 
        $msg='Records(s) deleted successfully';
        return $msg;
	}
}
?>