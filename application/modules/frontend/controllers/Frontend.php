<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Frontend extends CI_Controller {

	public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->helper('form');
	  $this->load->helper('html');
	  $this->load->database();
	  $this->load->library('form_validation');
	  $this->load->database();
	  $this->load->model('User_main_page_models');
      $this->load->model('frontend_menu_models');
      $this->load->model('features_models');
      $this->load->helper('common');
	}
	
	public function index(){
		/*$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->User_main_page_models->generate_page_section();*/
		$this->load->view('landing');
	}

	public function mainpage(){
		$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->User_main_page_models->generate_page_section();
		$this->load->view('page_main',$data);

	}
	
	public function img_url($img){
		echo base_url()."assets/images/upload/works/".$img;
	}

}

