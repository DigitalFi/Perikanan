<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	


	function get_detail($id_content){
		$blog='';
		$sql ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_full_content, fe_content_short_desc, fe_section_name,  
		 create_by, create_date FROM sys_fe_content WHERE status_active = 'Y' AND fe_content_id = '$id_content' ORDER BY fe_content_sort_order DESC limit 0,1  ";
	
//echo $sql;
		$query=$this->db->query($sql);
		$row=$query->row();
		if(isset($row)){
			$img_folder = get_foldername_by_section_id($row->fe_section_name);
			$img_url = base_url(). 'assets/images/upload/'.strtolower($img_folder).'/'.$row->fe_img_files;
			$img='';
			if(isset($row->fe_img_files)){
				$img = '<img class="img-responsive" style="width:60%;" src="'.$img_url.'" alt="">';
		    }
			$blog.='<section id="blog" style="padding-top:2px;">
				<div class="container">';
			$blog.='<div class="row">';	
			$blog.='<div class="col-md-8">
						<h3 class="section-title text-left wow fadeInDown">'.$row->fe_content_title.'</h3>	
						<div class="entry-date">'.indonesian_date($row->create_date).'</div>
						<div class="blog-post blog-large wow fadeInLeft" data-wow-duration="300ms" data-wow-delay="0ms">
							<article>
								<header class="entry-header">
									<div class="entry-thumbnail">
										'.$img.'
									</div>
									
								</header>
		
								<div class="entry-content text-justify">
									'. html_entity_decode($row->fe_full_content).'
								</div>
		
								<footer class="entry-meta">
									<span class="entry-author"><i class="fa fa-pencil"></i> <a href="#">'.$row->create_by.'</a></span>
									<span class="entry-comments"><i class="fa fa-comments-o"></i> <a href="blog/detil/'.$row->fe_content_id.'">15</a></span>
								</footer>
							</article>
						</div>
					</div><!--/.col-sm-6-->';
		
					$fe_section_name = $row->fe_section_name;	
							$content_id = $row->fe_content_id;	
							$sql2 ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_content_short_desc, fe_content_short_desc2, fe_full_content, display_start_from, fe_content_btn_label, create_by, create_date 
							FROM sys_fe_content WHERE  status_active = 'Y' AND fe_section_name='$id_content' AND fe_content_id NOT IN('$content_id')  ORDER BY fe_content_sort_order DESC";

							$query2=$this->db->query($sql2);
							$blog.='<div class="col-md-4"><h4 class="entry-date" style="padding-top:40px">Another Article</h4>';
							foreach($query2->result() as $row2){
							 $img_folder = get_foldername_by_section_id($row->fe_section_name);
							 $img_url2 = base_url(). 'assets/images/upload/'.strtolower($img_folder).'/'.$row2->fe_img_files;
							 //$img_url2 = base_url(). 'assets/images/upload/blog/'.$row2->fe_img_files;
						 
					        $blog.='<div class="blog-post blog-media wow fadeInRight" data-wow-duration="300ms" data-wow-delay="100ms">

					                    <article class="media clearfix">
					                    	<div class="entry-thumbnail pull-left">
					                            <img class="img-responsive"  style="height:50px; width:60px;" src="'.$img_url2.'" alt="">
					                        </div>
					                        <div class="media-body">
					                            <header class="entry-header">
					                                <h4 class="entry-title"><a href="'.base_url().'blog/detail/'.$row2->fe_content_id.'">'.$row2->fe_content_title.'</a></h4>
					                                <div class="entry-date">'.indonesian_date($row2->create_date).'</div>
					                            </header>
					                       </div>
					                    </article>
					                </div>';
							}
							$blog.='</div><!--/.col-sm-6-->';
							$blog.='</section><!--/#blog-->';
							}
							return $blog;
				

	}

	
}
?>