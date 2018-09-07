<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : Login (LoginController)
 * Login class to control to authenticate user credentials and starts user's session.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */

class Auth extends CI_Controller
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Auth_model');
        $this->load->library('session');

    }

    /**
     * Index Page for this controller.
     */
    public function index()
    {
        $this->isLoggedIn();
    }
    
    /**
     * This function used to check the user is logged in or not
     */
    function isLoggedIn()
    {
        $isLoggedIn =  $this->session->userdata('isLoggedIn');
        
        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            $this->load->view('login');
        }
        else
        {
            redirect('home');
        }
    }
    
    
    /**
     * This function used to logged in user
     */
    public function login()
    {
        
            $email = $this->input->post('email');
            $password = $this->input->post('password');
            
            $result = $this->Auth_model->loginme($email, $password);
            if(count($result) > 0)
            {
                foreach ($result as $res)
                {
                    $sessionArray = array('user_id'=>$res->user_id,                    
                                            'user_name'=>$res->user_name,
                                            'kd_urusan'=>$res->kd_urusan,
                                            'opd'=>$res->opd,
                                            'roles_id'=>$res->roles_id,
                                            'full_name'=>$res->full_name,
                                            'isLoggedIn' => TRUE,
                                            'roles_name' =>$res->roles_name
                                    );
                                    
                    $this->session->set_userdata($sessionArray);
                    redirect('admpage');
               }
            }
            else
            {
                $this->session->set_flashdata('error', 'Email or password mismatch');
               redirect('auth');
            }
    }

    function logout()
    {
        $this->session->sess_destroy();
        redirect('admpage');
    }

}

?>