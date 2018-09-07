<?php 
if(!defined('BASEPATH')) exit('No direct script access allowed');


require APPPATH . '/libraries/Class.upload.php';
require APPPATH . '/libraries/Cryptlib.php';

class Users extends CI_Controller{
	private $error;
    private $success;
    public $menu = "Home";

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
      $this->load->library('Ajax_pagination');
      $this->load->model('Users_model');
      $this->perPage = get_sys_setting("004");
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
			$data=load_template('mainpage');	
			$this->load->view('user_main',$data);
		}else{
			$this->load->view('login');
		}
	}

	function list_data(){
        if($this->session->userdata('user_id')){
            $data = array(
                'menu'=> $this->menu,
                'title'=> "User Management",
            );
            
            //total rows count
            $totalRec = count($this->Users_model->getRows());
            $idmenu = $this->input->post('idmenu');
           //pagination configuration
            $config['target']      = '#postList';
            $config['base_url']    = base_url().'users/ajaxPaginationData';
            $config['total_rows']  = $totalRec;
            $config['per_page']    = $this->perPage;
            $config['link_func']   = 'searchFilter';
            $this->ajax_pagination->initialize($config);
            //get the posts data
            $data_src = $this->Users_model->getRows(array('limit'=>$this->perPage));
            $selected_data = '';
            $dt_cbo_role = create_chosen_db_combo('roles','sys_roles', 'roles_id', 'roles_name', 'roles_id', '', $selected_data, '',false);  
            $dt_cbo_kec = create_chosen_db_combo('kecamatan', 'ref_kecamatan', ' substr(kode,7,2) ', 'nama', 'nama','', $selected_data, " WHERE kode_kabupaten = '32.76'", false); 
            $dt_cbo_kel = create_chosen_db_combo('kelurahan','ref_kelurahan', ' substr(kode,12,2) ', 'nama', 'nama', '', $selected_data, " WHERE substr(kode,1,5)='32.76'", false);  

            $idmenu = $this->input->post('idmenu');
            $lbl_menu = $this->input->post('label');
            $breadcrumb = get_breadcrumb_info($idmenu); 
                        $data=array(
                        'title' => $lbl_menu,
                        'bc' => $breadcrumb,
                        'posts'=>$data_src,
                        'isi' => 'users',
                        'root'=> $this->menu,
                        'dt_cbo_role'=>$dt_cbo_role,
                        'dt_cbo_kec'=>$dt_cbo_kec,
                        'dt_cbo_kel'=>$dt_cbo_kel
                    );
            $this->load->view('layout/wrapper_content',$data);
        }else{
            $this->load->view('auth/login');
        }    
	}

