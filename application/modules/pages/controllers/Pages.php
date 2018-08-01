<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Pages Management class created by CodexWorld
 */
class Pages extends CI_Controller {
    
    function __construct() {
        parent::__construct();
        $this->load->helper('url');
        $this->load->helper('common');
        $this->load->database();
        $this->load->model('pages_model');
        $this->load->library('Ajax_pagination');
        $this->load->model('wbadmin/Adm_menu_model');
        $this->load->model('wbadmin/Section_model');

        $this->perPage = 5;
    }
    
    private function load_user_info($page_to_embed){
        $data['page_content']=$page_to_embed;
        $data['left_menu'] = $this->Adm_menu_model->generate_adm_menu(0);
        $data['full_user_name']=$this->session->userdata('full_name');
        return $data;
    }
    public function index(){
         if($this->session->userdata('user_id')){
            $data = array();
            
            //total rows count
            $totalRec = count($this->pages_model->getRows());
            
            //pagination configuration
            $config['target']      = '#postList';
            $config['base_url']    = base_url().'pages/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            
            //get container Template
            $data = $this->load_user_info('pages');  

            //get the posts data
            $data['data_section']=$this->pages_model->get_page_section();
            $data['posts'] = $this->pages_model->getRows(array('limit'=>$this->perPage));
            $selected_data = '';// get_data_as_array('link_menu','sys_frontend_menu');
            $data['dt_cbo_article'] = create_chosen_db_combo('cbo_article','sys_fe_content', 'fe_content_id', 'fe_content_title', 'fe_content_id', '-Pages-', $selected_data);        
            //load the view
            $this->load->view('wbadmin/user_main',$data);
        }else{
            $this->load->view('user/login');
        }    
    }
    
    function ajaxPaginationData(){
      if($this->session->userdata('user_id')){
        $conditions = array();
        
        //calc offset number
        $page = $this->input->post('page');
        if(!$page){
            $offset = 0;
        }else{
            $offset = $page;
        }
        
        //set conditions for search
        $keywords = $this->input->post('keywords');
        $sortBy = $this->input->post('sortBy');
        if(!empty($keywords)){
            $conditions['search']['keywords'] = $keywords;
        }
        if(!empty($sortBy)){
            $conditions['search']['sortBy'] = $sortBy;
        }
        
        //total rows count
        $totalRec = count($this->pages_model->getRows($conditions));
        
        //pagination configuration
        $config['target']      = '#postList';
        $config['base_url']    = base_url().'pages/ajaxPaginationData';
        $config['total_rows']  = $totalRec;
        $config['per_page']    = $this->perPage;
        $config['link_func']   = 'searchFilter';
        $this->ajax_pagination->initialize($config);
        
        //set start and limit
        $conditions['start'] = $offset;
        $conditions['limit'] = $this->perPage;
        
        //get posts data
        $data['data_section']=$this->pages_model->get_page_section();
        $data['posts'] = $this->pages_model->getRows($conditions);
        
        //load the view
        $this->load->view('pages/pages_data', $data, false);
      }else{
          $this->load->view('user/login'); 
      }  
    }

    function insertpage(){
        if($this->session->userdata('user_id')){
            if (strpos($this->input->post("hdn_item"), 'item') !== false){
                $src_data = str_replace("&", "", $this->input->post("hdn_item"));
                $arr_data = explode("item[]=", $src_data);
                $arr_data2 = array_values($arr_data);
                $filteredarray = array_values( array_filter($arr_data2) );
                $dt_section = join('|',$filteredarray);

                $dt_pages = array(    
                    'page_name'=>$this->input->post('page_name'),
                    'section_name'=>$dt_section,
                    'is_main_page'=>$this->input->post('ismainpage'),
                    'article_id'=>$this->input->post('cbo_article'),
                    'page_name'=>$this->input->post('pgname')
                );
             }else{
                $dt_pages = array(    
                    'page_name'=>$this->input->post('page_name'),
                    'is_main_page'=>$this->input->post('ismainpage'),
                    'article_id'=>$this->input->post('cbo_article'),
                    'page_name'=>$this->input->post('pgname')
                );

             }    
          $this->pages_model->save_pages($dt_pages); 
        }else{
            $this->load->view('user/login');     
        }   
   
    }

    function updatepage(){
        if($this->session->userdata('user_id')){
            if (strpos($this->input->post("hdn_item"), 'item') !== false){
                $src_data = str_replace("&", "", $this->input->post("hdn_item"));
                $arr_data = explode("item[]=", $src_data);
                $arr_data2 = array_values($arr_data);
                $filteredarray = array_values( array_filter($arr_data2) );
                $dt_section = join('|',$filteredarray);

                $dt_pages = array(    
                    'page_name'=>$this->input->post('page_name'),
                    'section_name'=>$dt_section,
                    'is_main_page'=>$this->input->post('ismainpage'),
                    'article_id'=>$this->input->post('cbo_article'),
                    'page_name'=>$this->input->post('pgname')
                );
             }else{
                $dt_pages = array(    
                    'page_name'=>$this->input->post('page_name'),
                    'is_main_page'=>$this->input->post('ismainpage'),
                    'article_id'=>$this->input->post('cbo_article'),
                    'page_name'=>$this->input->post('pgname')
                );

             }    
          $this->pages_model->update_pages($dt_pages, $this->input->post("hdn_pg_id")); 
        }else{
            $this->load->view('user/login');     
        }   
   
    }
    function deletepage(){
        if($this->session->userdata('user_id')){
            $dt_pages = $this->input->post('id_pages');
            $this->pages_model->delete_pages($dt_pages); 
         }else{
            $this->load->view('user/login');     
        }   
       
    }

    function get_page_data(){
        if($this->session->userdata('user_id')){    
            $page_id = $this->input->post('id_page');
            $this->pages_model->get_pages_by_id($page_id);
         }else{
            $this->load->view('user/login');     
        }   
    }

    function get_section_list(){
      if($this->session->userdata('user_id')){    
            $this->pages_model->get_section_list();
       }else{
            $this->load->view('user/login');     
      }   
    }
}