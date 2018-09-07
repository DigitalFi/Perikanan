<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Page_model extends CI_Model{
	
	function __construct(){
	 // Call the Model constructor
		parent::__construct();
	}	

    function getRows($params = array()){
        $this->db->select("id_pages,  nm_page, DATE_FORMAT(a.create_date, '%d/%m/%Y %H:%i:%s') as create_date, u.user_name as create_by, upd.user_name as update_by, DATE_FORMAT(a.update_date, '%d/%m/%Y %H:%i:%s') as update_date");
        $this->db->from('tbl_pages a');
        $this->db->join("sys_users u","on u.user_id=a.create_by","inner");
        $this->db->join("sys_users upd","on upd.user_id=a.update_by","left");
 
        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(nm_page  LIKE '%".$params['search']['keywords']."%')";
            $this->db->where($likeCriteria);
        }

        //sort data by ascending or desceding order
		 $this->db->order_by('a.create_date DESC');

        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
         $query = $this->db->get();
         return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function get_master_template(){
        $this->db->select('id_template, nm_template');
        $this->db->from('reff_template');
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function insertdata_page($arr_dt_page,$arr_page_template_rows, $arr_page_template_single, $arr_template_article, $mainpage){
        $this->db->trans_begin();
        $sql = $this->db->insert_string('tbl_pages', $arr_dt_page);
        $insert_id = ''; $arr_response='';
        if (!$this->db->simple_query($sql))
        {
                $error = $this->db->error(); // Has keys 'code' and 'message'
                $this->db->trans_rollback();
                $msg_error =$error['message'];
                $arr_response = array(
                    'error'=> 'true',
                    'msg'=>'Error on insert pages: '. $msg_error,
                );
                return $arr_response;
        }else{
            /*If insert tbl_pages success, insert to table tbl_page_template*/
            $insert_id = $this->db->insert_id();
            /*if  $mainpage = Y (page is main page) insert templateid as multi record  */
            if($mainpage=='Y'){
                foreach($arr_page_template_rows as $idtemplate){
                    if($idtemplate!=''){
                        $sql ="INSERT INTO tbl_page_template (id_pages, id_template) values ('$insert_id', '$idtemplate')";
                        if (!$this->db->simple_query($sql)){
                            $error = $this->db->error(); 
                            $this->db->trans_rollback();
                            $msg_error =$error['message'];
                            $arr_response = array(
                                'error'=> 'true',
                                'msg'=>'Error on insert page template(multi rows): '. $msg_error,
                            );
                            return $arr_response;
                        }else{
                            $arr_response = array(
                                'error'=> 'false',
                                'msg'=>'Insert data success',
                            );
                        }
                    }    
                }
            }else{/*if $mainpage=N (Page is not main page/dtl page) insert template id as single row with pipe sign as sparator */
                $default_template = $arr_page_template_single['default_template'];
                $detail_of = $arr_page_template_single['detail_of'];
                $idtemplate = $arr_page_template_single['id_template'];
                $template_used=$arr_page_template_single['template_used'];
                $sql ="INSERT INTO tbl_page_template (id_pages, id_template, default_template, detail_of, template_used) values ('$insert_id', '$idtemplate', '$default_template', '$detail_of', '$template_used')";
                if (!$this->db->simple_query($sql)){
                    $error = $this->db->error(); 
                    $this->db->trans_rollback();
                    $msg_error =$error['message'];
                    $arr_response = array(
                        'error'=> 'true',
                        'msg'=>'Error on insert page template (single row)'.$msg_error.' '.$sql,
                    );
                    return $arr_response;
                }else{
                    $arr_response = array(
                        'error'=> 'false',
                        'msg'=>'Insert data success',
                    );
                }
            }    
            /*Insert data to table tbl_template_page_article*/
            foreach($arr_template_article as $dt){
                $idarticle='';
                $arr_ta = explode("|", $dt);
                $idtemplate = $arr_ta[0];
                if(isset($arr_ta[1])){
                    if(substr($arr_ta[1],0,1)==","){
                      $idarticle = substr($arr_ta[1],1);
                    }else{
                        $idarticle =$arr_ta[1];
                    }
                }
                
                $sql ="INSERT INTO tbl_template_page_article (id_pages, id_template,  id_article)VALUES('$insert_id','$idtemplate','$idarticle')";
                if (!$this->db->simple_query($sql)){
                    $error = $this->db->error(); 
                    $this->db->trans_rollback();
                    $msg_error =$error['message'];
                    $arr_response = array(
                        'error'=> 'true',
                        'msg'=>'Error on insert template page article (single row)'.$msg_error.' '.$sql,
                    );
                    return $arr_response;

                }else{
                    $arr_response = array(
                        'error'=> 'false',
                        'msg'=>'Insert data success',
                    );
                }
            }
        }
        /*commit all save process and send response message */
        $arr_response = array(
            'error'=> 'false',
            'msg'=>'Insert data success ',
        );
        $this->db->trans_commit();
        return $arr_response;
    
    }

    function updatedata_page($arr_dt_page,$arr_page_template_rows, $arr_page_template_single, $arr_template_article, $mainpage, $pageid){
        $this->db->trans_begin();
        //$sql = $this->db->insert_string('tbl_pages', $arr_dt_page);

        $where = "id_pages='$pageid'";
        $sql = $this->db->update_string('tbl_pages', $arr_dt_page, $where);
        if (!$this->db->simple_query($sql))
        {
            $error = $this->db->error(); 
            $this->db->trans_rollback();
            $msg_error =$error['message'];
            $arr_response = array(
                'error'=> 'true',
                'msg'=>$msg_error,
            );
            return $arr_response ;
        }else{
            $this->db->where('id_pages', $pageid);
            $this->db->delete('tbl_page_template');
            /*If insert tbl_pages success, insert to table tbl_page_template*/
           // $insert_id = $this->db->insert_id();
            /*if  $mainpage = Y (page is main page) insert templateid as multi record  */
            if($mainpage=='Y'){
                foreach($arr_page_template_rows as $idtemplate){
                    if($idtemplate!=''){
                        $sql ="INSERT INTO tbl_page_template (id_pages, id_template) values ('$pageid', '$idtemplate')";
                        if (!$this->db->simple_query($sql)){
                            $error = $this->db->error(); 
                            $this->db->trans_rollback();
                            $msg_error =$error['message'];
                            $arr_response = array(
                                'error'=> 'true',
                                'msg'=>'Error on insert page template(multi rows): '. $msg_error,
                            );
                            return $arr_response;
                        }else{
                            $arr_response = array(
                                'error'=> 'false',
                                'msg'=>'Insert data success',
                            );
                        }
                    }    
                }
            }else{/*if $mainpage=N (Page is not main page/dtl page) insert template id as single row with pipe sign as sparator */
                $default_template = $arr_page_template_single['default_template'];
                $detail_of = $arr_page_template_single['detail_of'];
                $idtemplate = $arr_page_template_single['id_template'];
                $template_used=$arr_page_template_single['template_used'];

                $this->db->where('id_pages', $pageid);
                $this->db->delete('tbl_page_template');

                $sql ="INSERT INTO tbl_page_template (id_pages, id_template, default_template, detail_of, template_used) values ('$pageid', '$idtemplate', '$default_template', '$detail_of', '$template_used')";
                if (!$this->db->simple_query($sql)){
                    $error = $this->db->error(); 
                    $this->db->trans_rollback();
                    $msg_error =$error['message'];
                    $arr_response = array(
                        'error'=> 'true',
                        'msg'=>'Error on insert page template (single row)'.$msg_error.' '.$sql,
                    );
                    return $arr_response;
                }else{
                    $arr_response = array(
                        'error'=> 'false',
                        'msg'=>'Insert data success',
                    );
                }
            }    
            /*Insert data to table tbl_template_page_article*/
            $this->db->where('id_pages', $pageid);
            $this->db->delete('tbl_template_page_article');
            foreach($arr_template_article as $dt){
                $idarticle='';
                $arr_ta = explode("|", $dt);
                $idtemplate = $arr_ta[0];
                if(isset($arr_ta[1])){
                    if(substr($arr_ta[1],0,1)==","){
                      $idarticle = substr($arr_ta[1],1);
                    }else{
                        $idarticle =$arr_ta[1];
                    }
                }
                
                $sql ="INSERT INTO tbl_template_page_article (id_pages, id_template,  id_article)VALUES('$pageid','$idtemplate','$idarticle')";
                if (!$this->db->simple_query($sql)){
                    $error = $this->db->error(); 
                    $this->db->trans_rollback();
                    $msg_error =$error['message'];
                    $arr_response = array(
                        'error'=> 'true',
                        'msg'=>'Error on insert template page article (single row)'.$msg_error,
                    );
                    return $arr_response;

                }else{
                    $arr_response = array(
                        'error'=> 'false',
                        'msg'=>'Insert data success',
                    );
                }
            }
        }
        /*commit all save process and send response message */
        $arr_response = array(
            'error'=> 'false',
            'msg'=>'Insert data success ',
        );
        $this->db->trans_commit();
        return $arr_response;
    
    }

    function get_page_dataforinit($id_pages){
        $this->db->select('tp.id_pages, tp.nm_page, tp.main_page, tpt.detail_of');
        $this->db->from('tbl_pages AS tp');
        $this->db->join('tbl_page_template AS tpt','ON tp.id_pages = tpt.id_pages','inner');
        $this->db->where("tp.id_pages='$id_pages'");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;
    }

    function getdtarticle_for_init($id_pages, $id_article){
        $this->db->select('id_article');
        $id_menu =array(); 
        $this->db->from('tbl_article');
        $this->db->where("id_pages='$id'");
        $this->db->where("id_article='$id_article'");
        $query = $this->db->get();
        foreach ($query->result() as $row){
            $id_menu[]= $row->id_menu;
        }
        return $id_menu;
    }

    function get_availabe_template($id_pages){
        $this->db->select('id_template, nm_template');
        $this->db->from('reff_template');
        $this->db->where("id_template NOT IN(SELECT id_template FROM tbl_template_page_article WHERE id_pages   = '$id_pages')");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function get_selected_template($id_pages){
        $this->db->select('tpa.id_template, id_article, rt.nm_template');
        $this->db->from('tbl_template_page_article tpa');
        $this->db->join('reff_template rt','ON rt.id_template=tpa.id_template','inner');
        $this->db->where("tpa.id_pages = '$id_pages'");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function get_template_used($id_pages){
        $this->db->select('rt.id_template, rt.nm_template, p.id_pages, pt.template_used');
        $this->db->from('reff_template AS rt');
        $this->db->join('tbl_page_template AS pt','ON rt.id_template = pt.template_used','inner');
        $this->db->join('tbl_pages AS p','ON p.id_pages = pt.id_pages','inner');
        $this->db->where("p.id_pages = '$id_pages'");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;
    }

    /*function row_delete($arr_id){//prepare for image del
        $msg ='';
        foreach($arr_id as $id){    
            $tables = array('tbl_pages', 'tbl_page_template', 'tbl_template_page_article');
            $this->db->where('id_pages', $id);
            $this->db->delete($tables);
        } 
        $msg='Records(s) deleted succesfully';
        return $msg;
    }*/

    function row_delete($arr_id){//prepare for image del
        $msg ='';
        foreach($arr_id as $id){    
            $this->db->where('id_pages', $id);
            $this->db->delete('tbl_pages');

            $this->db->where('id_pages', $id);
            $this->db->delete('tbl_page_template');

            $this->db->where('id_pages', $id);
            $this->db->delete('tbl_template_page_article');

        } 
        $msg='Records(s) deleted succesfully';
        return $msg;
    }

    function getTemplateExistingSetting($templateID){
        $this->db->select("id_template, id_article");
        $this->db->from("tbl_template_page_article");
        $this->db->where("id_template='$templateID'");
        $this->db->order_by("id_pages_template", "asc");
        $this->db->limit(1);
        $query = $this->db->get();
        $row=$query->row();
        if($row){
            $existingconfig = $row->id_template."|".$row->id_article;
        }else{
            $existingconfig = '';
        }
        return $existingconfig; 
    }
}
?>