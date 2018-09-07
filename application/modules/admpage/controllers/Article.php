<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Article extends CI_Controller {
    public $menu = "Home";
	public function __construct() {
	  parent::__construct();
	  $this->load->helper('common');
      $this->load->library('Ajax_pagination');
      $this->load->model('Article_model');
      $this->perPage = get_sys_setting("004");
	}

    function index(){
		if($this->session->userdata('user_id')){
            $totalRec = count($this->Article_model->getRows());
            $idmenu = $this->input->post('idmenu');
            //pagination configuration
            $config['target']      = '#postList';
            $config['base_url']    = base_url().'admpage/article/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            $selected_data ='';
            $selected_data_kec ='';
            $data_src = $this->Article_model->getRows(array('limit'=>$this->perPage));
            $cbo_article_type=create_chosen_db_combo('article_type','reff_template', 'id_template', 'nm_template', 'id_template', '', $selected_data, '',false);
            $cbo_file_type=create_chosen_db_combo('file_type','reff_file_type', 'id_file_type', 'file_type', 'id_file_type', '', $selected_data, '',false);
            $cbo_kecamatan=create_chosen_db_combo('kecamatan','reff_kecamatan', 'id_kecamatan', 'nm_kecamatan', 'id_kecamatan', '', $selected_data_kec, '',false);

            $idmenu = $this->input->post('idmenu');
            $lbl_menu = $this->input->post('label');
            $breadcrumb = array(ucfirst($this->uri->segment(2)),ucfirst($this->input->get('menu'))); 
            $data=array('posts'=>$data_src,
                        'title' =>$lbl_menu,
                        'bc' => $breadcrumb,
                        'cbo_article_type' => $cbo_article_type,
                        'cbo_file_type' => $cbo_file_type,
                        'cbo_kecamatan' => $cbo_kecamatan,
                        'webcontent' => 'article',
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

        $rowcount= count($this->Article_model->getRows($conditions));
        $paging_url = base_url().'admpage/article/ajaxPaginationData';	

	 	$data['posts'] = $this->ajaxPaginationDatax($conditions, $rowcount,'searchFilter',$paging_url );
	 	$this->load->view('admpage/article_data', $data, false);
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
            
            $model_name = 'Article_model';
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

    public function insert_article(){
        $config['upload_path']          = './img/';
        $config['allowed_types']        = '*';
        $config['max_size']             = 5000;
        $config['overwrite']            = true; 

        $this->load->library('upload', $config);        
        if ( ! $this->upload->do_upload('the_file')){
            $error = $this->upload->display_errors();
            $arr_response = array(
                    'error'=> 'true',
                    'msg'=>$error,
                );        
            echo json_encode($arr_response);
        }else{
                $upload_data = $this->upload->data();
                $now = DateTime::createFromFormat('U.u', microtime(true));
                $fname = $now->format("mdYHisu");
                $fname = $fname.$upload_data['file_ext'];
                rename($upload_data['full_path'],$upload_data['file_path'].$fname);                
                if(preg_match('/^.*\.(mp4|mov|mpg|mpeg|wmv|mkv)$/i', $fname)){
                    $file_type_id="2";
                }else{
                    $file_type_id="1";
                }

                $dtarray = array(       
                    'title'=>$this->input->post('title'),
                    'short_description'=>$this->input->post('short_desc'),
                    'article_content'=>$this->input->post('article_content'),
                    'id_article_type' => $this->input->post('article_type'),
                    'id_file_type' => $this->input->post('file_type'),
                    'id_kecamatan' => $this->input->post('kecamatan'),
                    'video_url' => $this->input->post('url'),
                    'file_name'=>$fname,
                    'create_date'=>getsysdate(),
                    'create_by'=>$this->session->userdata('user_id'),
                ); 
            $insert_dt = $this->Article_model->insertdata_article($dtarray);
            echo json_encode($insert_dt);
        }   
    }

    function editdata(){
        if($this->session->userdata('user_id')){    
            $id = $this->input->post('the_id');
            $init_data=$this->Article_model->get_dataforinit($id);
            $selected_data = $init_data->id_article_type;
            $selected_file_type = $init_data->id_file_type;
            $selected_data_kec = $init_data->id_kecamatan;

            $cbo_article_type=create_chosen_db_combo('article_type_edit','reff_template', 'id_template', 'nm_template', 'id_template', '', $selected_data, '',false);
            $cbo_file_type=create_chosen_db_combo('file_type_edit','reff_file_type', 'id_file_type', 'file_type', 'id_file_type', '', $selected_file_type, '',false);
            $cbo_kecamatan=create_chosen_db_combo('kecamatan_edit','reff_kecamatan', 'id_kecamatan', 'nm_kecamatan', 'id_kecamatan', '', $selected_data_kec, '',false);
            $data=array(
                        'dt_init'=>$init_data,
                        'cbo_article_type'=>$cbo_article_type,
                        'cbo_file_type'=>$cbo_file_type,
                        'cbo_kecamatan'=>$cbo_kecamatan,
                    );
            $this->load->view('article_edit', $data, false);
         }else{
            $this->load->view('auth/login');     
        }   
    }

    public function update_article(){
        $id = $this->input->post('id_edit');
        $config['upload_path']          = './img/';
        $config['allowed_types']        = 'gif|jpg|png|mp4|mov|mpg|mpeg|wmv|mkv';
        $config['max_size']             = 1000;
        $config['overwrite']            = true; 
        $this->load->library('upload', $config);        
        if (!$this->upload->do_upload('the_file_edit')){
            $error = $this->upload->display_errors();
            $dtarray = array(       
                'title'=>$this->input->post('title_edit'),
                'short_description'=>$this->input->post('short_desc_edit'),
                'article_content'=>$this->input->post('article_content_edit'),
                'id_file_type' => $this->input->post('file_type_edit'),
                'id_article_type' => $this->input->post('article_type_edit'),
                'id_kecamatan' => $this->input->post('kecamatan_edit'),
                'video_url' => $this->input->post('url_edit'),
                'update_date'=>getsysdate(),
                'update_by'=>$this->session->userdata('user_id'),
            ); 
            $arr_response = array(
                'error'=> 'true',
                'msg'=>$error,
            );        
            $update_dt = $this->Article_model->updatedata_article($dtarray, $id, false);
            echo json_encode($update_dt);

        }else{
                $upload_data = $this->upload->data();
                $now = DateTime::createFromFormat('U.u', microtime(true));
                $fname = $now->format("mdYHisu");
                $fname = $fname.$upload_data['file_ext'];
                rename($upload_data['full_path'],$upload_data['file_path'].$fname);                
                $dtarray = array(       
                    'title'=>$this->input->post('title_edit'),
                    'short_description'=>$this->input->post('short_desc_edit'),
                    'article_content'=>$this->input->post('article_content_edit'),
                    'id_article_type' => $this->input->post('article_type_edit'),
                    'id_file_type' => $this->input->post('file_type_edit'),
                    'file_name'=>$fname,
                    'video_url' => $this->input->post('url_edit'),
                    'update_date'=>getsysdate(),
                    'update_by'=>$this->session->userdata('user_id'),
                ); 
                $update_dt = $this->Article_model->updatedata_article($dtarray, $id);
                echo json_encode($update_dt);
        }   
    }

    function row_delete(){
        $arr_id = $this->input->post('id_content');
        echo $this->Article_model->row_delete($arr_id);
    }

}