<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admpage extends CI_Controller {
	public $menu = "Home";
	function __construct() {
	    parent::__construct(); 
		$this->load->helper('common');
		$this->load->library('session');
	 }

	public function index()
	{
	    $isLoggedIn =  $this->session->userdata('isLoggedIn');
	    if(isset($isLoggedIn) || $isLoggedIn == TRUE)
        {	

			$data=array('title' =>'Dashboard',
						'webcontent' => 'dashboard',
						'root'=> $this->menu,

					);

			$this->load->view('layout_adm/wrapper_dashboard',$data);
		}else{
			$this->load->view('auth/login');	
		}
	}




}