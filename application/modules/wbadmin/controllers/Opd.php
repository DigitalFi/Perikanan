<?php 
if(!defined('BASEPATH')) exit('No direct script access allowed');


require APPPATH . '/libraries/Class.upload.php';

class opd extends CI_Controller{
	private $error;
    private $success;

	public function __construct() {
	  parent::__construct();
	  $this->load->database();
	  $this->load->helper('url');
      $this->load->helper('html');
 	  $this->load->helper('form');
	  $this->load->helper('common');
	  $this->load->helper(array('url','file'));
	  $this->load->library('session');
 	  $this->load->library('form_validation');
	  $this->load->library('pagination');
      $this->load->library('Ajax_pagination');
      $this->load->model('Login_model');
      $this->load->model('Adm_menu_model');
	  $this->load->model('Opd_model');
  	  $this->load->model('Section_model');
	  $this->load->model('file_model', 'file');
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

	function list_opd(){
         if($this->session->userdata('user_id')){
            $data = array();
            
            //total rows count
            $totalRec = count($this->Opd_model->getRows());
            
            //pagination configuration
            $config['target']      = '#postList'; // div container target for paging on view for ajax
            $config['base_url']    = base_url().'wbadmin/opd/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            
            //get container Template
            $data = $this->load_user_info('opd');  

            //get the posts data
            $data['posts'] = $this->Opd_model->getRows(array('limit'=>$this->perPage));
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

        $rowcount= count($this->Opd_model->getRows($conditions));
        $paging_url = base_url().'wbadmin/Opd/ajaxPaginationData';	

	 	$data['posts'] = $this->ajaxPaginationDatax($conditions, $rowcount,'searchFilter',$paging_url );
	 	$this->load->view('wbadmin/opd_list_data', $data, false);
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
        
        $model_name = 'Opd_model';
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
			$sort_order =  get_last_sort_order('sys_fe_content', 'fe_content_sort_order', 'fe_section_name', '30' );
			$sysdate = date("Y-m-d H:i:s");
			$msg_save='';	
			if($flag_save=='1'){
				$dtarticle = array(    
                    'fe_section_name'=>'30',
                    'fe_content_title'=>$this->input->post('nm_opd'),
                    'fe_content_short_desc'=>$this->input->post('no_arsip'),
                    'fe_full_content'=>$this->input->post('judul_arsip'),
                    'display_start_from'=>format_date_as_db_format($this->input->post('txt_tgl_terbit')),
                    'fe_link_clickable'=>'Y',
                    'fe_content_sort_order'=>$sort_order,
                    'status_active'=> 'Y',
                    'create_date'=>$sysdate,
                    'create_by' =>$this->session->userdata('name')
	            );
				$this->Opd_model->save_data_article($dtarticle);
	            $msg_save.= 'Data Saved successfully ';
			}else{
				$article_id = $this->input->post('hdn_article_id');
				$dtarticle = array(    
                    'fe_content_title'=>$this->input->post('nm_opd'),
                    'fe_content_short_desc'=>$this->input->post('no_arsip'),
                    'fe_full_content'=>$this->input->post('judul_arsip'),
                    'display_start_from'=>format_date_as_db_format($this->input->post('txt_tgl_terbit')),
                     'fe_link_clickable'=>'Y',
                    'fe_content_sort_order'=>$sort_order,
                    'status_active'=> 'Y',
                    'update_date'=>$sysdate,
                    'update_by' =>$this->session->userdata('name')
	            );
				$this->Opd_model->update_data_article($dtarticle, $article_id);
				$msg_save.= 'Data Updated successfully ';
			}
			echo $msg_save; 
		}else{
          	$this->load->view('user/login'); 
      	}	
	}



    function get_article_data(){
        if($this->session->userdata('user_id')){    
            $article_id = $this->input->post('article_id');
            $this->Opd_model->get_article_by_id($article_id);
         }else{
            $this->load->view('user/login');     
        }   
    }

	function row_delete(){
		$arr_id = $this->input->post('id_content');
		echo $this->Opd_model->row_delete($arr_id);
		
	}	

	private function load_user_info($page_to_embed){
		$data['page_content']=$page_to_embed;
		$data['left_menu'] = $this->Adm_menu_model->generate_adm_menu(0);
		$data['full_user_name']=$this->session->userdata('full_name');
		return $data;
	}


}
?>