<?php 
if(!defined('BASEPATH')) exit('No direct script access allowed');
class Section_manag extends CI_Controller{
	public function __construct() {
	  parent::__construct();
	  $this->load->library('session');
	  $this->load->helper(array('url','file'));
	  $this->load->helper('form');
	  $this->load->helper('html');
	  $this->load->database();
	  $this->load->library('form_validation');
	  $this->load->database();
      $this->load->model('Login_model');
      $this->load->model('Adm_menu_model');
	  $this->load->model('Adm_menu_mgmt_model');
	  $this->load->model('Fe_menu_mgmt_model');
	  $this->load->model('Upload_model');
	  $this->load->model('Section_model');
	  $this->load->helper('common');
	}
	public function index(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('section_mgmt');
			$data['section'] = $this->Section_model->generate_section();
			$this->load->view('user_main', $data);

		}else{
			$this->load->view('login');
		}
	}
	private function load_user_info($page_to_embed){
		$data['page_content']=$page_to_embed;
		$data['left_menu'] = $this->Adm_menu_model->generate_adm_menu(0);
		/*$data['user_online']=$this->Login_model->get_users_online();
		$data['all_user']=$this->Login_model->get_total_users();
		$data['user_active']=$this->Login_model->get_users_active();
		$data['user_inactive']=$this->Login_model->get_users_inactive();*/
		$data['full_user_name']=$this->session->userdata('full_name');
		return $data;
	}

	/*Manage Section Start Here*/
		public function update_sort_order_section(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('section_mgmt');
			$this->Section_model->update_sort_order($this->input->post("data_order"));
			$data['section'] = $this->Section_model->generate_section();
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}
	}

	public function get_section(){
		if($this->session->userdata('user_id')){
			$section_id=$this->input->post("sectionid");
			$this->Section_model->get_section_by_id($section_id);
		}else{
			$this->load->view('login');
		}
	}
	/*Manage Section End Here*/
	
	function proses_upload(){
		$path = strtolower($this->input->post('image_folder'));
		$section_id =$this->input->post('section_id');
		$section_title =$this->input->post('section_title');
		$section_desc =$this->input->post('section_desc');
		$config['upload_path']   ='assets/images/upload/'.$path;
		$config['allowed_types'] = 'gif|jpg|png|ico';
		$this->load->library('upload',$config);
		if($this->upload->do_upload('userfile')){
			$nama=$this->upload->data('file_name');
			$data = array (
						'image_section'=>$nama
					);					
			$this->Section_model->update_section($section_id,$data);
		}else{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
		}
	}
		
	function update_section(){

		$section_name =$this->input->post('section_name');
		$section_id =$this->input->post('section_id');
		$section_title =$this->input->post('section_title');
		$section_desc =$this->input->post('section_desc');
		$image_folder =$this->input->post('image_folder');
		$status =$this->input->post('status');
		$data = array (
					'section_name'=>$section_name,
					'section_title'=>$section_title,
					'section_desc'=>$section_desc,
					'image_folder'=>$image_folder,
					'is_visible'=>$status
				);					
				//print_r($data);
		$this->Section_model->update_section($section_id,$data);
	}
		//Untuk menghapus foto
	function remove_foto($section_id){
		//Ambil token foto
		$img_path =$this->Section_model->get_path_file_by_section_id($section_id);
		$path_file = 'assets/images/upload/'.$img_path;
		
			if(file_exists($path_file)){
				unlink($path_file);
			}else{
				
				echo "file not found in ". 	$path_file;
			}
			$data = array (
					'image_section'=>NULL
				);					
			$this->Section_model->update_section($section_id,$data);


		echo $path_file;
	}



}?>