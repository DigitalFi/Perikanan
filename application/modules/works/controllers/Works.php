<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Works extends CI_Controller {

	public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->helper('form');
	  $this->load->helper('html');
	  $this->load->database();
	  $this->load->library('form_validation');
	  $this->load->database();
	  $this->load->model('works_model');
      $this->load->model('frontend/frontend_menu_models');
 	}
	
	public function detail($id_content){
		$segment_info = $this->uri->segment(4);
		$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->works_model->get_detail($id_content, $segment_info);
		$this->load->view('works',$data);
	}
	public function detail_deep($id_content){
		$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->works_model->get_detail2($id_content);
		$this->load->view('works',$data);
	}
}

