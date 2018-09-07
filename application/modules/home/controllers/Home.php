<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	public $menu = "Home";
	function __construct() {
	    parent::__construct(); 
		$this->load->helper('common');
		$this->load->library('session');
	 }

	public function index()
	{
		$data=array('title' =>'Dashboard',
					'webcontent' => 'main_content',
					'root'=> $this->menu,
				);

			$this->load->view('layout_front/wrapper',$data);
	}
}