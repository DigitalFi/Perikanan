<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Article_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	

    function getRows($params = array()){
	 $this->db->select('fe_content_id, fe_content_title, fe_section_name, sys_page_section.section_name, fe_content_short_desc, fe_full_content, fe_img_files, status_active');
	 $this->db->from('sys_fe_content');
        $this->db->join('sys_page_section', 'sys_page_section.section_id = sys_fe_content.fe_section_name', 'left');
        //filter data by searched keywords
        $opd_section_id = get_sys_setting('007');
        $default_criteria = "fe_section_name <> '$opd_section_id'";

        if(!empty($params['search']['keywords'])){
            $likeCriteria = "(fe_content_title  LIKE '%".$params['search']['keywords']."%' OR  fe_section_name  LIKE '%".$params['search']['keywords']."%' OR  fe_content_short_desc  LIKE '%".$params['search']['keywords']."%' OR    sys_page_section.section_name  LIKE '%".$params['search']['keywords']."%') and fe_section_name <> '$opd_section_id'";
            $this->db->where($likeCriteria);
        }else{
        	$this->db->where($default_criteria);
        }
        //sort data by ascending or desceding order
		 $this->db->order_by('fe_content_id DESC');

        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
            $this->db->limit($params['limit']);
        }
        //get records



        $query = $this->db->get();

        //  echo $this->db->last_query();
        //return fetched data
        return ($query->num_rows() > 0)?$query->result_array():FALSE;
    }

    function save_data_article($dt_article){
    	$this->db->insert('sys_fe_content', $dt_article);
    	$this->db->last_query();
    }

    function update_data_article($dt_article, $id){
    	$this->db->where('fe_content_id',$id);
		$this->db->update('sys_fe_content',$dt_article);
		//echo $this->db->last_query();
    }

    function get_article_by_id($article_id){
        $sql = "SELECT fe_content_id, fe_content_title, fe_section_name, sys_page_section.section_name, fe_content_short_desc, fe_full_content, fe_content_btn_label, fe_img_files, status_active FROM sys_fe_content
        	INNER JOIN  sys_page_section ON sys_page_section.section_id = sys_fe_content.fe_section_name
                WHERE sys_fe_content.fe_content_id = '$article_id'";
               // echo $sql;
        $query = $this->db->query($sql);
        $dt_array = $query->result() ;
        echo json_encode($dt_array);            
    } 

	function row_delete($dt){
		$msg =''; $fname=''; $full_fname='';
		$img_root_folder = 'assets/images/upload/';
		foreach($dt as $id){	

	   		$fname = get_saved_file_name_direct($id);
	   		$full_fname = $img_root_folder.$fname; 
			if(file_exists($full_fname) && $fname !=''){
				unlink($full_fname);
		   		$this->db->where('fe_content_id', $id);
		   		$this->db->delete('sys_fe_content');
				$msg='Records(s) deleted succesfully';
			}else{
		   		$this->db->where('fe_content_id', $id);
		   		$this->db->delete('sys_fe_content');
				$msg='Records(s) deleted with no image to delete or image does not exist';
			}
	   	} 
	   	return $msg;
	}

