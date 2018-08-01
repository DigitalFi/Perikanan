<?php 
if(!defined('BASEPATH')) exit('No direct script access allowed');
class wbadmin extends CI_Controller{
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
      $this->load->model('Fe_menu_model');
	  $this->load->model('Adm_menu_mgmt_model');
	  $this->load->model('Fe_menu_mgmt_model');
	  $this->load->model('Upload_model');
	  $this->load->model('Section_model');
	  $this->load->helper('common');
	}
	
	public function index(){
		//$this->session->userdata('user_id')
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('mainpage');			
			$this->load->view('user_main',$data);
		}else{
			//$this->load->view('login');
			redirect('user');
		}
	}
	public function log_on(){
		$uid = $this->input->post("username");
		$pwd = $this->input->post("password");
		if($this->Login_model->isLogin_valid($uid, $pwd)==true){
			$data = $this->load_user_info('mainpage');			
			$this->load->view('user_main',$data);
		}else{
			$this->load->view('login');
		}
	}
	private function load_user_info($page_to_embed){
		$data['page_content']=$page_to_embed;
		$data['left_menu'] = $this->Adm_menu_model->generate_adm_menu(0);
		$data['user_online']=$this->Login_model->get_users_online();
		$data['all_user']=$this->Login_model->get_total_users();
		$data['user_active']=$this->Login_model->get_users_active();
		$data['user_inactive']=$this->Login_model->get_users_inactive();
		$data['full_user_name']=$this->session->userdata('full_name');
		return $data;
	}
	public function menuadm (){
		$data = $this->load_user_info('admin_menu');
		$data['sys_admin_menu'] = $this->Adm_menu_mgmt_model->get_all_sys_admin_menu();	
		$this->load->view('user_main', $data);
	}
	/*Config Admin  Menu Start Here*/
	public function config_menu_admin (){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('admin_menu_mgmt');
			$data['list_icon'] =  $this->Adm_menu_model->get_list_icon();
			//$data['sys_admin_menu'] = $this->Adm_menu_mgmt_model->get_all_sys_admin_menu();	
			$data['tree_menu'] = $this->Adm_menu_mgmt_model->display_menu(0);	
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}
	}
	public function update_sort_order_adm(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('admin_menu_mgmt');
			$this->Adm_menu_mgmt_model->update_sort_order($this->input->post("data_order"));
			$data['tree_menu'] = $this->Adm_menu_mgmt_model->display_menu(0);
		}else{
			$this->load->view('login');
		}
	}
	public function create_main_menu_adm(){
		if($this->session->userdata('user_id')){
			$dtmenu = array(
				'menu_label' => $this->input->post("menu_text"),
				'is_grp_hdr' =>'Y',
				'parent_id' => '0',
				'is_active' => 'Y',
				'sort_order' =>$this->Adm_menu_model->get_main_menu_last_sort_order(),
				'link_menu' => '#'
			);			
			$this->Adm_menu_mgmt_model->insert_data_main_menu($dtmenu);
			
		}else{
			$this->load->view('login');
		}
	}
	public function create_sub_menu_adm(){
		if($this->session->userdata('user_id')){
			$dtmenu = array(
				'menu_label' => $this->input->post("menu_text"),
				'is_grp_hdr' => 'N',
				'parent_id' =>$this->input->post("parent_id"),
				'is_active' =>'Y',
				'sort_order' => $this->Adm_menu_model->get_last_sort_order($this->input->post("parent_id")),
				'link_menu' => $this->input->post("menu_url"),
				'icon_menu' => $this->input->post("menu_icon")
			);			
			$this->Adm_menu_mgmt_model->insert_data_sub_menu($dtmenu);
			
		}else{
			$this->load->view('login');
		}
	}
	public function get_adm_menu(){
		if($this->session->userdata('user_id')){
			$id_menu=$this->input->post("idmenu");
			$this->Adm_menu_model->get_adm_menu_by_id($id_menu);
		}else{
			$this->load->view('login');
		}
	}
	public function delete_menu_adm(){
		if($this->session->userdata('user_id')){
			$id_menu=$this->input->post("idmenu");
			$this->Adm_menu_mgmt_model->delete_sys_admin_menu($id_menu);
		}else{
			$this->load->view('login');
		}
	}
	public function update_menu_adm(){
		if($this->session->userdata('user_id')){
			$id_menu=$this->input->post("id_menu");
			$dtmenu = array(
				'menu_label' =>$this->input->post("menu_text"),
				'link_menu' =>$this->input->post("menu_url"),
				'icon_menu' =>$this->input->post("menu_icon")
			);			
			$this->Adm_menu_mgmt_model->update_sys_admin_menu($id_menu,$dtmenu);
		}else{
			$this->load->view('login');
		}
	}
	
	/*Manage Section Start Here*/
	public function section_management(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('section_mgmt');
			$data['section'] = $this->Section_model->generate_section();
			$this->load->view('user_main', $data);

		}else{
			$this->load->view('login');
		}
	}
	
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
	
	public function update_sectionx(){
		if($this->session->userdata('user_id')){
			$section_id=$this->input->post("section_id");
			$dtmenu = array(
				'section_name' =>$this->input->post("section_name"),
				'section_title' =>$this->input->post("section_title"),
				'section_desc' =>$this->input->post("section_desc"),
				'image_folder' =>$this->input->post("image_folder")
			);			
			$this->Section_model->update_section($section_id, $dtmenu);
		}else{
			$this->load->view('login');
		}
		
	}

		function section_img_upload(){
				$path =$this->input->post('data');
				$config['upload_path']   ='assets/images/upload/'.$path;
				$config['allowed_types'] = 'gif|jpg|png|ico';
				$this->load->library('upload',$config);
		
				if($this->upload->do_upload('userfile')){
					$sec_id=$this->input->post('section_id');
					$nama=$this->upload->data('file_name');
					$dtmenu = array('image_section' =>$this->input->post($nama));
					$this->Section_model->store_img_section($nama,$sec_id);
				}else{
				//	$error = array('error' => $this->upload->display_errors());
					echo $this->upload->display_errors();			
				}
		}
	/*Manage Section End Here*/
	
	/*Config Admin  Menu End Here*/
	
	/*Config FrontEnd  Menu Start Here*/
	public function config_menu_fe (){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('fe_menu_mgmt');
			$data['sys_admin_menu'] = $this->Adm_menu_mgmt_model->get_all_sys_admin_menu();	
			$selected_data = '';// get_data_as_array('link_menu','sys_frontend_menu');
			$data['dt_cbo_article'] = create_chosen_db_combo('cbo_data','sys_fe_content', 'fe_content_id', 'fe_content_title', 'fe_content_id', '-Pages-', $selected_data); //create_db_combo('sys_fe_content', 'fe_content_id', 'fe_content_title', 'fe_content_id', '-Pages-');
			$data['dt_cbo_section'] = create_chosen_db_combo('cbo_section','sys_page_section', 'section_id', 'section_name', 'section_id', '-Section-', $selected_data); //create_db_combo('sys_fe_content', 'fe_content_id', 'fe_content_title', 'fe_content_id', '-Pages-');
			$data['tree_menu'] = $this->Fe_menu_mgmt_model->display_menu(0);	
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}
	}
	
	public function refresh_list_content(){
		$selected_data = get_data_as_array('link_menu','sys_frontend_menu');
		echo create_chosen_db_combo('sys_fe_content', 'fe_content_id', 'fe_content_title', 'fe_content_id', '-Pages-', $selected_data); //create_db_combo('sys_fe_content', 'fe_content_id', 'fe_content_title', 'fe_content_id', '-Pages-');
	}
	
	public function update_sort_order_fe(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('fe_menu_mgmt');
			$this->Fe_menu_mgmt_model->update_sort_order($this->input->post("data_order"));
			$data['tree_menu'] = $this->fe_menu_mgmt_model->display_menu(0);
		}else{
			$this->load->view('login');
		}
	}
	
	public function get_fe_menu(){
		if($this->session->userdata('user_id')){
			$id_menu=$this->input->post("idmenu");
			$this->Fe_menu_model->get_fe_menu_by_id($id_menu);
		}else{
			$this->load->view('login');
		}
	}

	public function create_main_menu_fe(){
		if($this->session->userdata('user_id')){
			$dtmenu = array(
				'menu_label' => $this->input->post("menu_text"),
				'is_grp_hdr' =>'Y',
				'parent_id' => '0',
				'is_active' => 'Y',
				'sort_order' =>$this->Fe_menu_model->get_main_menu_last_sort_order(),
				'link_menu' => $this->input->post("cbo_data"),
				'section_id' => $this->input->post("cbo_section")
			);			
			$this->Fe_menu_mgmt_model->insert_data_main_menu($dtmenu);
			
		}else{
			$this->load->view('login');
		}
	}
	
	public function create_sub_menu_fe(){
		if($this->session->userdata('user_id')){
			$dtmenu = array(
				'menu_label' => $this->input->post("menu_text"),
				'is_grp_hdr' => 'N',
				'parent_id' =>$this->input->post("parent_id"),
				'is_active' =>'Y',
				'sort_order' => $this->Fe_menu_model->get_last_sort_order($this->input->post("parent_id")),
				'link_menu' => $this->input->post("cbo_data"),
				'section_id' => $this->input->post("cbo_section")
			);			
			$this->Fe_menu_mgmt_model->insert_data_sub_menu($dtmenu);
			
		}else{
			$this->load->view('login');
		}
	}
	
	public function update_menu_fe(){
		if($this->session->userdata('user_id')){
			$id_menu=$this->input->post("id_menu");
			$dtmenu = array(
				'menu_label' =>$this->input->post("menu_text"),
				'link_menu' =>$this->input->post("cbo_data"),
				'link_menu' => $this->input->post("cbo_data"),
				'is_active'=>$this->input->post("dd_status"),
				'section_id' => $this->input->post("cbo_section")
			);			
			$this->Fe_menu_mgmt_model->update_sys_admin_menu($id_menu,$dtmenu);
		}else{
			$this->load->view('login');
		}
	}

	public function delete_menu_fe(){
		if($this->session->userdata('user_id')){
			$id_menu=$this->input->post("idmenu");
			$this->Fe_menu_mgmt_model->delete_sys_fe_menu($id_menu);
		}else{
			$this->load->view('login');
		}
	}
	/*FE menu end here*/
	public function do_upload()
        {
                $config['upload_path']          = 'uploads/';
                $config['allowed_types']        = '*';
                $config['max_size']             = 1024;
                //$config['max_width']            = 1024;
                //$config['max_height']           = 768;
                $this->load->library('upload', $config);
                if ( ! $this->upload->do_upload('upload'))
                {
                        $error = array('error' => $this->upload->display_errors());
						print_r($error);
                }
                else
                {
                        $data = array('upload_data' => $this->upload->data());
						// Required: anonymous function reference number as explained above.
						$funcNum = $_GET['CKEditorFuncNum'] ;
						// Optional: instance name (might be used to load a specific configuration file or anything else).
						$CKEditor = $_GET['CKEditor'] ;
						// Optional: might be used to provide localized messages.
						$langCode = $_GET['langCode'] ;
						 
						// Check the $_FILES array and save the file. Assign the correct path to a variable ($url).
						$url = '../uploads/'.$this->Upload_model->get_img_uploaded($data);
						$url_uploaded_img = base_url().'uploads/'.$this->Upload_model->get_img_uploaded($data);
						// Usually you will only assign something here if the file could not be uploaded.
						$message = '';
						echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($funcNum, '$url_uploaded_img', '$message');</script>";						
                }
        }

		function proses_upload(){
				$path = strtolower($this->input->post('img_folder'));
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
		$section_id =$this->input->post('section_id');
		$section_title =$this->input->post('section_title');
		$section_desc =$this->input->post('section_desc');
		$data = array (
					'section_title'=>$section_title,
					'section_desc'=>$section_desc
				);					
		$this->Section_model->update_section($section_id,$data);
	}
		//Untuk menghapus foto
	function remove_foto($id){
		//Ambil token foto
		$token=$this->input->post('token');
		$foto=$this->db->get_where('foto',array('token'=>$token));
		$path =$this->input->post('data');
		if($foto->num_rows()>0){
			$hasil=$foto->row();
			$nama_foto=$hasil->nama_foto;
			if(file_exists($file=FCPATH.'/upload-foto/'.$nama_foto)){
				unlink($file);
			}
			$this->db->delete('foto',array('token'=>$token));

		}


		echo "{}";
	}

function logout()
{
    $user_data = $this->session->all_userdata();
        foreach ($user_data as $key => $value) {
            if ($key != 'session_id' && $key != 'ip_address' && $key != 'user_agent' && $key != 'last_activity') {
                $this->session->unset_userdata($key);
            }
        }
    $this->session->sess_destroy();
    $this->load->view('login');
}

}?>