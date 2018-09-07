<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_menu extends CI_Controller {
    public $menu = "Home";
	public function __construct() {
	  parent::__construct();
	  $this->load->helper('common');
      $this->load->model('Front_menu_model');
	}

    function index(){
		if($this->session->userdata('user_id')){
            $breadcrumb = array(ucfirst($this->uri->segment(2)),ucfirst($this->input->get('menu'))); 
            $data=array(
                'bc' => $breadcrumb,
                'webcontent' => 'front_menu',
                'root'=> $this->menu,
            );
            $this->load->view('layout_adm/wrapper',$data);
		}else{
			$this->load->view('auth/login');
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

        $rowcount= count($this->Page_model->getRows($conditions));
        $paging_url = base_url().'admpage/ajaxPaginationData';	

	 	$data['posts'] = $this->ajaxPaginationDatax($conditions, $rowcount,'searchFilter',$paging_url );
	 	$this->load->view('page_data', $data, false);
	}else{
	 	$this->load->view('auth/login'); 
	}
}

    function ajaxPaginationDatax($conditions, $rowcount, $func_name_from_view,$paging_url){
        if($this->session->userdata('user_id')){
            //calc offset number
            $page = $this->input->post('page');
            if(!$page){
                $offset = 0;
            }else{
                $offset = $page;
            }
            
            $model_name = 'Page_model';
            $funct_model_name = 'getRows';
           
            //pagination configuration
            $config['target']      = '#postList';
            $config['base_url']    = $paging_url; 
            $config['total_rows']  = $rowcount;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = $func_name_from_view ;//'searchFilter';
            $config['uri_segment'] = 4;
            $this->ajax_pagination->initialize($config);
            
            //set start and limit
            $conditions['start'] = $offset;
            $conditions['limit'] = $this->perPage;

            return $this->$model_name->$funct_model_name($conditions);
        }else{
            $this->load->view('auth/login'); 
        }
    }

    
    function editdata(){
        if($this->session->userdata('user_id')){    
            $id = $this->input->post('the_id');
            $init_data=$this->Front_menu_model->get_dataforinit($id);
            if(isset($init_data->id_pages)){
                $selected_data = $init_data->id_pages;
            }else{
                $selected_data='';
            }
             $selected_data_article='';
            $cbo_page=create_chosen_db_combo('page','tbl_pages', 'id_pages', 'nm_page', 'id_pages', '', $selected_data, '',false);
            $cbo_article=create_chosen_db_combo('article','tbl_article', 'id_article', 'title', 'id_article', '', $selected_data_article, '',false);
            $data=array(
                        'dt_init'=>$init_data,
                        'cbo_page'=>$cbo_page,
                        'cbo_article'=>$cbo_article,
                        'menu_label'=>$init_data->menu_label,
                        'link_menu'=>$init_data->link_menu,
                    );
            $this->load->view('front_menu_edit', $data, false);
         }else{
            $this->load->view('auth/login');     
        }   
    }

    public function setting_menu(){
        $id = $this->input->post('id_menu');
            $dtarray = array(       
                'id_pages'=>$this->input->post('page'),
                'link_menu'=>$this->input->post('urlpage'),
            ); 
            $update_dt = $this->Front_menu_model->setting_menu($dtarray, $id);
            echo json_encode($update_dt);

         
    }

    function row_delete(){
        $arr_id = $this->input->post('id_content');
        echo $this->Page_model->row_delete($arr_id);
    }

}