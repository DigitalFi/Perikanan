<?php 
if(!defined('BASEPATH')) exit('No direct script access allowed');


require APPPATH . '/libraries/Class.upload.php';

class Article_manag extends CI_Controller{
	private $error;
    private $success;

	public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->library('session');
      $this->load->helper('html');
 	  $this->load->helper('form');
 	  $this->load->library('form_validation');
	  $this->load->helper(array('url','file'));
	  $this->load->database();
      $this->load->model('Login_model');
      $this->load->model('Adm_menu_model');
	  $this->load->model('Article_model');
	  $this->load->library('pagination');
  	  $this->load->model('Section_model');
	  $this->load->helper('common');
	  $this->load->model('file_model', 'file');
      $this->load->library('Ajax_pagination');
      $this->perPage = 10;

	}

	private function handle_error($err) {
       echo  $this->error .= $err . "\r\n";
    }
 
    private function handle_success($succ) {
      echo  $this->success .= $succ . "\r\n";
    }	

    function index(){
    	$data ='';
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('mainpage');			
			$this->load->view('user_main',$data);
		}else{
			$this->load->view('login');
		}
	}

	function list_article(){
         if($this->session->userdata('user_id')){
            $data = array();
            
            //total rows count
            $totalRec = count($this->Article_model->getRows());
            
            //pagination configuration
            $config['target']      = '#postList';
            $config['base_url']    = base_url().'wbadmin/article_manag/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            
            //get container Template
            $data = $this->load_user_info('list_article');  

            //get the posts data
            $data['posts'] = $this->Article_model->getRows(array('limit'=>$this->perPage));
            $selected_data = '';
			$data['dt_cbo_article'] = create_chosen_db_combo('section','sys_page_section', 'section_id', 'section_name', 'section_id', '-article-', $selected_data);   
     
            //load the view
            $this->load->view('wbadmin/user_main',$data);
        }else{
            $this->load->view('user/login');
        }    
	}

