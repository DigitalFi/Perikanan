<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Article_model extends CI_Model{
	
	function __construct(){
	 // Call the Model constructor
		parent::__construct();
	}	

    function getRows($params = array()){
        $this->db->select("id_article,  title, short_description, u.full_name as user_name, upd.full_name update_by, article_content, ft.file_type, rt.nm_template, published, publish_date, publish_by, category_id, DATE_FORMAT(a.create_date, '%d/%m/%Y %H:%i:%s') as create_date, a.create_by, DATE_FORMAT(a.update_date, '%d/%m/%Y %H:%i:%s') as update_date");
        $this->db->from('tbl_article a');
        $this->db->join("sys_users u","on u.user_id=a.create_by","inner");
        $this->db->join("sys_users upd","on upd.user_id=a.update_by","left");
        $this->db->join("reff_file_type ft","on ft.id_file_type=a.id_file_type","inner");
        $this->db->join("reff_template rt","on rt.id_template=a.id_article_type","inner");
 
        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(title  LIKE '%".$params['search']['keywords']."%')";
            $this->db->where($likeCriteria);
        }

        //sort data by ascending or desceding order
		 $this->db->order_by('create_date DESC');


        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
         $query = $this->db->get();
         return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function insertdata_article($dt){
        $sql = $this->db->insert_string('tbl_article', $dt);
        if (!$this->db->simple_query($sql))
        {
                $error = $this->db->error(); 
                $msg_error =$error['message'];
                $arr_response = array(
                    'error'=> 'true',
                    'msg'=>$msg_error,
                );
        }else{
                $arr_response = array(
                    'error'=> 'false',
                    'msg'=>'Succes insert data',
                );
        }
        return $arr_response ;
    }

    function updatedata_article($dt, $id, $update_img=true){
        $fname = $this->getfilename($id);
        $img_path = "img/".$fname;
        $where = "id_article='$id'";
        $sql = $this->db->update_string('tbl_article', $dt, $where);
        if (!$this->db->simple_query($sql))
        {
            $error = $this->db->error(); 
            $msg_error =$error['message'];
            $arr_response = array(
                'error'=> 'true',
                'msg'=>$msg_error,
            );
        }else{
            if($update_img==true){
                if (file_exists($img_path)){
                    unlink($img_path);
                } 
            }           
            $arr_response = array(
                'error'=> 'false',
                'msg'=>'Update data success',
            );
        }
        return $arr_response ;
    }

    function get_dataforinit($id){
        $this->db->select('id_article,  title, short_description, article_content, id_article_type, id_file_type, id_kecamatan, video_url, file_name');
        $this->db->from('tbl_article');
        $this->db->where("id_article='$id'");
        $query = $this->db->get();
        return ($query->num_rows() > 0)?$query->row():FALSE;
    }

    function row_delete($arr_id){//prepare for image del
        $msg ='';
        foreach($arr_id as $id){    
            $fname = $this->getfilename($id);
            $img_path = "img/".$fname;
            $this->db->where('id_article', $id);
            $this->db->delete('tbl_article');
            if (file_exists($img_path)){
               unlink($img_path);
            }
        } 
        $msg='Records(s) deleted succesfully';
        return $msg;
    }

    function getfilename($id){
        $this->db->select("file_name");
        $this->db->from("tbl_article");
        $this->db->where("id_article='$id'");
        $query = $this->db->get();
        $rowdata = ($query->num_rows() > 0)?$query->row():FALSE;
        $fname = $rowdata->file_name;

        return $fname;
    }
  
}
?>