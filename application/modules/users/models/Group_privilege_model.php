<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Group_privilege_model extends CI_Model{
	
	function __construct(){
	 // Call the Model constructor
		parent::__construct();
        $this->load->helper('common');
	}	

    function getRows($params = array()){
	   /*$this->db->select('id_user_role, b.roles_name, c.menu_label');
       $this->db->from('sys_menu_role a');
       $this->db->join("sys_roles b", 'a.roles_id=b.roles_id','inner');
       $this->db->join("sys_admin_menu c", 'c.id_menu=a.id_menu', 'inner');*/

       $this->db->select('roles_id, roles_name, roles_desc');
       $this->db->from('sys_roles');
        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(roles_name  LIKE '%".$params['search']['keywords']."%')";
            $this->db->where($likeCriteria);
        }

        //sort data by ascending or desceding order
		 $this->db->order_by('roles_name');

        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
         $query = $this->db->get();
         return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function savedata($dt_array, $arr_dtl){
        $this->db->trans_begin();
        $sql = $this->db->insert_string('sys_roles', $dt_array);
        $insert_id = '';
        if (!$this->db->simple_query($sql))
        {
                $error = $this->db->error(); // Has keys 'code' and 'message'
                $this->db->trans_rollback();
                $msg_error =$error['message'];
                return $msg_error;
        }else{
            $insert_id = $this->db->insert_id();
            foreach($arr_dtl as $dtl){
                $sql ="INSERT INTO sys_menu_role (roles_id, id_menu) values ('$insert_id', '$dtl')";
                if (!$this->db->simple_query($sql)){
                    $error = $this->db->error(); 
                    $this->db->trans_rollback();
                    $msg_error =$error['message'];
                    return $msg_error;                    
                }
            }
          $this->db->trans_commit();
          return "Data saved succesfully" ;
        }
    
    }

    function updatedata($dt_array, $id, $arr_dtl){
        $this->db->trans_begin();
        $where = "roles_id = '$id'"; 
        $sql_hdr = $this->db->update_string('sys_roles', $dt_array, $where);
        if (!$this->db->simple_query($sql_hdr)){
                $error = $this->db->error(); // Has keys 'code' and 'message'
                $this->db->trans_rollback();
                $msg_error =$error['message'];
                return $msg_error;
        }else{
            $this->db->where('roles_id', $id);
            $this->db->delete('sys_menu_role');
            foreach($arr_dtl as $dtl){
                $sql ="INSERT INTO sys_menu_role (roles_id, id_menu) values ('$id', '$dtl')";
                if (!$this->db->simple_query($sql)){
                    $error = $this->db->error(); 
                    $this->db->trans_rollback();
                    $msg_error =$error['message'];
                    return $msg_error;                    
                }
            }
            $this->db->trans_commit();
            return "Data updated succesfully" ;
        }
    }

    function row_delete($arr_id){//prepare for image del
        $msg ='';
        foreach($arr_id as $id){    
            $is_role_used = is_data_exist('sys_users', 'roles_id', " roles_id = '$id' ");
            if(!$is_role_used){
                $this->db->where('roles_id', $id);
                $this->db->delete('sys_menu_role');

                $this->db->where('roles_id', $id);
                $this->db->delete('sys_roles');
            }else{
                return $this->is_role_used_by_user($arr_id);
            }
            $msg='Records(s) deleted succesfully';
        } 
        return $msg;
    }
    
    function getdtmenu_for_init($id){
        $this->db->select('id_menu');
        $id_menu =array(); 
        $this->db->from('sys_menu_role');
        $this->db->where(" roles_id='$id' ");
        $query = $this->db->get();
        foreach ($query->result() as $row){
            $id_menu[]= $row->id_menu;
        }
        return $id_menu;
    } 


    function get_data_by_id($id){
        $this->db->select('roles_id, roles_name, roles_desc');
        $this->db->from('sys_roles');
        $this->db->where(" roles_id = '$id' ");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;
    } 

    function is_role_used_by_user($arr_id){
        $msg = ''; $sql ='';
        foreach($arr_id as $id){    
            $sql = "SELECT u.roles_id, u.user_name, r.roles_name FROM sys_users u INNER JOIN sys_roles r ON u.roles_id = r.roles_id WHERE u.roles_id = '$id'";
            $query = $this->db->query($sql);
            foreach ($query->result() as $row){
                    $msg.="<i class='fa fa-trash'></i> <strong>[".$row->roles_name."]</strong> used by User: <strong>". $row->user_name ."</strong><br>";
            }
        }  
        return "This Role cannot deleted. Role : <br>". $msg;    
    }

}
?>