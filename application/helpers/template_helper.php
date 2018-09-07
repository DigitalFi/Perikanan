<?php 
function get_template($idtemplate, $idpages, $fordetail=false, $template_used=0){
  $ci =& get_instance();
  $ci->load->database();
  $template_master=''; $syntax_detail =''; $syntax_detail2 =''; $replace_with=''; $to_replace='';$dtl_template='';
  $most_popular=''; $news ='';
  $template='';
  $tgl ='';
  $title = '';
  $short_dec='';
  $content = '';
  $image = '';
  $video_url= '';
  $link = '';
  $link_image='';
  $link_video='';
  $create_date='';
  $create_by='';
  $cms_section = str_replace("-", " ", $ci->input->get('lbl')) ;

  if($fordetail==false){
    $ci->db->select('rt.syntax_template, rt.syntax_detail, rt.syntax_detail2, tpt.id_pages');
    $ci->db->from('tbl_page_template AS tpt');
    $ci->db->join('reff_template AS rt', 'ON tpt.id_template = rt.id_template', 'inner');
    $ci->db->where("tpt.id_pages='$idpages'");
    $ci->db->where("tpt.id_template='$idtemplate'");
    $ci->db->where("rt.is_active='Y'");
  }else{
    $ci->db->select('syntax_template, syntax_detail, syntax_detail2');
    $ci->db->from('reff_template');
    $ci->db->where("id_template='$idtemplate'");
    $ci->db->where("is_active='Y'");
  }
  $query = $ci->db->get();

  $rowtemmplate = ($query->num_rows() > 0)?$query->row():FALSE;
  if($rowtemmplate){
    $template_master = $rowtemmplate->syntax_template;
    if($idtemplate!=3){
      $syntax_detail = $rowtemmplate->syntax_detail;
      $syntax_detail2 = $rowtemmplate->syntax_detail2;
    }else if($idtemplate==3){
      $syntax_detail = display_menu();
    }
  }

  /*Get article for template*/
  $ci->db->select('id_article');
  $ci->db->from('tbl_template_page_article');
  $ci->db->where("id_pages='$idpages'");
  $ci->db->where("id_template='$idtemplate'");
  $query = $ci->db->get();

  $row = ($query->num_rows() > 0)?$query->row():FALSE;
  if($row){
    $arr_article = explode(",", $row->id_article);
    $page_id_base_on_template_dtl_of = get_dtl_page_id($idtemplate);
    if(is_array($arr_article)){
      foreach($arr_article as $id_article){
        $sql = "SELECT id_article, title, short_description, article_content, file_name, video_url, id_file_type, id_article_type, create_date, create_by  FROM tbl_article WHERE id_article ='$id_article' ";
        $query = $ci->db->query($sql);
        $row = ($query->num_rows() > 0)?$query->row():FALSE;
        if($row){
          $id_article = $row->id_article;
          $tgl_article =indonesian_date($row->create_date);
          $create_by = ucfirst(get_info_by_id('sys_users', 'full_name', 'user_id',$row->create_by));
          $title =$row->title;
          $short_dec=$row->short_description;
          $content = $row->article_content;
          $image = base_url().'img/'.$row->file_name;

          if(isset($row->video_url)){
            $original_url= explode("=", $row->video_url);
            if(count($original_url)>1){
              $video_url = "https://www.youtube.com/embed/".$original_url[1]."?rel=0&showinfo=0"; 
            }
          }
          $cover_image = $row->file_name;
          $link = base_url()."detail/pagedetail/".$page_id_base_on_template_dtl_of."/".$idtemplate."/".$id_article;
          $link_image='';
          $link_video='';


          if($idtemplate=='5'){//Logic for Gallery
            if($row->id_file_type=='1'){
              $syntax_detail = $rowtemmplate->syntax_detail;
            }else if($row->id_file_type=='2'){
              $syntax_detail = $rowtemmplate->syntax_detail2;
            }
          }else if($idtemplate=='6'){//logic for New & Most Popula
            if($row->id_article_type=='6'){
                $to_replace   = array("[cms_date]","[cms_creator]", "[cms_title]", "[cms_short_desc]", "[cms_content]", "[cms_image]", "[cms_video_url]", "[cms_cover_image]", "[cms_link]", "[cms_link_image]", "[cms_link_video]", "[section]");
                $replace_with= array($tgl_article, $create_by, $title, $short_dec, $content, $image, $video_url, $cover_image, $link, $link_image, $link_video, "$cms_section" );
                $news.= str_replace($to_replace, $replace_with, $syntax_detail);
            }else if($row->id_article_type=='7'){
                $to_replace   = array("[cms_date]","[cms_creator]", "[cms_title]", "[cms_short_desc]", "[cms_content]", "[cms_image]", "[cms_video_url]", "[cms_cover_image]", "[cms_link]", "[cms_link_image]", "[cms_link_video]", "[section]");
                $replace_with= array($tgl_article, $create_by, $title, $short_dec, $content, $image, $video_url, $cover_image, $link, $link_image, $link_video, $cms_section );
                $most_popular.= str_replace($to_replace, $replace_with, $syntax_detail2);
            }
          }

            $to_replace   = array("[cms_date]","[cms_creator]", "[cms_title]", "[cms_short_desc]", "[cms_content]", "[cms_image]", "[cms_video_url]", "[cms_cover_image]", "[cms_link]", "[cms_link_image]", "[cms_link_video]", "[section]");
            $replace_with= array($tgl_article, $create_by, $title, $short_dec, $content, $image, $video_url, $cover_image, $link, $link_image, $link_video, $cms_section );
            $dtl_template.= str_replace($to_replace, $replace_with, $syntax_detail);

        }
      }
      if($idtemplate=='6'){//If template news & Most Popular  (special condition:)
        $to_replace   = array("[cms_news]","[cms_most_popular]");
        $replace_with = array($news, $most_popular);
        $template = str_replace($to_replace, $replace_with, $template_master);
      }else{  
        $to_replace   = array("[cms_detail]", "[section_title]");
        $replace_with= array($dtl_template,$cms_section);
        $template= str_replace($to_replace, $replace_with, $template_master);
      }
    }
  }

  return  $template ; 
}


