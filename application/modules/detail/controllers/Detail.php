<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Detail extends CI_Controller {
	public $menu = "Home";
	function __construct() {
	    parent::__construct(); 
		$this->load->helper('common');
		$this->load->helper('template');
		$this->load->helper('template_dtl');
		$this->load->model('Detail_model');
		$this->load->model('home/Frontpage_model');
	 }

	public function pagedetail($page_id=NULL,$template_id=NULL, $article_id=NULL)
	{
		$template = $this->Detail_model->load_template($page_id);
		$lblmenu ='';
		$data=array(
					'webcontent' => 'detail',
					'dt_template'=>$template,
					'article_id'=>$article_id,
					'page_id'=>$page_id,
					'lblmenu'=>$lblmenu,
				);
		$this->load->view('layout_front/wrapper_head',$data);
	}

	public function menudetail($page_id=NULL,$template_id=NULL, $article_id=NULL)
	{
		$page_id = $this->uri->segment(3);
		$template = $this->Frontpage_model->load_template($page_id);
		$data=array(
					'webcontent' => 'home/main_content',
					'dt_template'=>$template,
				);
		$this->load->view('layout_front/wrapper_head',$data);
	}


}