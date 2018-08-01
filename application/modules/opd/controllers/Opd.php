<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');
require APPPATH . '/libraries/Class.upload.php';
class Opd extends CI_Controller {

	public function __construct() {
	  parent::__construct();
	  $this->load->helper('url');
	  $this->load->helper('form');
	  $this->load->helper('html');
	  $this->load->helper('common');
	  $this->load->database();
	  $this->load->library('form_validation');
	  $this->load->library('pagination');
      $this->load->library('Ajax_pagination');
	  $this->load->model('Opd_model');
      $this->load->model('frontend/frontend_menu_models');
      $this->perPage = 10;
 	}
	
	function detail(){
            $data = array();
            
            //total rows count
            $totalRec = count($this->Opd_model->getRows());
            
            //pagination configuration
            $config['target']      = '#postList'; // div container target for paging on view for ajax
            $config['base_url']    = base_url().'opd/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            
            //get container Template
            //$data = $this->load_user_info('opd');  

            //get the posts data
            $data['posts'] = $this->Opd_model->getRows(array('limit'=>$this->perPage));
            $selected_data = '';
			$data['dt_cbo_article'] = create_chosen_db_combo('section','sys_page_section', 'section_id', 'section_name', 'section_id', '-article-', $selected_data);   
     
			$data['nav_bar_menu']= $this->frontend_menu_models->generate_frontend_menu(0);

            //load the view
            $this->load->view('opd',$data);
            //$this->load->view('wbadmin/user_main',$data);
	}

function ajaxPaginationData(){
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
        $paging_url = base_url().'Opd/ajaxPaginationData';	

	 	$data['posts'] = $this->ajaxPaginationDatax($conditions, $rowcount,'searchFilter',$paging_url );
	 	$this->load->view('opd_list_data', $data, false);
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

    function get_article_data(){
        $article_id = $this->input->post('article_id');
        $this->Opd_model->get_article_by_id($article_id);
	}
}