function ajaxPaginationData(){
	 if($this->session->userdata('user_id')){
 		$conditions = array();
        
        //set conditions for search
        $keywords = $this->input->post('keywords');
        $sortBy = $this->input->post('sortBy');
        if(!empty($keywords)){
            $conditions['search']['keywords'] = $keywords;
        }
        if(!empty($sortBy)){
            $conditions['search']['sortBy'] = $sortBy;
        }

        $rowcount= count($this->Article_model->getRows($conditions));
        $paging_url = base_url().'wbadmin/article_manag/ajaxPaginationData';	

	 	$data['posts'] = $this->ajaxPaginationDatax($conditions, $rowcount,'searchFilter',$paging_url );
	 	$this->load->view('wbadmin/list_article_data', $data, false);
	 }else{
	 	$this->load->view('user/login'); 
	 }

}

 function ajaxPaginationDatax($conditions, $rowcount, $func_name_from_view,$paging_url){
     // if($this->session->userdata('user_id')){
        //calc offset number
        $page = $this->input->post('page');
        if(!$page){
            $offset = 0;
        }else{
            $offset = $page;
        }
        
        $model_name = 'Article_model';
        $funct_model_name = 'getRows';
       
       
        //pagination configuration
        $config['target']      = '#postList';
        $config['base_url']    = $paging_url; //base_url().'wbadmin/article_manag/ajaxPaginationData';
        $config['total_rows']  = $rowcount;
        $config['per_page']    = $this->perPage;
        $config['link_func']   = $func_name_from_view ;//'searchFilter';
        $config['uri_segment'] = 4;
        $this->ajax_pagination->initialize($config);
        
        //set start and limit
        $conditions['start'] = $offset;
        $conditions['limit'] = $this->perPage;

        return $this->$model_name->$funct_model_name($conditions);

        
    }


	function upload_data(){
		if($this->session->userdata('user_id')){
			date_default_timezone_set("Asia/Bangkok");
		 	$t = time();
		 	$flag_save=$this->input->post('flag_save');
			$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
			$sysdate = date("Y-m-d H:i:s");
			$msg_save='';	
			$ret_msg_save='';
			$img_change=true;
			 if($_FILES['file']['error']!=4){ //if image selected to upload

		    	$path = $_FILES['file']['name'];
				$ext = ".".pathinfo($path, PATHINFO_EXTENSION);
				 $handle = new Upload($_FILES['file']);
				 $handle->allowed = 'image/*';
				    if($handle->uploaded) {//IF image begin to upload
				    	$img_name_to_save = "img_$t";
				    	$handle->file_new_name_body = $img_name_to_save;
				        $handle->Process('assets/images/upload/');
				        if($handle->processed) {//if data saved with image
							$dtarticle = array(    
			                    'fe_section_name'=>$this->input->post('section'),
			                    'fe_content_title'=>$this->input->post('title'),
			                    'fe_content_short_desc'=>$this->input->post('short_desc'),
			                    'fe_full_content'=>$this->input->post('editor1'),
			                    'fe_content_btn_label'=>$this->input->post('lblbutton'),
			                    'fe_img_files'=> $img_name_to_save.$ext,
			                    'fe_link_clickable'=>'Y',
			                    'fe_content_sort_order'=>$sort_order,
			                    'status_active'=> 'Y',
			                    'create_date'=>$sysdate,
			                    'create_by' =>$this->session->userdata('name')
				            );
				            $msg_save.= 'Completed successfully ';
				        }
				    }
			}else{// image not selected - image can upload later using edit mode
				$img_change=false;
				$dtarticle = array(    
	                'fe_section_name'=>$this->input->post('section'),
	                'fe_content_title'=>$this->input->post('title'),
	                'fe_content_short_desc'=>$this->input->post('short_desc'),
	                'fe_full_content'=>$this->input->post('editor1'),
	                'fe_content_btn_label'=>$this->input->post('lblbutton'),
	                'fe_link_clickable'=>'Y',
	                'fe_content_sort_order'=>$sort_order,
	                'status_active'=> 'Y',
	                'create_date'=>$sysdate,
	                'create_by' =>$this->session->userdata('name')
	            );
	            $msg_save.= 'With no image included/changes, you can add/change image later using edit menu ';
			}
			if($flag_save=='1'){
				$this->Article_model->save_data_article($dtarticle);
				$ret_msg_save="Data Saved  ". $msg_save;
			}else{
				$article_id = $this->input->post('hdn_article_id');
				$fname = get_saved_file_name_direct($article_id);
				$full_fname = 'assets/images/upload/'.$fname;
				if($this->input->post('flag_img_del')=='1'){//if deleted is checked
					if($fname!=''){
						if(file_exists($full_fname)){
							unlink($full_fname);
						}
						$dtarticle = array(    
		                    'fe_img_files'=>'',
		                    'update_date'=>$sysdate,
		                    'update_by' =>$this->session->userdata('name')
				           );	
						$msg_save=' with image deleted';
					}
				}
				if($img_change==true && $fname !=''){
					unlink($full_fname);
				}
				$this->Article_model->update_data_article($dtarticle, $article_id);
				$ret_msg_save.="Data Updated  ". $msg_save;
			}
			echo $ret_msg_save; 
		}else{
          	$this->load->view('user/login'); 
      	}	
	}

    function get_article_data(){
        if($this->session->userdata('user_id')){    
            $article_id = $this->input->post('article_id');
            $this->Article_model->get_article_by_id($article_id);
         }else{
            $this->load->view('user/login');     
        }   
    }

	function row_delete(){
		$arr_id = $this->input->post('id_content');
		echo $this->Article_model->row_delete($arr_id);
		
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


	
function load_article(){
	//pagination settings
	  if($this->session->userdata('user_id')){
		 $search_value = $this->input->post("s_value");
		  
		$jumlah_data = $this->Article_model->jumlah_data($search_value);
		$config['base_url'] = base_url().'wbadmin/article_manag/load_article';
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
		$data = $this->load_user_info('article_main');
		$data['after_del'] = '0';
		$data['article'] = $this->Article_model->data_article($config['per_page'],$from, $search_value );
		$data['data_per_page'] = $config['per_page'] ;
		$this->load->view('user_main', $data);
	  }else{
		$this->load->view('login');
	}		
}


function load_article_after_delete(){
	//pagination settings
	  if($this->session->userdata('user_id')){
		 $search_value = $this->input->post("s_value");
		  
		$jumlah_data = $this->Article_model->jumlah_data($search_value);
		$config['base_url'] = base_url().'wbadmin/article_manag/load_article';
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
		$data['article'] = $this->Article_model->data_article($config['per_page'],$from, $search_value );
		$this->load->view('article_main', $data);
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
			$data['list_section'] = create_db_combo('sys_page_section', 'section_id', 'section_name', 'sort_order', '-Please Select-') ;// $this->Section_model->get_list_section();
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}	
	}

	function edit_article($id){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('article_edit');
			$data['list_section'] = create_db_combo('sys_page_section', 'section_id', 'section_name', 'sort_order', '-Please Select-') ;// $this->Section_model->get_list_section();
			$data['file_dtl'] = $this->Article_model->get_data_detail_file($id);
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
			$config['allowed_types']        = 'gif|jpg|png|jpeg|pdf';
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

public function save_article_multi_file(){
	 //file upload destination
			$folder_name = get_foldername_by_section_id($this->input->post("section"));
			$path_file = strtolower($folder_name);
            $dir_path = 'assets/images/upload/'.$path_file;
            $config['upload_path'] = $dir_path;
            $config['allowed_types'] = '*';
            $config['max_size'] = '0';
            $config['max_filename'] = '255';
            $config['encrypt_name'] = TRUE;

            //upload file
            $i = 0;
            $files = array();
            $file_desc = array();

            $file_desc =$this->input->post('fdesc');
            // print_r($file_desc);


            $is_file_error = FALSE;

            if ($_FILES['upload_file1']['size'] <= 0) {
                $this->handle_error('Select at least one file.');
            } else {
                foreach ($_FILES as $key => $value) {
                    if (!empty($value['name'])) {
                        $this->load->library('upload', $config);
                        if (!$this->upload->do_upload($key)) {
                            $this->handle_error($this->upload->display_errors());
                            $is_file_error = TRUE;
                        } else {
                            $files[$i] = $this->upload->data();
                            ++$i;
                        }
                    }
                }
            }

            // There were errors, we have to delete the uploaded files
            if ($is_file_error && $files) {
                for ($i = 0; $i < count($files); $i++) {
                    $file = $dir_path . $files[$i]['file_name'];
                    if (file_exists($file)) {
                        unlink($file);
                    }
                }
            }

            if (!$is_file_error && $files) {
                $resp = $this->file->save_files_info($files, $file_desc);
                if ($resp === TRUE) {
                    $this->handle_success('File(s) was/were successfully uploaded.');
                } else {
                    for ($i = 0; $i < count($files); $i++) {
                        $file = $dir_path . $files[$i]['file_name'];
                        if (file_exists($file)) {
                            unlink($file);
                        }
                    }
                    $this->handle_error('Error while saving file info to Database.');
                }
            }
       // }
        $data['errors'] = $this->error;
		$data['success'] = $this->success;
       // $this->load->view('uploadfiles', $data);
 }

public function save_article(){
	if($this->session->userdata('user_id')){
		$sort_order='';

		$folder_name = get_foldername_by_section_id($this->input->post("section"));
		$path_file = strtolower($folder_name);
		$config['upload_path']          = 'assets/images/upload/'.$path_file;
		$config['allowed_types']        = '*';
		$config['max_size']             = 5120;
		//$config['max_width']          = 1024;
		//$config['max_height']         = 768;
		$config['overwrite'] 			= TRUE;

 		$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
		$filename= $path_file.$sort_order;
 		$config['file_name'] = $filename;	

		$this->load->library('upload', $config);
 
		if ( ! $this->upload->do_upload('gambar')){
			$error = array('error' => $this->upload->display_errors());
			$image_info  = $this->upload->data();
			//print_r($image_info);
			$ext = $image_info['file_ext'];
			$filename= $path_file.$sort_order.$ext;
			$dtarticle= array(
				'fe_full_content' => htmlentities($this->input->post("editor1")),
				'fe_img_files' =>$config['file_name'].$ext, //['file_name'],
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
			);
			echo $this->Article_model->insert_content($dtarticle);				
			//print_r($error);
			//$this->load->view('v_upload', $error);
		}else{
			
			//Inser Artilce
			$image_info  = $this->upload->data();
			//print_r($image_info);
			$ext = $image_info['file_ext'];
			$filename= $path_file.$ext;
			$dtarticle= array(
				'fe_full_content' => htmlentities($this->input->post("editor1")),
				'fe_img_files' =>$config['file_name'].$ext, //['file_name'],
				'fe_content_title' =>$this->input->post("title"),
				'fe_content_short_desc' =>$this->input->post("short_desc"),
				'fe_section_name' =>$this->input->post("section"),
				'fe_content_sort_order' =>$sort_order,
				'fe_content_btn_label' =>$this->input->post("lblbutton"),
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
		$folder_name = get_foldername_by_section_id($this->input->post("section"));
		$path_file = strtolower($folder_name);
		$config['upload_path']          = 'assets/images/upload/'.$path_file;
		$config['allowed_types']        = 'gif|jpg|png|jpeg|pdf|doc|docx';
		$config['max_size']             = 5120;
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;
		$config['overwrite'] 			= TRUE;

 		$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', $this->input->post("section") );
		$filename= $path_file.$content_id;
		//$filename= $path_file;
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
			);			
			echo $this->Article_model->update_content($dtarticle, $content_id);	
		}else{
			
			//Inser Artilce
			$image_info  = $this->upload->data();
			$ext = $image_info['file_ext'];
			$filename= $path_file.$content_id.$ext;
			$dtarticle= array(
				'fe_img_files' =>$config['file_name'].$ext, //['file_name'],
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
	function delete_selected_article() {
		$id_content = $this->input->post('d_value');
		$img_root_folder = 'assets/images/upload/';
		$arr_id = explode("|", $id_content);
		$del = false;
		foreach($arr_id as $dt){
			
			$fname = get_saved_file_name($dt);
			$full_fname = $img_root_folder.$fname; 
			//echo $full_fname ."<br>";
			if(file_exists($full_fname)){
				@unlink($full_fname);
				$this->Article_model->delete_article($dt);
				//$this->db->delete('sys_fe_contentx', array('fe_content_id' => $dt));	
				$del = true;
			}else{
				$this->Article_model->delete_article($dt);
				echo "Image of this article not Found, but article has been deleted <br>";
				$del = true;
			}			
		}

		if($del){
			echo "Data has been deleted succesfully";
		}else{
			echo "Deleted Failed";
		}
		$this->load_article_after_delete();
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

	 function del_img_artilce($id){
			if(file_exists($this->input->post('img_folder'))){
				@unlink($this->input->post('img_folder'));
				echo $this->Article_model->update_img_selected_article($id);
			}else{
				$result = $this->Article_model->update_img_selected_article($id);
				echo 'File ['.$this->input->post('img_folder').'] you want to delete does not exist '. $result;
			}	 		
	 }

}
?>