function load_article($offset = 0, $search_value=''){
	 $this->load->library('pagination');
	
	// Config setup
	 $this->db->select('fe_content_id, fe_content_title, fe_section_name, fe_content_short_desc, fe_full_content, fe_img_files, status_active');
	 $this->db->order_by('fe_content_id DESC');
	 $this->db->like('fe_content_title', $search_value);
	 $this->db->from('sys_fe_content');
	 $num_rows= $this->db->count_all_results();//$this->db->count_all("sys_fe_content");
	 $config['base_url'] = base_url().'wbadmin/article_manag/load_article';
	 $config['total_rows'] = $num_rows;
	 $config['per_page'] = get_sys_setting('004');
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
	
	//$this->db->select('fe_content_id, fe_content_title, fe_content_short_desc, fe_full_content, fe_img_files, status_active');
 	//$this->db->like('fe_content_title', $search_value);
	//$records= $this->db->get('sys_fe_contentx', $offset,$config['per_page']);// take record of the table
	$sql = "SELECT fe_content_id, fe_section_name, fe_content_title, fe_content_short_desc, fe_full_content, fe_img_files, status_active 
	FROM sys_fe_content WHERE fe_content_title LIKE  '%$search_value%' ORDER BY fe_content_id DESC limit $offset,".$config['per_page'];
	$records = $this->db->query($sql);

	$tbl= '<table class="table table-striped table-condensed">';
	$tbl.= '<thead class="nav">
			<tr>
			  <th>#</th>
			  <th><input type="checkbox" OnChange="Populate()"  class="select-all"   /></th>
			  <th>Title</th>
			  <th>Short Description</th>
			  <th>Image File</th>
			  <th>Active Status</th>
			  <th>Section</th>
			  <th>Action</th>
			</tr>
		  </thead>
		  <tbody>';
	$rec_no =1;	  
	foreach($records->result() as $row){
		$short_desc =$row->fe_content_short_desc;
		if($row->fe_content_short_desc==''){
			$short_desc = substr($row->fe_full_content,0,150);
     		//$short_desc = $short_desc;
		}
		$three_dot='';
		if(strlen($row->fe_full_content)>=150){
			$three_dot = '...';	
		}
		$tbl.= '<tr>
			  <td scope="row">'.$rec_no.'</td>
			  <td scope="row"><input type="checkbox" class="chk-box"  Onclick="Populate()" name="id_content" value='.$row->fe_content_id.' /></td>
			  <td><a href="javascript:edit_article('.$row->fe_content_id.')">'.html_entity_decode($row->fe_content_title).'</a></td>
			  <td>'.$short_desc.$three_dot.'</td>
			  <td>'.$row->fe_img_files.'</td>
			  <td>'.$row->status_active.'</td>
			  <td>'.get_foldername_by_section_id($row->fe_section_name).'</td>
			  <td><a href="javascript:edit_article('.$row->fe_content_id.')">Edit</a></td>
			</tr>';
	$rec_no++;		
	}
	$tbl.= '</table>';
	$tbl.= $this->pagination->create_links();
	return $tbl;
 }	


	function jumlah_data($kriteria){
	 $this->db->like('fe_content_title', $kriteria);
	 $this->db->from('sys_fe_content');
	 $num_rows= $this->db->count_all_results();//$this->db->count_all("sys_fe_content");
	 return $num_rows;

	}

	function data_article($number,$offset,$kriteria){
	 $this->db->like('fe_content_title', $kriteria);
	 $this->db->order_by('fe_content_id DESC');
	 //echo $this->db->get_compiled_select();
	 return $query = $this->db->get('sys_fe_content',$number,$offset)->result();	

	}

 function insert_content_full($data){
		$fe_content_id=$data['fe_content_id'];
		$fe_img_files=$data['fe_img_files'];
		$fe_img_files2=$data['fe_img_files2'];
		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_content_short_desc2=$data['fe_content_short_desc2'];
		$fe_content_short_desc3=$data['fe_content_short_desc3'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_content_btn_url=$data['fe_content_btn_url'];
		$fe_link_clickable=$data['fe_link_clickable'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_category=$data['fe_content_category'];
		$fe_content_icon=$data['fe_content_icon'];
		$fe_sosmed=$data['fe_sosmed'];
		$status_active=$data['status_active'];
		$display_start_from=$data['display_start_from'];
		$display_until=$data['display_until'];
		$create_by=$this->session->userdata('full_name');

		$sql = "INSERT INTO sys_fe_content(fe_content_id' , 'fe_img_files' , 'fe_img_files2' , 'fe_content_title' , 'fe_content_short_desc' , 
		'fe_content_short_desc2' , 'fe_content_short_desc3' , 'fe_full_content' , 'fe_content_btn_label' , 'fe_content_btn_url' , 
		'fe_link_clickable' , 'fe_content_sort_order' , 'fe_section_name' , 'fe_content_category' , 'fe_content_icon' , 'fe_sosmed' , 
		'status_active' , 'display_start_from' , 'display_until' , 'create_date' , 'create_by' , 'update_date' , 'update_by')
		VALUES (
		'$fe_content_id',
		'$fe_img_files',
		'$fe_img_files2',
		'$fe_content_title',
		'$fe_content_short_desc',
		'$fe_content_short_desc2',
		'$fe_content_short_desc3',
		'$fe_full_content',
		'$fe_content_btn_label',
		'$fe_content_btn_url',
		'$fe_link_clickable',
		'$fe_content_sort_order',
		'$fe_section_name',
		'$fe_content_category',
		'$fe_content_icon',
		'$fe_sosmed',
		'$status_active',
		'$display_start_from',
		'$display_until',
		 NOW(),
		'$create_by')";

		echo $sql;
		//$this->db->query($sql);
 }


function update_content($data, $id){
		//$fe_img_files=$data['fe_img_files'];
		if(isset($data['fe_img_files'])){
			$fe_img_files=$data['fe_img_files'];
		}

		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$update_by=$this->session->userdata('full_name');

		//$this->db->trans_start();
		//$sql1 ="DELETE FROM sys_fe_content WHERE fe_content_id = '$id'";	
		//$this->db->query($sql1);

		if(isset($data['fe_img_files'])){
			$sql = "UPDATE sys_fe_content SET fe_img_files='$fe_img_files', fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";

		}else{
			$sql = "UPDATE sys_fe_content SET fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";

		}


		//return $sql;
		$this->db->query($sql);

		// $this->db->trans_complete();
		// if ($this->db->trans_status() === FALSE) {
		//     # Something went wrong.
		//     $this->db->trans_rollback();
		//     echo "Article ".$fe_content_title."Update Failed";
		// } 
		// else {
		//     # Everything is Perfect. 
		//     # Committing data to the database.
		//     $this->db->trans_commit();
		   
		// }		
		 echo "Article ".$fe_content_title." Update successfully";
 }

function insert_content($data){
		$fe_img_files=$data['fe_img_files'];
		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$create_by=$this->session->userdata('full_name');

		$sql = "INSERT INTO sys_fe_content(fe_img_files, fe_content_title, fe_content_short_desc, fe_full_content, fe_content_btn_label, fe_content_sort_order, fe_section_name,status_active, create_date, create_by)
		VALUES ('$fe_img_files', '$fe_content_title', '$fe_content_short_desc', '$fe_full_content', '$fe_content_btn_label', '$fe_content_sort_order', '$fe_section_name', 'Y', NOW(), '$create_by')";

		//return $sql;
		$this->db->query($sql);
		echo "Article ".$fe_content_title." saved successfully";
 }


function update_content_ori($data, $id, $with_img = true){
		$fe_content_title=$data['fe_content_title'];
		$fe_content_short_desc=$data['fe_content_short_desc'];
		$fe_full_content=$data['fe_full_content'];
		$fe_content_btn_label=$data['fe_content_btn_label'];
		$fe_section_name=$data['fe_section_name'];
		$fe_content_sort_order=$data['fe_content_sort_order'];
		$update_by=$this->session->userdata('full_name');

		if($with_img== true){
			$fe_img_files=$data['fe_img_files'];
			$sql = "UPDATE sys_fe_content SET fe_img_files='$fe_img_files', fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";
		}else{
			$sql = "UPDATE sys_fe_content SET fe_content_title='$fe_content_title', 
			fe_content_short_desc='$fe_content_short_desc', fe_full_content='$fe_full_content', fe_content_btn_label='$fe_content_btn_label',
			fe_content_sort_order='$fe_content_sort_order', fe_section_name='$fe_section_name', update_date=NOW(), update_by='$update_by'
			WHERE fe_content_id = '$id'";
		}

		$this->db->query($sql);
		echo "Article ".$fe_content_title."Updated successfully";
 }



	function update_img_selected_article($id) {
		$sql ="UPDATE sys_fe_content SET fe_img_files=null WHERE fe_content_id='$id' ";
		$query=$this->db->query($sql);
		if($query){
			return '<b>Image info on database successfully updated</b>';
		}else{
			return 'Delete failed';
		}
	}

function get_data_article($id){
	$sql ="SELECT fe_content_id, fe_section_name,	 fe_img_files, fe_content_title, fe_content_short_desc, 
	fe_full_content, fe_content_btn_label, fe_section_name FROM sys_fe_content WHERE fe_content_id = '$id' ";
	$query=$this->db->query($sql);
	$row=$query->row();

	return $row;
}

function delete_article($id){
	$sql ="DELETE FROM sys_fe_content WHERE fe_content_id = '$id' ";
	$query=$this->db->query($sql);
}

function get_data_detail_file($id){
	$sql ="SELECT img_gallery_id,	content_id,	files_name,	file_desc
		 FROM tbl_gallery_files WHERE content_id = '$id' ";
	$query=$this->db->query($sql);
	//$row=$query->row();

	return $query;
}

	
}
?>