<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
	}	
	
	/**
	* Funtion to check is login valid or not.
	*
	* @author     Jajas
	* @version    1.0
	* @created on: 22 Jan 17  10:14 AM
	*/
	function isLogin_valid($uid, $pwd){
          $sql = "select user_id, user_name, full_name from sys_users where user_name = '" . $uid . "' and pwd = '" . md5($pwd) . "' and status_active = '1'";
		  $query = $this->db->query($sql);
           if($query->num_rows()>0){
		  	  $row = $query->row();
              $this->session->set_userdata('user_id', $row->user_id);
              $this->session->set_userdata('user_name', $row->user_name);
              $this->session->set_userdata('full_name', $row->full_name);
			  $this->update_login_status($row->user_id);
			  return true;
		  }else{
			  $this->session->set_flashdata('msg', '<div style="max-width: 380px; margin: 0 auto;" class="alert alert-danger text-center">Invalid username and password, Or you have no right access</div>');	  
			  return false;
		  };
	}
	
	private function update_login_status($userId){
		$sql ="UPDATE sys_users SET login_status ='1', last_login = NOW() WHERE user_id = '$userId'";	
		$this->db->query($sql);
	}
	
	private function update_logout_status($userId){
		$sql ="UPDATE sys_users SET login_status ='0', last_logout = NOW() WHERE user_id = '$userId'";	
		$this->db->query($sql);
	}
	
	public function get_users_online(){
		$num_ol_user = 0;
		$sql = "SELECT user_id FROM sys_users WHERE login_status = '1'";
		$query= $this->db->query($sql);
		if($query->num_rows()>0){
			$num_ol_user = $query->num_rows();	
		}
		return $num_ol_user;
	}
	
	function get_total_users(){
		$num_ol_user = 0;
		$sql = "SELECT user_id FROM sys_users ";
		$query= $this->db->query($sql);
		if($query->num_rows()>0){
			$num_ol_user = $query->num_rows();	
		}
		return $num_ol_user;
	}
	
	function get_users_active(){
		$num_ol_user = 0;
		$sql = "SELECT user_id FROM sys_users WHERE status_active = '1' ";
		$query= $this->db->query($sql);
		if($query->num_rows()>0){
			$num_ol_user = $query->num_rows();	
		}
		return $num_ol_user;
	}
	
	function get_users_inactive(){
		$num_ol_user = 0;
		$sql = "SELECT user_id FROM sys_users WHERE status_active <> '1' ";
		$query= $this->db->query($sql);
		if($query->num_rows()>0){
			$num_ol_user = $query->num_rows();	
		}
		return $num_ol_user;
	}




}


?>