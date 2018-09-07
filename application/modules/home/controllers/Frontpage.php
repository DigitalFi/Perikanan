<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Frontpage extends CI_Controller {
	public $menu = "Home";
	function __construct() {
	    parent::__construct(); 
		$this->load->helper('common');
		$this->load->helper('template');
		$this->load->model('Frontpage_model');
	 }

	public function index()
	{
		$template = $this->Frontpage_model->load_template();
		$data=array(
					'webcontent' => 'main_content',
					'dt_template'=>$template,
				);
		$this->load->view('layout_front/wrapper_head',$data);
	}

public function menux($page_id, $template_hdr)
	{
		$template = $this->Frontpage_model->load_template($page_id);
		$data=array(
					'webcontent' => 'detail/detail',
					'dt_template'=>$template,
					'template_hdr'=>$template_hdr,
				);
		$this->load->view('layout_front/wrapper_head',$data);
	}

}