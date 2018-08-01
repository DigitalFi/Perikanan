<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Pages extends CI_Controller
{
   public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->library('session');
      $this->load->helper('html');
 	  $this->load->helper('form');
 	  $this->load->library('form_validation');
	  $this->load->helper(array('url','file'));
      $this->load->model('Login_model');
      $this->load->model('Adm_menu_model');
	  $this->load->model('Pages_model');
	  $this->load->library('pagination');
  	  $this->load->model('Section_model');
	  $this->load->helper('common');

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
	
function index(){
	//pagination settings
	  if($this->session->userdata('user_id')){
		 $search_value = $this->input->post("s_value");
		  
		$jumlah_data = $this->Pages_model->jumlah_data($search_value);
		$config['base_url'] = base_url().'wbadmin/pages';
		$config['total_rows'] = $jumlah_data;
		$config['per_page'] = get_sys_setting('004');
		$from = $this->uri->segment(4);

        $config['full_tag_open'] = '<ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = false;
        $config['last_link'] = false;
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['prev_link'] = '&laquo';
        $config['prev_tag_open'] = '<li class="prev">';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = '&raquo';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';		
		
		$this->pagination->initialize($config);		
		$data = $this->load_user_info('pages');
		$data['after_del'] ='0';
		$data['data_section']=  $this->Pages_model->get_page_section(); 
		$data['pages'] = $this->Pages_model->data_page($config['per_page'],$from, $search_value );
		$data['data_per_page'] = $config['per_page'] ;
		$this->load->view('user_main', $data);
	  }else{
		$this->load->view('login');
	}		
}

function save_page_section(){
	$src_data = str_replace("&", "", $this->input->post("idmenu"));
	$arr_data = explode("item[]=", $src_data);
	foreach ($arr_data as $dt){
		if($dt!=''){
			
					}
	}
	

}

function load_page_after_delete(){
	//pagination settings
	  if($this->session->userdata('user_id')){
		 $search_value = $this->input->post("s_value");
		  
		$jumlah_data = $this->Pages_model->jumlah_data($search_value);
		$config['base_url'] = base_url().'wbadmin/page';
		$config['total_rows'] = $jumlah_data;
		$config['per_page'] = get_sys_setting('004');
		$from = $this->uri->segment(4);

        $config['full_tag_open'] = '<ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_link'] = false;
        $config['last_link'] = false;
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['prev_link'] = '&laquo';
        $config['prev_tag_open'] = '<li class="prev">';
        $config['prev_tag_close'] = '</li>';
        $config['next_link'] = '&raquo';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';		
		
		$this->pagination->initialize($config);		
		$data['after_del'] = '1';
		$data['pages'] = $this->Pages_model->data_page($config['per_page'],$from, $search_value );
		$this->load->view('pages', $data);
	  }else{
		$this->load->view('login');
	}		
}
	function search_article($offset = 0){
		if($this->session->userdata('user_id')){
			$search_value = $this->input->post("s_value");
			//$data['list_section'] = $this->Section_model->get_list_section();
			echo $this->Article_model->load_article($offset, $search_value);
		}else{
			$this->load->view('login');
		}	
	 }

	function add_article(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('article_add');
			$data['list_section'] = create_db_combo('sys_page_section', 'section_name', 'section_name', 'sort_order', '-Please Select-') ;// $this->Section_model->get_list_section();
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}	
	}

	function edit_article($id){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('article_edit');
			$data['list_section'] = create_db_combo('sys_page_section', 'section_name', 'section_name', 'sort_order', '-Please Select-') ;// $this->Section_model->get_list_section();
			$data['data_article'] = $this->Article_model->get_data_article($id);
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}	
	}

	function load_article_add_ui(){
		if($this->session->userdata('user_id')){
			$list_section = $this->Section_model->get_list_section();
		 	$frm = $this->Article_model->load_article_add_ui($list_section);
			echo $frm;
		}else{
			$this->load->view('login');
		}	
	 }

	function save_article_ver1(){
	 	$path_file = strtolower($this->input->post("section"));
		if($this->session->userdata('user_id')){
			$config['upload_path']          = 'assets/images/upload/'.$path_file;
			$config['allowed_types']        = 'gif|jpg|png|jpeg';
			$config['max_size']             = 10024;
			$config['max_width']            = 1024;
			$config['max_height']           = 768;
			$this->load->library('upload', $config);

			//echo $_FILES['gambar'];

			$file= $_FILES["gambar"];

			/*if (!$this->upload->do_upload('gambar')){
				$error = array('error' => $this->upload->display_errors());
				print_r($error);
				//echo $config['upload_path'] . $error['error'];
				// echo $this->load->view('article_add', $error);
			}else{
				//$data = array('upload_data' => $this->upload->data());
				$image_info  = $this->upload->data();
				$sort_order = get_last_sort_order('sys_fe_content',  'fe_section_name', $this->input->post("section") );
				//Inser Artilce
				$dtarticle= array(
					'fe_img_files' =>$image_info['file_name'],
					'fe_content_title' =>$this->input->post("title"),
					'fe_content_short_desc' =>$this->input->post("short_desc"),
					'fe_section_name' =>$this->input->post("section"),
					'fe_content_sort_order' =>$sort_order,
					'fe_content_btn_label' =>$this->input->post("lblbutton"),
					'fe_full_content' => htmlentities($this->input->post("editor1"))
				);
				echo $this->Article_model->insert_content($dtarticle);
				//$data['list_section'] = $this->Section_model->get_list_section();
				//$this->load->view('user_main', $data);
			}*/
		}else{
			$this->load->view('login');
		}
	}	


