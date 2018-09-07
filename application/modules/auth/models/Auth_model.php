<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/Cryptlib.php';
class Auth_model extends CI_Model
{
    
 
    public function __construct()
    {
        parent::__construct();
        $this->load->library('session');
        $this->load->database();
     }
    /**
     * This function used to check the login credentials of the user
     * @param string $username : This is email of the user
     * @param string $password : This is encrypted password of the user
     */
    function loginme($username, $password)
    {
        $converter = new Encryption;
        $pwd = $converter->encode($password);
		//$abc = $converter->decode($pwd);
        $sql ="SELECT user_id, user_name, full_name, pwd, sys_users.roles_id, sys_roles.roles_name, id_kecamatan, id_kelurahan FROM sys_users 
               INNER JOIN sys_roles ON sys_roles.roles_id = sys_users.roles_id WHERE (user_name ='$username' or email ='$username') AND pwd = '$pwd' ";
        $query = $this->db->query($sql);
        $user = $query->result();
       if(!empty($user)){
                return $user;
         } else {
            return array();
        }
    }
}

?>