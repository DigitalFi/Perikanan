<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Slider_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	


	function get_detail($id_content){
		$sql = "SELECT fe_content_id, fe_img_files, fe_content_title, fe_full_content, fe_content_short_desc, fe_content_short_desc2, 
		fe_content_btn_url, display_start_from, fe_content_btn_label, create_by, create_date FROM sys_fe_content 
		WHERE status_active = 'Y' AND fe_content_id = '$id_content'";
		$query=$this->db->query($sql);
		$row=$query->row();
		if($row){
			$img_url = base_url(). 'assets/images/upload/slider/'.$row->fe_img_files;
			$blog='<div class="container wow fadeInRight">';
				$blog.='<div class="row">';	
				$blog.='<h3 class="entry-title" style="width:62%">'.$row->fe_content_title.'</h3>
						<div class="entry-date">'.indonesian_date($row->create_date).'</div>
							<div class=" blog-large" data-wow-duration="300ms" data-wow-delay="0ms">
								<article>
									<header class="entry-header">
										<div class="entry-thumbnail">
											<img class="img-responsive" src="'.$img_url.'" alt="">
											
										</div>
										
										
									</header>
			
									<div class="entry-content text-justify" style="width:62%; padding-top:25px" >
										'. html_entity_decode($row->fe_full_content).'
									</div>
			
									<footer class="entry-meta">
										<span class="entry-author"><i class="fa fa-pencil"></i> <a href="#">'.$row->create_by.'</a></span>
										<span class="entry-comments"><i class="fa fa-comments-o"></i> <a href="blog/detil/'.$row->fe_content_id.'">15</a></span>
									</footer>
								</article>
							</div>
						</div>';
		}
		return $blog;				

	}

	
}
?>