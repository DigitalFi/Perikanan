<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
   function get_sys_setting($id){
	   $ret_val = '';
       //get main CodeIgniter object
       $ci =& get_instance();
       
       //load databse library
       $ci->load->database();
       
       //get data from database
	   $sql ="SELECT value_setting FROM sys_settings WHERE id_setting = '$id' AND status_setting = '1'";
       $query = $ci->db->query($sql);
	   $row=$query->row();
	   if($row){
		  $ret_val = $row->value_setting;	   
	   }
	   return $ret_val;
   }
   
   
   	function create_db_combo($tblname, $key_field, $value_field, $order_field, $additional_value){
	   //get main CodeIgniter object	
       $ci =& get_instance();
       //load databse library
       $ci->load->database();

	   $ci->db->from($tblname);
	   $ci->db->order_by($order_field);
	   $result = $ci->db->get();
		
		$dd[''] = $additional_value ;// 'Please Select';
		if ($result->num_rows() > 0){
			foreach ($result->result() as $row) {
				$dd[$row->$key_field] = $row->$value_field;
			}
		}
		return $dd;
	}


   	function create_chosen_db_combo($id_obj, $tblname, $key_field, $value_field, $order_field, $additional_value, $data_checked='', $selected_value=''){
     $ci =& get_instance();
     $ci->load->database();
	   $sql ="SELECT $key_field, $value_field FROM $tblname";
	   $query=$ci->db->query($sql);

		$dd='' ;// 'Please Select';
		$state ='';
		//if ($query->num_rows() > 0){
			$dd.= '<select data-placeholder="" id="'.$id_obj.'" name="'.$id_obj.'" single class="chosen-select" tabindex="8">';
			$dd.= '<option value="'.$additional_value.'"></option>';
			foreach ($query->result() as $row) {
			$flag ='';	
			//if (in_array($row->$key_field, $data_checked)) {
				//$flag ="disabled";
			//}
			//if($row->$key_field==$selected_value){
				//$state='Selected';
			//}				
				
				$dd.='<option '.$flag.'  value='.$row->$key_field.'>'.$row->$value_field.'</option>';
			}
			$dd.= '</select>';
		//}
		return $dd;
	}

    function get_section_info_by_name($section_name){
	   //get main CodeIgniter object	
       $ci =& get_instance();
       //load databse library
       $ci->load->database();
	   
	   $sql ="SELECT section_name, section_title, section_desc, image_section, image_folder FROM sys_page_section WHERE section_id = '$section_name' ";
	   $query=$ci->db->query($sql);
	   $row=$query->row();
	   return $row;
	}
	

    function get_section_id_by_content_id($content_id){
	   //get main CodeIgniter object	
       $ci =& get_instance();
       //load databse library
       $ci->load->database();
	   
	   $sql ="SELECT fe_section_name FROM sys_fe_content WHERE fe_content_id = '$content_id' ";

	  // echo $sql;
	   $query=$ci->db->query($sql);
	   $row=$query->row();
	   if($row){
	    $section_name =	$row->fe_section_name;
	   }
	   return $section_name;
	}

function get_logo(){
   //get main CodeIgniter object	
   $ci =& get_instance();
   //load databse library
   $ci->load->database();
      $sql ="SELECT fe_img_files FROM sys_fe_content WHERE LOWER(fe_content_title) = 'logo' ";
   $query=$ci->db->query($sql);
   $row=$query->row();
   $img_logo ='';
   if($row){
  		$img_logo = $row->fe_img_files; 	
   }
   return $img_logo;
}