function ajaxPaginationData(){
	 if($this->session->userdata('user_id')){
 		$conditions = array();
        //set conditions for search
        $keywords = $this->input->post('keywords');

        if(!empty($keywords)){
            $conditions['search']['keywords'] = $keywords;
        }
        
        $rowcount= count($this->Users_model->getRows($conditions));
        $paging_url = base_url().'users/ajaxPaginationData';	

	 	$data['posts'] = $this->ajaxPaginationDatax($conditions, $rowcount,'searchFilter',$paging_url );
	 	$this->load->view('users_data', $data, false);
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
        
        $model_name = 'Users_model';
        $funct_model_name = 'getRows';
       
       
        //pagination configuration
        $config['target']      = '#postList';
        $config['base_url']    = $paging_url; //base_url().'wbadmin/article_manag/ajaxPaginationData';
        $config['total_rows']  = $rowcount;
        $config['per_page']    = $this->perPage;
        $config['link_func']   = $func_name_from_view ;//'searchFilter';
        $config['uri_segment'] = 3;
        $this->ajax_pagination->initialize($config);
        
        //set start and limit
        $conditions['start'] = $offset;
        $conditions['limit'] = $this->perPage;

        return $this->$model_name->$funct_model_name($conditions);
     }else{
        $this->load->view('auth/login'); 
     }
   }

	function savedata(){
		if($this->session->userdata('user_id')){
            $converter = new Encryption;
            $id_opd = $this->input->post('opd');
            $user_id = $this->session->userdata('user_id');
            $user_name = $this->input->post('user_name');
            $email = $this->input->post('email');
            $kd_kel = $this->input->post('kelurahan');
            $kd_kec = $this->input->post('kecamatan');

            $data_dtl= array();
			$msg_save='';
            $data_exist = is_data_exist('sys_users', 'user_name', "user_name ='$user_name' OR email ='$email'  ");
			if(!$data_exist){
				$dtarray = array(    
                    'user_name'=>$this->input->post('user_name'),
                    'pwd'=>$converter->encode($this->input->post('Password')),
                    'email'=>$this->input->post('email'),
                    'full_name'=>$this->input->post('full_name'),
                    'id_kecamatan'=>$this->input->post('kecamatan'),
                    'id_kelurahan'=>$this->input->post('kelurahan'),
                    'roles_id'=>$this->input->post('roles'),
                    'create_date'=>getSysDate(),
                    'create_by' =>$user_id 
	            );
				$msg = $this->Users_model->insertdata($dtarray);
                echo $msg;
			}else{
                echo "This user name or Email already exist, please use another one";
            } 
        }else{
            $this->load->view('auth/login'); 
        }
	}

    function editdata(){
        if($this->session->userdata('user_id')){    
           $id = $this->input->post('the_id');
           $datahdr = $this->Users_model->getdatauser_hdr($id);
           $row = $this->Users_model->getdatauser_hdr_for_init($id);
           $dt_cbo_role = create_chosen_db_combo('roles_edit','sys_roles', 'roles_id', 'roles_name', 'roles_id', '', $row->roles_id, '',false);  
           $dt_cbo_kec =  create_chosen_db_combo('kecamatan_edit', 'ref_kecamatan', ' substr(kode,7,2) kode ', 'nama','nama', '', $row->id_kecamatan, " WHERE kode_kabupaten = '32.76'", false); 
           $dt_cbo_kel =  create_chosen_db_combo('kelurahan_edit','ref_kelurahan', 'substr(kode,12,2) kode', 'nama', 'nama', '', $row->id_kelurahan, " WHERE substr(kode,1,5)='32.76' AND substr(kode_kecamatan,7,2)='".$row->id_kecamatan."'", false);  

           $data=array( 'dt_cbo_role'=>$dt_cbo_role,
                        'dt_cbo_kec'=>$dt_cbo_kec,
                        'dt_cbo_kel'=>$dt_cbo_kel,
                        'hdr'=>$datahdr
                    );
            $this->load->view('users_edit',$data);
        }else{
            $this->load->view('auth/login');     
        }   
    }

function updatedata(){
        if($this->session->userdata('user_id')){
            $converter = new Encryption;
            $update_by = $this->session->userdata('user_id');
            $user_name = $this->input->post('user_name_edit');
            $email = $this->input->post('email_edit');
            $id = $this->input->post('user_id_edit'); 

            $data_dtl= array();
            $msg_save='';
            $data_exist = false; // force data_exit to false for edit mode becaue user name & email unchangeable
            if(!$data_exist){
                $dtarray = array(    
                    'pwd'=>$converter->encode($this->input->post('Password_edit')),
                    'full_name'=>$this->input->post('full_name_edit'),
                    'roles_id'=>$this->input->post('roles_edit'),
                    'id_kecamatan'=>$this->input->post('kecamatan_edit'),
                    'id_kelurahan'=>$this->input->post('kelurahan_edit'),
                    'update_date'=>getSysDate(),
                    'update_by' =>$update_by 
                );

                $msg = $this->Users_model->updatedata($dtarray, $id);
                echo $msg;
            }else{
                echo "This user name or Email already exist, please use another one";
            } 
        }else{
            $this->load->view('auth/login'); 
        }
    }

	function row_delete(){
		$arr_id = $this->input->post('id_content');
		echo $this->Users_model->deletedata($arr_id);
	}


}
?>