<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

class Files extends CI_Controller {

	public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->helper('form');
	  $this->load->helper('html');
	  $this->load->database();
	  $this->load->library('form_validation');
	  $this->load->database();
	  $this->load->model('files_model');
      $this->load->model('frontend/frontend_menu_models');
 	}
	
	public function detail($id_content){
		$segment_info = $this->uri->segment(4);
		//echo "segmen ". $segment_info;
		$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->files_model->get_detail($id_content, $segment_info);
		$this->load->view('files',$data);
	}
	public function detail_deep($id_content){
		$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);
		$data['page_content'] = $this->files_model->get_detail2($id_content);
		$this->load->view('files',$data);
	}

	public function download_file($file){
		$file_loc=base_url().'assets\images\upload\files\\'.$file;
		if(!$file){ // file does not exist
		    die('file not found');
		} else {
		    header("Cache-Control: public");
		    header("Content-Description: File Transfer");
		    header("Content-Disposition: attachment; filename=$file");
		    header("Content-Type: application/zip");
		    header("Content-Transfer-Encoding: binary");

		    // read the file from disk
		    readfile($file_loc);
		}		
	}
}