function generate_template_detail($pageID, $template_used, $articleID){
  $ci =& get_instance();
  $ci->load->database();

  $ci->db->select('syntax_template, syntax_detail, syntax_detail2');
  $ci->db->from('reff_template');
  $ci->db->where("id_template='$template_used'");
  $ci->db->where("is_active='Y'");
  $query = $ci->db->get();
  $rowtemmplate = ($query->num_rows() > 0)?$query->row():FALSE;
  if($rowtemmplate){
    $template_master = $rowtemmplate->syntax_template;
  }

  $sql = "SELECT id_article, title, short_description, article_content, file_name, video_url, id_file_type, id_article_type, create_date, create_by  FROM tbl_article WHERE id_article ='$articleID' ";
  $query = $ci->db->query($sql);
  $row = ($query->num_rows() > 0)?$query->row():FALSE;
  $cms_section = $ci->input->get('lbl');
  if($row){
    $id_article = $row->id_article;
    $tgl_article =indonesian_date($row->create_date);
    $create_by =$row->create_by;
    $title =$row->title;
    $short_dec=$row->short_description;
    $content = $row->article_content;
    $image = base_url().'img/'.$row->file_name;

    $video_url= $row->video_url;
    $cover_image = $row->file_name;
    if($pageID=='0'){
      $link = '';
    }else{
      $link = base_url()."detail/pagedetail/".$pageID."/".$template_used."/".$id_article;
    }
    
    $link_image='';
    $link_video='';

    $to_replace   = array("[cms_date]","[cms_creator]", "[cms_title]", "[cms_short_desc]", "[cms_content]", "[cms_image]", "[cms_video_url]", "[cms_cover_image]", "[cms_link]", "[cms_link_image]", "[cms_link_video]", "[section]");
    $replace_with= array($tgl_article, $create_by, $title, $short_dec, $content, $image, $video_url, $cover_image, $link, $link_image, $link_video, $cms_section);
    $template_dtl= str_replace($to_replace, $replace_with, $template_master);

    return $template_dtl;
  }else{
    return "Data not available";
  }  


}

/*
  function name: get_article_by_type
  Author: Jajas 
  Created at: 16 Aug 18
  Modified at: 17 Aug 18
  param:
  $type_id  : Article Type, 
  $multiple = false. false:: if return as result multiple row, true:: if return as single row 
  $isnews=false. false if article type is not news, true if article type is news, if true filter only article type 6, and 7
*/
     
function get_article_by_type($type_id, $multiple = false, $isnews=false){
  $ci =& get_instance();
  $ci->load->database();
  $ci->db->select("a.id_article, a.title, a.file_name, a.id_article_type, a.article_content, a.id_file_type, a.video_url, a.create_date, u.full_name");
  $ci->db->from('tbl_article a');
  $ci->db->join('sys_users u','ON u.user_id = a.create_by','inner');
  if($isnews==false){
    $ci->db->where("a.id_article_type='$type_id'");
  }else{
    $ci->db->where("a.id_article_type in('6','7')");
  }
  $query=$ci->db->get();
  if($multiple == false){
    return ($query->num_rows() > 0)?$query->row():FALSE;
  }else{
    return ($query->num_rows() > 0)?$query->result_array():FALSE;
  }
}

function get_template_parent_id($template_id){
  $ci =& get_instance();
  $ci->load->database();

  $ci->db->select('id_template');
  $ci->db->from('reff_template');
  $ci->db->where("parent_id_template='$template_id'");
  $query = $ci->db->get();
  $row= ($query->num_rows() > 0)?$query->row():FALSE;
  return $row->id_template;
}

function get_template_idx($page_id){
  $ci =& get_instance();
  $ci->load->database();

  $ci->db->select('id_template');
  $ci->db->from('tbl_pages');
  $ci->db->where("id_pages='$page_id'");
  $query = $ci->db->get();
  $row= ($query->num_rows() > 0)?$query->row():FALSE;
  if($row){
    return $row->id_template;
  }else{
    return 0;
  }
}

function get_page_id($template_id){
  $ci =& get_instance();
  $ci->load->database();

  $ci->db->select('id_pages');
  $ci->db->from('tbl_pages');
  $ci->db->where("id_template='$template_id'");
  $query = $ci->db->get();
  $row= ($query->num_rows() > 0)?$query->row():FALSE;
  return $row->id_pages;
}

function get_dtl_page_id($detail_of){
  $ci =& get_instance();
  $ci->load->database();

  $ci->db->select('id_pages');
  $ci->db->from('tbl_page_template');
  $ci->db->where("detail_of='$detail_of'");
  $query = $ci->db->get();
  $row= ($query->num_rows() > 0)?$query->row():FALSE;
  if($row){
    return $row->id_pages;
  }else{
    return 0;
  }
}


?>