<?php 
function get_template($template_id){
  $ci =& get_instance();
  $ci->load->database();
  $ci->db->select('syntax_template');
  $ci->db->from("reff_template");
  $ci->db->where("id_template='$template_id'");
  
  $query = $ci->db->get();
  $row = ($query->num_rows() > 0)?$query->row():FALSE;
  $template_master = $row->syntax_template;
  $template ='';
  switch ($template_id) {
      //TRENDING
      case "1":
          $article_info = get_article_by_type($template_id);
          $tgl_article  = indonesian_date($article_info->create_date);
          $id_article   = $article_info->id_article;
          $link_article = base_url()."detail/".$id_article;
          $title_article= $article_info->title;
          $to_replace   = array("[cms_tgl_trending]", "[cms_link_trending]", "[cms_title_trending]");
          $replace_with = array($tgl_article, $link_article , $title_article);
          $template     = str_replace($to_replace, $replace_with, $template_master);
          break;
      case "2":
          $article_info = get_article_by_type($template_id);
          $logo         = base_url()."assets/images/logonew.png";
          $to_replace   = array("[cms_top_logo]");
          $replace_with = array($logo);
          $template = str_replace($to_replace, $replace_with, $template_master);
          break;
      case "3":
          $article_info = get_article_by_type($template_id);
          $menu         = display_menu();
          $logo_mobile  = base_url()."assets/images/logonew.png";
          $to_replace   = array("[cms_top_menu]","[cms_logo_mobile]");
          $replace_with = array($menu,$logo_mobile);
          $template     = str_replace($to_replace, $replace_with, $template_master);
          break;
      case "4":
          $slider ='';
          $article_info = get_article_by_type($template_id,true);
          foreach($article_info as $dtslider){
            $slider.='<div class="slide"><img src="'.base_url().'img/'.$dtslider['file_name'].'" alt=""></div>';
          }
          $to_replace   = array("[cms_slider]");
          $replace_with = array($slider);
          $template = str_replace($to_replace, $replace_with, $template_master);
          break;
      case "5":
          $article_info = get_article_by_type($template_id,true);
          $page_id = get_page_id($template_id);
          $template_hdr_id = get_template_parent_id($template_id);
          $gallery ='';
          foreach($article_info as $dtgallery){
           $tgl_article  = indonesian_date($dtgallery['create_date']);
           
            if($dtgallery['id_file_type']=='1'){
              $url_dtl = base_url().'detail/pagedetail/'.$page_id.'/'.$dtgallery['id_article'].'/'.$dtgallery['id_article_type'].'/'.$template_hdr_id;
              $gallery.='
              <div class="item px-2">
                <div class="fh5co_hover_news_img">
                  <div class="fh5co_news_img"><img src="'.base_url().'img/'.$dtgallery['file_name'].'" alt=""/></div>
                    <div>
                      <a href="'.$url_dtl.'" class="d-block fh5co_small_post_heading"><span class="">'.$dtgallery['title'].' </span></a>
                      <div class="c_g"><i class="fa fa-clock-o"></i> '.$tgl_article.'</div>
                    </div>
                </div>
              </div>';
            }else{
              $gallery.='
            <div class="fh5co_hover_news_img">
              <div class="fh5co_hover_news_img_video_tag_position_relative">
                 <div class="fh5co_news_img">
                    <iframe id="video" width="100%" height="200"
                       src="'.$dtgallery['video_url'].'"
                       frameborder="0" allowfullscreen></iframe>
                 </div>
                 <div class="fh5co_hover_news_img_video_tag_position_absolute fh5co_hide">
                    <img src="'.base_url().'img/'.$dtgallery['file_name'].'" alt=""/>
                 </div>
                 <div class="fh5co_hover_news_img_video_tag_position_absolute_1 fh5co_hide" id="play-video">
                    <div class="fh5co_hover_news_img_video_tag_position_absolute_1_play_button_1">
                       <div class="fh5co_hover_news_img_video_tag_position_absolute_1_play_button">
                          <span><i class="fa fa-play"></i></span>
                       </div>
                    </div>
                 </div>
              </div>
              <div class="pt-2">
                 <a href="#" class="d-block fh5co_small_post_heading">
                 <span class="">'.$dtgallery['title'].'</span></a>
                 <div class="c_g"><i class="fa fa-clock-o"></i> '.$tgl_article.'</div>
              </div>
            </div>';
            }
          }
          $to_replace   = array("[cms_gallery]");
          $replace_with = array($gallery);
          $template = str_replace($to_replace, $replace_with, $template_master);   
          break;     
      case "6":
          //get page id to get template
          $page_id = get_page_id($template_id);
          $article_info = get_article_by_type($template_id,true,true);
          $news=''; $most_popular='';
          $template_hdr_id = get_template_parent_id($template_id);
          if(is_array($article_info)){
            foreach($article_info as $dtnews){
                $tgl_article  = indonesian_date($dtnews['create_date']);
                if($dtnews['id_article_type']=='6'){
                  $url_dtl = base_url().'detail/pagedetail/'.$page_id.'/'.$dtnews['id_article'].'/'.$dtnews['id_article_type'].'/'.$template_hdr_id;
                  $news.='<div class="row pb-4">
                    <div class="col-md-5">
                      <div class="fh5co_hover_news_img">
                         <div class="fh5co_news_img"><img src='.base_url().'img/'.$dtnews['file_name'].' alt=""/></div>
                         <div></div>
                      </div>
                    </div>
                    <div class="col-md-7 animate-box">
                      <a href="'.$url_dtl.'" style="font-size:18px; color:#222; font-weight:bold" >'.$dtnews['title'].'</a> 
                      <br><div style="font-size:11px;color:#701228;text-align:right;padding-bottom:15px;">'.$tgl_article.'</div>';
                      if($dtnews['article_content']!=''){
                          $news.='<div>'.$dtnews['article_content'].'</div>';
                      }
                  $news.='</div>
                  </div>';
                }else if($dtnews['id_article_type']=='7'){
                  $most_popular='
                  <div class="row pb-3">
                    <div class="col-5 align-self-center">
                      <img src='.base_url().'img/'.$dtnews['file_name'].' alt='.$dtnews['title'].' class="fh5co_most_trading"/>
                    </div>
                    <div class="col-7 paddding">
                      <div class="most_fh5co_treding_font" style="font-weight:bold"> '.$dtnews['title'].'</div>
                      <div class="most_fh5co_treding_font_123" style="font-size:10px"> '.$tgl_article.'</div>
                    </div>
                  </div>';
                }
            }
          }else{
            $news = "News currently unavailable";
          }
          $to_replace   = array("[cms_news]","[cms_most_popular]");
          $replace_with = array($news, $most_popular);
          $template = str_replace($to_replace, $replace_with, $template_master);
          break;
      case "11":
          $article_info = get_article_by_type($template_id, true);
          $budidaya_ikan='';
          foreach($article_info as $dtkat_ikan){
            $kategori_ikan.='
            <div class="item px-2">
                <div class="fh5co_latest_trading_img_position_relative">
                    <div class="fh5co_latest_trading_img"><img src="'.base_url().'img/'.$dtkat_ikan['file_name'].'" alt="" class="fh5co_img_special_relative"/></div>
                     <div class="fh5co_latest_trading_img_position_absolute"></div>
                    <div class="fh5co_latest_trading_img_position_absolute_1">
                        <a href="single10.html" class="text-white"> "'.$dtkat_ikan['title'].'" </a>
                    </div>
                </div>
            </div>';
          }
          $to_replace   = array("[cms_slider]");
          $replace_with = array($kategori_ikan);
          $template = str_replace($to_replace, $replace_with, $template_master);
          break;
      case "13":
          $article_info = get_article_by_type($template_id);
          $logo_mobile  = base_url()."assets/images/logonew.png";
          $to_replace   = array("[cms_section_title]","[cms_image]","[cms_content]");
          $replace_with = array($article_info->file_name,$logo_mobile);
          $template     = str_replace($to_replace, $replace_with, $template_master);
          break;
          default:
          //code to be executed if n is different from all labels;
  }
  return  $template;
}

function get_menu_template($template_id, $page_id){
  $ci =& get_instance();
  $ci->load->database();
  $ci->db->select('syntax_template');
  $ci->db->from("reff_template");
  $ci->db->where("id_template='$template_id'");
  
  $query = $ci->db->get();
  $template ='';
  $row = ($query->num_rows() > 0)?$query->row():FALSE;
  $template_master = $row->syntax_template;
  
  $article_info = get_article_by_type($template_id);  
  $article      = get_article_by_id($article_id);
  $url_img      = base_url().'img/'.$article->file_name;
  $tgl_article  = indonesian_date($article->create_date);
  $title        = $article->title;
  $content      = $article->article_content;

  $to_replace   = array("[cms_dtl_url_img]", "[cms_dtl_date]", "[cms_dtl_title]","[cms_dtl_content]");
  $replace_with = array($url_img, $tgl_article , $title,$content);
  $template     = str_replace($to_replace, $replace_with, $template_master);

  return  $template;
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

function get_template_id($page_id){
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



?>