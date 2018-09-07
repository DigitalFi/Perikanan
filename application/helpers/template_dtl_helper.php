<?php 
function get_template_dtl($template_id, $article_id, $lblmenu=''){
  $ci =& get_instance();
  $ci->load->database();
  $ci->db->select('syntax_template, refer_to');
  $ci->db->from("reff_template");
  $ci->db->where("id_template='$template_id'");
  $query = $ci->db->get();
  $template =''; $url_img =''; $tgl_article =''; $title =''; $content =''; $slider ='';
  $section_title ='';
  $row = ($query->num_rows() > 0)?$query->row():FALSE;
  $template_master = $row->syntax_template;
  $tempelate_refer_to = $row->refer_to;
  $article      = get_article_by_id($article_id);

  if($article!='0'){
    $url_img      = base_url().'img/'.$article->file_name;
    $tgl_article  = indonesian_date($article->create_date);
    $title        = $article->title;
    $content      = $article->article_content;                      
  }else if($article==0){
      $article = get_article_by_type_id($template_id, true, false);
      $page_id = get_page_id($template_id);
      foreach ($article as $dt) {
        $url_dtl = base_url().'detail/pagedetail/'.$page_id.'/'.$dt['id_article'].'/'.$dt['id_article_type'].'/'.$tempelate_refer_to;
        $url_img      = base_url().'img/'.$dt['file_name'];
        $tgl_article  = indonesian_date($dt['create_date']);
        $title        = $dt['title'];
        $content      = $dt['article_content']; 
        $slider.='
            <div class="item px-2">
                <div class="fh5co_latest_trading_img_position_relative">
                    <div class="fh5co_latest_trading_img"><img src="'.$url_img.'" alt="" class="fh5co_img_special_relative"/></div>
                    <div class="fh5co_latest_trading_img_position_absolute"></div>
                    <div class="fh5co_latest_trading_img_position_absolute_1">
                        <a href="'.$url_dtl.'" class="text-white">'.$title.'</a>
                    </div>
                </div>
            </div>';
      }
  }

  $section_title= str_replace("-", " ", $lblmenu);
  $to_replace   = array("[cms_section_title]","[cms_dtl_url_img]", "[cms_dtl_date]", "[cms_dtl_title]","[cms_dtl_content]","[cms_slider]","[cms_gallery]");
  $replace_with = array($section_title, $url_img, $tgl_article , $title, $content,$slider);
  $template     = str_replace($to_replace, $replace_with, $template_master);

  return  $template;
}

/*
  function name: get_article_by_id
  Author: Jajas 
  Created at: 16 Aug 18
  Modified at: 17 Aug 18
  param:
  $type_id  : Article Type, 
  $multiple = false. false:: if return as result multiple row, true:: if return as single row 
  $isnews=false. false if article type is not news, true if article type is news, if true filter only article type 6, and 7
*/
     
function get_article_by_id($article_id){
  $ci =& get_instance();
  $ci->load->database();
  
  $ci->db->select("a.id_article, a.title, a.file_name, a.id_article_type, a.article_content, a.id_file_type, a.video_url, a.create_date, u.full_name");
  $ci->db->from('tbl_article a');
  $ci->db->join('sys_users u','ON u.user_id = a.create_by','inner');
  $ci->db->where("a.id_article='$article_id'");

  $query=$ci->db->get();
  $row= ($query->num_rows() > 0)?$query->row():FALSE;
  if($row){
    return ($query->num_rows() > 0)?$query->row():FALSE;
  }else{
    return 0;
  }
}

function get_article_by_type_id($article_type_id){
  $ci =& get_instance();
  $ci->load->database();
  
  $ci->db->select("a.id_article, a.title, a.file_name, a.id_article_type, a.article_content, a.id_file_type, a.video_url, a.create_date, u.full_name");
  $ci->db->from('tbl_article a');
  $ci->db->join('sys_users u','ON u.user_id = a.create_by','inner');
  $ci->db->where("a.id_article_type='$article_type_id'");

  $query=$ci->db->get();
  return  ($query->num_rows() > 0)?$query->result_array():FALSE;
 
}




?>