public function save_article(){
	if($this->session->userdata('user_id')){
		$sort_order='';
		$path_file = strtolower($this->input->post("section"));
		$config['upload_path']          = 'assets/images/upload/'.$path_file;
		$config['allowed_types']        = 'gif|jpg|png|jpeg';
		$config['max_size']             = 1024;
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;
		$config['overwrite'] 			= TRUE;

 		$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
		$filename= $path_file.$sort_order;
 		$config['file_name'] = $filename;	

		$this->load->library('upload', $config);
 
		if ( ! $this->upload->do_upload('gambar')){
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
			//$this->load->view('v_upload', $error);
		}else{
			
			//Inser Artilce
			$image_info  = $this->upload->data();
			//print_r($image_info);
			$ext = $image_info['file_ext'];
			$filename= $path_file.$sort_order.$ext;
			$dtarticle= array(
				'fe_img_files' =>$filename, //['file_name'],
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
				'fe_full_content' => htmlentities($this->input->post("editor1"))
			);
			echo $this->Article_model->insert_content($dtarticle);	
		}
				
	}else{
		$this->load->view('login');
	}
		
}


public function update_article(){
	if($this->session->userdata('user_id')){
		$content_id = $this->input->post("content_id");
		$sort_order='';
		$path_file = strtolower($this->input->post("section"));
		$config['upload_path']          = 'assets/images/upload/'.$path_file;
		$config['allowed_types']        = 'gif|jpg|png|jpeg';
		$config['max_size']             = 1024;
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;
		$config['overwrite'] 			= TRUE;

 		$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
		$filename= $path_file.$sort_order;
 		$config['file_name'] = $filename;	

		$this->load->library('upload', $config);
 
		if ( ! $this->upload->do_upload('gambar')){
			//$error = array('error' => $this->upload->display_errors());
			//print_r($error);
			$dtarticle= array(
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
				'fe_full_content' => htmlentities($this->input->post("editor1"))
			);			//$this->load->view('v_upload', $error);
			echo $this->Article_model->update_content($dtarticle, $content_id);	
		}else{
			
			//Inser Artilce
			$image_info  = $this->upload->data();
			//print_r($image_info);
			$ext = $image_info['file_ext'];
			$filename= $path_file.$sort_order.$ext;
			$dtarticle= array(
				'fe_img_files' =>$filename, //['file_name'],
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
				'fe_full_content' => htmlentities($this->input->post("editor1"))
			);
			echo $this->Article_model->update_content($dtarticle, $content_id);	
		}
				
	}else{
		$this->load->view('login');
	}
		
}


public function update_article_ori(){
	if($this->session->userdata('user_id')){
		$sort_order='';
		$content_id = $this->input->post("content_id");
		$path_file = strtolower($this->input->post("section"));
		$config['upload_path']          = 'assets/images/upload/'.$path_file;
		//$config['allowed_types']        = 'gif|jpg|png';
		//$config['max_size']             = 10204;
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;
		$config['overwrite'] 			= TRUE;

 		$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
		$filename= $path_file.$sort_order;
 		$config['file_name'] = $filename;	

		$this->load->library('upload', $config);
 		
 		//Jika tidak upload gambar
		if (!$this->upload->do_upload('gambar')){
			///echo "kemari blank";
			//update Artilce
			$dtarticle= array(
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
				'fe_full_content' => htmlentities($this->input->post("editor1"))
			);
			echo $this->Article_model->update_content($dtarticle, $content_id, false);	
		}else{
			//update Artilce & image
			//echo "kmari ada ";
			$image_info  = $this->upload->data();
			$ext = $image_info['file_ext'];
			$filename= $path_file.$sort_order.$ext;
			$dtarticle= array(
				'fe_img_files' =>$filename, //['file_name'],
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
				'fe_full_content' => htmlentities($this->input->post("editor1"))
			);
		echo $this->Article_model->update_content($dtarticle, $content_id, true);	
		}
				
	}else{
		$this->load->view('login');
	}
		
}
	function delete() {
		$id_content = $this->input->post('d_value');
		$arr_id = explode("|", $id_content);
		foreach($arr_id as $dt){
				$this->db->delete('sys_pages', array('page_id' => $dt));	
		}

		echo "Data has been deleted";
		$this->load_page_after_delete();
	}


	function refresh_article($offset = 0){
		if($this->session->userdata('user_id')){
			$search_value = $this->input->post("s_value");
			if($offset==0){
				$offset = 0;
			}
			//$data['list_section'] = $this->Section_model->get_list_section();
			echo $this->Article_model->load_article($offset, $search_value);
		}else{
			$this->load->view('login');
		}	
	 }

}