function get_img_info_by_id($id){
   //get main CodeIgniter object	
   $ci =& get_instance();
   //load databse library
   $ci->load->database();
   $sql ="SELECT fe_img_files FROM sys_fe_content WHERE LOWER(fe_content_title) = 'logo' ";
   $query=$ci->db->query($sql);
   $row=$query->row();	

}
	
	function get_data_as_array($field,$table){
       $ci =& get_instance();
       $ci->load->database();
		$query = $ci->db->query("SELECT ".$field." FROM " . $table );
		echo "SELECT ".$field." FROM " . $table ;
		$array = array();
		foreach ($query->result() as $row){
			  $array[]=$row->$field;
		}
		
		return $array;	
	}

	function get_last_sort_order($tblname, $field_order, $field_criteria, $field_criteria_value ){
       $ci =& get_instance();
       $ci->load->database();
		$sql="SELECT ".$field_order." FROM ".$tblname." WHERE ".$field_criteria." = '$field_criteria_value' ORDER BY ".$field_order." DESC limit 0, 1";
	    $query = $ci->db->query($sql);
		$row = $query->row();
		
	   $last_sort_order = 1; //default sort order start from 1
	   if($row){
		 $last_sort_order = $row->$field_order+1;		   
	   }
	   return $last_sort_order;
	}

function get_saved_file_name($id_content){
	   //get main CodeIgniter object	
       $ci =& get_instance();
       //load databse library
       $ci->load->database();
	   $full_fname='';
	   $sql ="SELECT fe_img_files, fe_section_name FROM sys_fe_content WHERE fe_content_id = '$id_content' ";
	   $query=$ci->db->query($sql);
	   $row=$query->row();
	   $fname = '';
	   if($row){
	   		$folder = strtolower(get_foldername_by_section_id($row->fe_section_name));
	   		$fname = $row->fe_img_files;
	   		$full_fname = $folder."/".$fname;

	   }

	   return $full_fname;
	}

  function get_saved_file_name_direct($id_content){
     //get main CodeIgniter object  
       $ci =& get_instance();
       //load databse library
       $ci->load->database();
     $full_fname='';
     $sql ="SELECT fe_img_files, fe_section_name FROM sys_fe_content WHERE fe_content_id = '$id_content' ";
     $query=$ci->db->query($sql);
     $row=$query->row();
     $fname = '';
     if($row){
        $folder = strtolower(get_foldername_by_section_id($row->fe_section_name));
        $fname = $row->fe_img_files;
        $full_fname = $fname;

     }

     return $full_fname;
  }

function indonesian_date ($timestamp = '', $date_format = 'l, j F Y | H:i', $suffix = 'WIB') {
  date_default_timezone_set("Asia/Bangkok");
    if (trim ($timestamp) == '')
    {
            $timestamp = time ();
    }
    elseif (!ctype_digit ($timestamp))
    {
        $timestamp = strtotime ($timestamp);
    }
    # remove S (st,nd,rd,th) there are no such things in indonesia :p
    $date_format = preg_replace ("/S/", "", $date_format);
    $pattern = array (
        '/Mon[^day]/','/Tue[^sday]/','/Wed[^nesday]/','/Thu[^rsday]/',
        '/Fri[^day]/','/Sat[^urday]/','/Sun[^day]/','/Monday/','/Tuesday/',
        '/Wednesday/','/Thursday/','/Friday/','/Saturday/','/Sunday/',
        '/Jan[^uary]/','/Feb[^ruary]/','/Mar[^ch]/','/Apr[^il]/','/May/',
        '/Jun[^e]/','/Jul[^y]/','/Aug[^ust]/','/Sep[^tember]/','/Oct[^ober]/',
        '/Nov[^ember]/','/Dec[^ember]/','/January/','/February/','/March/',
        '/April/','/June/','/July/','/August/','/September/','/October/',
        '/November/','/December/',
    );
    $replace = array ( 'Sen','Sel','Rab','Kam','Jum','Sab','Min',
        'Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu',
        'Jan','Feb','Mar','Apr','Mei','Jun','Jul','Ags','Sep','Okt','Nov','Des',
        'Januari','Februari','Maret','April','Juni','Juli','Agustus','Sepember',
        'Oktober','November','Desember',
    );
    $date = date ($date_format, $timestamp);
    $date = preg_replace ($pattern, $replace, $date);
    $date = "{$date} {$suffix}";
    return $date;
} 	

