<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Services extends CI_Controller {

	public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->helper('form');
	  $this->load->helper('html');
	  $this->load->database();
	  $this->load->library('form_validation');
	  $this->load->database();
	  $this->load->model('services_model');
      $this->load->model('frontend/frontend_menu_models');
 	}
	
	public function detail($id_content){
		$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->services_model->get_detail($id_content);
		$this->load->view('services',$data);
	}
}

