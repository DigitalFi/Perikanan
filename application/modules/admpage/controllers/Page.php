<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Page extends CI_Controller {
    public $menu = "Home";
	public function __construct() {
	  parent::__construct();
	  $this->load->helper('common');
      $this->load->library('Ajax_pagination');
      $this->load->model('Page_model');
      $this->perPage = get_sys_setting("004");
	}

    function index(){
		if($this->session->userdata('user_id')){
            $totalRec = count($this->Page_model->getRows());
            $idmenu = $this->input->post('idmenu');
            //pagination configuration
            $config['target']      = '#postList';
            $config['base_url']    = base_url().'admpage/page/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            $selected_data ='';
            $data_src = $this->Page_model->getRows(array('limit'=>$this->perPage));
            $data_master_template = $this->Page_model->get_master_template();
            $lbl_menu = $this->input->post('label');
            $breadcrumb = array(ucfirst($this->uri->segment(2)),ucfirst($this->input->get('menu'))); 
            $filter_article_type =" WHERE parent_id_template='0'";
            $cbo_template=create_chosen_db_combo('template_id','reff_template', 'id_template', 'nm_template', 'id_template', '', $selected_data, $filter_article_type,false);            
            $cbo_article=create_chosen_db_combo('article_id','tbl_article', 'id_article', 'title', 'id_article', '', $selected_data, '',true);            
            $data=array('posts'=>$data_src,
                        'data_master_template'=>$data_master_template,
                        'title' =>$lbl_menu,
                        'bc' => $breadcrumb,
                        'webcontent' => 'page',
                        'cbo_template' =>$cbo_template,
                        'cbo_article' =>$cbo_article,
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

    public function insert_page(){
        $item_template = $this->input->post('selected_item');
        $arr_template = explode("|", $item_template);
        $mainpage = $this->input->post('page_type');
        $selected_template = explode(",", $arr_template[1]);
        $arr_page_template_rows= array_merge($selected_template);

        $arr_dt_page = array(
            'nm_page'=>$this->input->post('nm_page'),
            'main_page'=>$mainpage,
            'create_date'=>getsysdate(),
            'create_by'=>$this->session->userdata('user_id'),
        );

       $default_template = str_replace(",", "|", $arr_template[1]);
       $detail_of = str_replace(",", "|", $arr_template[2]);

       $arr_page_template_single = array(
            'default_template'=>$default_template,
            'id_template'=> $this->input->post('template_id'),
            'detail_of'=>$this->input->post('template_id'), // prev version => $detail_of
            'template_used'=>$detail_of, 
       );

       $arr_tpl_art=array(); $selected_temp ='';
       /*get Obj Name*/
       foreach($selected_template as $objId){
            $objname = 'txt_selected_temp_'.$objId.'';
            $selected_temp=$this->input->post($objname);
            if($selected_temp!=''){
                $arr_tpl_art[]=$selected_temp;
            }else{
                $arr_tpl_art[]=$objId;
            }
       }

       $insert_dt = $this->Page_model->insertdata_page($arr_dt_page,$arr_page_template_rows, $arr_page_template_single, $arr_tpl_art,  $mainpage);
       echo json_encode($insert_dt);
         
    }

    function add_data(){
        if($this->session->userdata('user_id')){    
            $data_master_template = $this->Page_model->get_master_template();
            $filter_article_type =" WHERE parent_id_template='0'";
            $cbo_template=create_chosen_db_combo('template_id','reff_template', 'id_template', 'nm_template', 'id_template', '', '', $filter_article_type,false);           
            $cbo_article=create_chosen_db_combo('article_id','tbl_article', 'id_article', 'title', 'id_article', '', '', '',true);            
            $data=array(
                'data_master_template'=>$data_master_template,
                'cbo_template'=>$cbo_template,
                'cbo_article'=>$cbo_article,
            );
            $this->load->view('page_add', $data, false);
         }else{
            $this->load->view('auth/login');     
        }   
    }

    function editdata(){
        if($this->session->userdata('user_id')){
            $id = $this->input->post('the_id');    
            $page_hdr_info = $this->Page_model->get_page_dataforinit($id);
            $available_template = $this->Page_model->get_availabe_template($id);
            $selected_template = $this->Page_model->get_selected_template($id);
            $template_used = $this->Page_model->get_template_used($id);

            $selected_article ='';
            $cbo_article=create_chosen_db_combo('article_id_edit','tbl_article', 'id_article', 'title', 'id_article', '', $selected_article, '',true);            
            
            $selected_detail_of =' $page_hdr_info->detail_of';
            $filter_article_type =" WHERE parent_id_template='0'";
            $cbo_template=create_chosen_db_combo('template_id_edit','reff_template', 'id_template', 'nm_template', 'id_template', '', $selected_detail_of, '',false);            
            $data=array(
                'hdrInfo'=>$page_hdr_info,
                'cbo_template'=>$cbo_template,
                'cbo_article'=>$cbo_article,
                'available_template'=>$available_template,
                'selected_template'=>$selected_template,
                'template_used'=>$template_used,

            );
            $this->load->view('page_edit', $data, false);
         }else{
            $this->load->view('auth/login');     
        }   
    }

    public function update_page(){
        $id_page = $this->input->post('id_edit');
        $item_template = $this->input->post('selected_item_edit');
        $arr_template = explode("|", $item_template);
        $mainpage = $this->input->post('page_type_edit');
        $selected_template = explode(",", $arr_template[1]);
        $arr_page_template_rows= array_merge($selected_template);

        $arr_dt_page = array(
            'nm_page'=>$this->input->post('nm_page_edit'),
            'main_page'=>$mainpage,
            'create_date'=>getsysdate(),
            'create_by'=>$this->session->userdata('user_id'),
        );

       $default_template = str_replace(",", "|", $arr_template[1]);
       $detail_of = str_replace(",", "|", $arr_template[2]);

       $arr_page_template_single = array(
            'default_template'=>$default_template,
            'id_template'=> $this->input->post('template_id_edit'),
            'detail_of'=>$this->input->post('template_id_edit'), // prev version => $detail_of
            'template_used'=>$detail_of, 
       );

       $arr_tpl_art=array(); $selected_temp ='';
       /*get Obj Name*/
       foreach($selected_template as $objId){
            $objname = 'txt_selected_temp_edit_'.$objId.'';
            $selected_temp=$this->input->post($objname);
            if($selected_temp!=''){
                $arr_tpl_art[]=$selected_temp;
            }else{
                $arr_tpl_art[]=$objId;
            }
       }

       $update_dt = $this->Page_model->updatedata_page($arr_dt_page,$arr_page_template_rows, $arr_page_template_single, $arr_tpl_art,  $mainpage, $id_page);
       echo json_encode($update_dt);
         
    }

    function row_delete(){
        $arr_id = $this->input->post('id_content');
        echo $this->Page_model->row_delete($arr_id);
    }

    function get_template_existing_setting(){
        $template_id = $this->input->post('template_id');
        echo $existingConfig = $this->Page_model->getTemplateExistingSetting($template_id);
    }

}