function get_foldername_by_section_id($section_id){
   //get main CodeIgniter object	
   $ci =& get_instance();
   //load databse library
   $ci->load->database();
   
   $sql ="SELECT image_folder FROM sys_page_section WHERE section_id = '$section_id' ";
  // echo $sql;
   $query=$ci->db->query($sql);
   $row=$query->row();
   $img_folder ='';
   if($row){
  		$img_folder = $row->image_folder; 	
   }
   return $img_folder;
}


function get_section_titel_by_id($section_id){
   //get main CodeIgniter object  
   $ci =& get_instance();
   //load databse library
   $ci->load->database();
   
   $sql ="SELECT section_title FROM sys_page_section WHERE section_id = '$section_id' ";
  // echo $sql;
   $query=$ci->db->query($sql);
   $row=$query->row();
   $img_folder ='';
   if($row){
      $img_folder = $row->section_title;   
   }
   return $img_folder;
}

function strip_tags_content($text) {
      $full_content = html_entity_decode($text);
      $str_content = preg_replace('/[^a-zA-Z0-9\s]/', '', strip_tags(html_entity_decode($full_content)));
      return  $str_content;
 }


function download_file($file){
  if(!$file){ // file does not exist
      die('file not found');
  } else {
      header("Cache-Control: public");
      header("Content-Description: File Transfer");
      header("Content-Disposition: attachment; filename=$file");
      header("Content-Type: application/zip");
      header("Content-Transfer-Encoding: binary");

      // read the file from disk
      readfile($file);
  }
}


function get_section_in_array($data){
  $arr_sec_id=explode('|', $data);
  $arr_section = array();
  foreach($arr_sec_id as $dt){
    if($dt!=''){
      if($dt=='A'){
        $arr_section[]='<span class="label label-primary">Article</span>';
      }
      $arr_section[] ='<span class="label label-primary">'. get_section_titel_by_id($dt).'</span>';
    }  
  }

  $filteredarray = array_values( array_filter($arr_section) );
  $dt_section = join(' ',$filteredarray);
  return $dt_section;

}

function get_section_script($sid){
   $ci =& get_instance();
   $ci->load->database();
   
   $sql ="SELECT section_script FROM sys_page_section WHERE section_id = '$sid' ";
   $query=$ci->db->query($sql);
   $row=$query->row();
   $section_script ='';
   if($row){
      $section_script = $row->section_script;   
   }
   return $section_script;

}

function format_date_as_db_format($strdate, $oriformat='d/m/Y', $db_ormat='Y-m-d'){
  $date = DateTime::createFromFormat('d/m/Y', $strdate);
  return $date->format('Y-m-d');
}

function generate_footer($section_name='16'){//footer
   $ci =& get_instance();
   $ci->load->database();
    $footer='';
    $sql ="SELECT fe_content_title, fe_content_short_desc, fe_sosmed FROM sys_fe_content 
    WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order";

    $query=$ci->db->query($sql);
    $row=$query->row();
    if(isset($row)){
      $footer.='<!--/#footer-->
      <footer id="footer" class="footer navbar-fixed-bottom" >
        <div class="container" >
          <div class="row">
            <div class="col-sm-6">
              &copy; '.$row->fe_content_title.'</a>
            </div>
            <div class="col-sm-6">';
              $footer.='<ul class="social-icons">';
              $arr_socmed = explode(";",$row->fe_sosmed);
              foreach($arr_socmed as $dtsocmed){
                $arr_item_socmed = explode("|",$dtsocmed);
                $footer.='<li><a style"border:1px solid white" href="'.$arr_item_socmed[1].'"><i class="fa fa-'.$arr_item_socmed[0].'"></i></a></li>&nbsp;';
              }
              $footer.='</ul>
            </div>
          </div>
        </div>
      </footer><!--/#footer-->
    ';
    }
    return $footer;
  }