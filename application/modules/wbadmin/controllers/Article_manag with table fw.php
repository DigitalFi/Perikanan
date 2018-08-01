<?php 
if(!defined('BASEPATH')) exit('No direct script access allowed');
class Article_manag extends CI_Controller{
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


	
	public function indexx(){
		if($this->session->userdata('user_id')){
			$data = $this->load_user_info('article_main');
			$data['makeColums'] = $this->makeColumns();
			$data['getTotalData'] = $this->getTotalData();
			$data['perPage'] = $this->perPage();
			$this->load->view('user_main', $data);
		}else{
			$this->load->view('login');
		}
	}
	
function index($offset = 0){
	 $this->load->library('pagination');
	
	// Config setup
	$num_rows=$this->db->count_all("sys_fe_content");
	 $config['base_url'] = base_url().'wbadmin/article_manag/index';
	 $config['total_rows'] = $num_rows;
	 $config['per_page'] = 5;
	 $config['num_links'] = $num_rows;
	 $config['use_page_numbers'] = TRUE;
	 $config['full_tag_open'] = '<ul class="pagination">';
	 $config['full_tag_close'] = '</ul>';
	 $config['prev_link'] = '&laquo;';
	 $config['prev_tag_open'] = '<li>';
	 $config['prev_tag_close'] = '</li>';
	 $config['next_tag_open'] = '<li>';
	 $config['next_tag_close'] = '</li>';
	 $config['cur_tag_open'] = '<li class="active"><a href="#">';
	 $config['cur_tag_close'] = '</a></li>';
	 $config['num_tag_open'] = '<li>';
	 $config['num_tag_close'] = '</li>';
	$config['next_link'] = '&raquo;';
	
	 $this->pagination->initialize($config);
	
	$data = $this->load_user_info('article_main');
	$this->db->select('fe_content_id, fe_content_title, fe_content_short_desc, fe_full_content, fe_img_files, status_active');
	$data['records']=$this->db->get('sys_fe_content', $config['per_page'],$offset);// take record of the table
	$this->load->view('user_main', $data);
 }
	public function nav_article(){
		if($this->session->userdata('user_id')){
			$data['makeColums'] = $this->makeColumns();
			$data['getTotalData'] = $this->getTotalData();
			$data['perPage'] = $this->perPage();
		}else{
			$this->load->view('login');
		}
	}

	
function getData(){
     
        $page = $this->input->post('page'); //Look at $config['postVar']
        if(!$page):
        $offset = 0;
        else:            
        $offset = $page;
        endif;
        
        $sql = "SELECT * FROM sys_fe_content LIMIT ".$offset.", ".$this->perPage();
        $q = $this->db->query($sql);
    
        return $q->result();
        
    }
    function getTotalData(){
       
      $sql = "SELECT * FROM sys_fe_content";
      $q = $this->db->query($sql);
      
      return $q->num_rows();
      
    }
    
    function perPage(){
         return 5; //define total records per page
      }
    
    //Generate table from array
    function makeColumns(){
      
         $peoples = $this->getData();
         foreach($peoples as $pep):
         $data[] = $pep->fe_content_id;
         $data[] = $pep->fe_content_title;
         $data[] = $pep->fe_content_short_desc;
         $data[] = $pep->fe_img_files;
         $data[] = $pep->status_active;
         endforeach;
		 $tmpl = array ( 'table_open'  => '<table  class="table table-bordered table-hover">' );
		 $this->table->set_template($tmpl);
         $this->table->set_heading('Content_ID', 'Title', 'Short Description', 'File Image', 'Status Active');
         return  $this->table->make_columns($data, 5);
    }
}
?>