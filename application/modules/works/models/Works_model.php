<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Works_model extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
		parent::__construct();
	   $this->load->library('session');
       $this->load->database();
       $this->load->helper('common');
	}	


	function get_detail($id_section, $segment_info){
		$blog='';
		$jml_row_berita_main = get_sys_setting('005');
		$jml_row_berita_kanan_start = $jml_row_berita_main + 1;
		$jml_row_berita_kanan = get_sys_setting('006');
		$limit_digit = '100';
		$section_id = $id_section;
		if(strlen($id_section)>=2){
		    $section_id = get_section_id_by_content_id($id_section);
	    
		}
		$sql ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_full_content, fe_content_short_desc, fe_section_name,  create_by, create_date 
		FROM sys_fe_content WHERE status_active = 'Y' AND fe_section_name = '$section_id' AND  fe_content_btn_label =  '$segment_info'
		ORDER BY fe_content_sort_order DESC  limit 0,".$jml_row_berita_main."";
		// echo $sql;
		$query=$this->db->query($sql);
		$blog ='';
		if(strtolower($segment_info)!='wall-of-fame'){
			$blog.='<div class="container">';
			$blog.='<div   class="col-md-6"><h4 class="entry-date nav-pills" style="padding-top:40px">'.ucfirst($segment_info).'</h4>';
				foreach($query->result() as $row){
				 $img_url2 = base_url(). 'assets/images/upload/works/'.$row->fe_img_files;
			 		$content_decode = strip_tags_content($row->fe_full_content);
			 		$three_dot ='';
			 		if(strlen($content_decode)>=100){
			 			$three_dot ="...";
			 		}
			 		$content = substr($content_decode, 0, 100).$three_dot;
		        	$blog.='<div class="blog-post blog-media wow fadeInRight" padding-bottom:5px" data-wow-duration="300ms" data-wow-delay="100ms">

		                    <article class="media clearfix" style="padding-top:5px; border-bottom:1px dotted red; ">
		                    	<div class="entry-thumbnail pull-left">
		                            <img class="img-responsive" style="width:70px; height:50px" src="'.$img_url2.'" alt="">

		                        </div>
		                        <div class="media-body">
		                            <header class="entry-header">
		                                <h4 class="entry-title"><a href="'.base_url().'works/detail_deep/'.$row->fe_content_id.'">'.$row->fe_content_title.'</a></h4>
		                                <div class="section-title text-left wow fadeInDown">'.$content.'</div>
		                                <div class="entry-date">'.indonesian_date($row->create_date).'</div>
		                            </header>
		                       </div>
		                    </article>
		                </div>';
				}
			$blog.='</div><!--/.col-sm-6-->';
			//$blog.='</section><!--/#blog-->';
			

			//$fe_section_name = $row->fe_section_name;	
			//$content_id = $row->fe_content_id;	
			$sql2 ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_content_short_desc, fe_content_short_desc2, fe_full_content, display_start_from, fe_content_btn_label, create_by, create_date 
			FROM sys_fe_content WHERE  status_active = 'Y' AND fe_section_name=	'$id_section' AND fe_content_btn_label = '$segment_info' ORDER BY fe_content_sort_order DESC limit $jml_row_berita_kanan_start, $jml_row_berita_kanan";
			$query2=$this->db->query($sql2);
			$blog.='<div class="col-md-4"><h4 class="entry-date" style="padding-top:40px">Another '.$segment_info.'</h4>';
				foreach($query2->result() as $row2){
				 $img_url2 = base_url(). 'assets/images/upload/works/'.$row2->fe_img_files;
			 
		        	$blog.='<div class="blog-post blog-media wow fadeInRight" data-wow-duration="300ms" data-wow-delay="100ms">

		                    <article class="media clearfix">
		                    	<div class="entry-thumbnail pull-left">
		                            <img class="img-responsive" style="width:70px; height:50px" src="'.$img_url2.'" alt="">
		                        </div>
		                        <div class="media-body">
		                            <header class="entry-header">
		                                <h4 class="entry-title"><a href="'.base_url().'works/detail_deep/'.$row2->fe_content_id.'">'.$row2->fe_content_title.'</a></h4>
		                                <div class="entry-date">'.indonesian_date($row2->create_date).'</div>
		                            </header>
		                       </div>
		                    </article>
		                </div>';
				}
			$blog.='</div><!--/.col-sm-6-->';
			$blog.='</section><!--/#blog-->';
		}elseif(strtolower($segment_info)=='wall-of-fame'){
			$blog.='<div class="container" id="tourpackages-carousel">
			<h4 class="entry-date nav-pills" style="padding-top:40px">'.ucfirst($segment_info).'</h4>
		      <div class="row">';
		        foreach($query->result() as $row){
		        	$img_url2 = base_url(). 'assets/images/upload/works/'.$row->fe_img_files;
			        $blog.='<div class="col-sm-6 col-md-4">
			          <div class="thumbnail">
			            <img style="width:350px;height:263px" src="'.$img_url2.'" alt="">
			              <div class="caption">
		                   <h4 class="entry-title"><a href="'.base_url().'works/detail_deep/'.$row->fe_content_id.'">'.$row->fe_content_title.'</a></h4>
			                <p>'.$row->fe_content_short_desc.'</p>
			            </div>
			          </div>
			        </div> <!--End col-sm-6-->';
		        }
		      $blog.='</div><!-- End row -->
		    </div><!-- End container -->';


		}
		return $blog;				

	}

function get_detail2($id_content){
		$blog='';
		$sql ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_full_content, fe_content_short_desc, fe_section_name, fe_content_btn_label,  
		 create_by, create_date FROM sys_fe_content WHERE status_active = 'Y'  AND fe_content_id='$id_content' ORDER BY fe_content_sort_order DESC  limit 0,1";
		$query=$this->db->query($sql);
		$row=$query->row();
		$segment_name ='';
		if(isset($row)){
			$segment_info = $row->fe_content_btn_label;
			$img_url = base_url(). 'assets/images/upload/works/'.$row->fe_img_files;
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
										<img class="img-responsive" style="width:70%;" src="'.$img_url.'" alt="">
									</div>
									
								</header>
		
								<div class="entry-content text-justify">
									'. html_entity_decode($row->fe_full_content).'
								</div>
		
								<footer class="entry-meta">
									<span class="entry-author"><i class="fa fa-pencil"></i> <a href="#">'.$row->create_by.'</a></span>
									<span class="entry-comments"><i class="fa fa-comments-o"></i> <a href="blog/detil_deep/'.$row->fe_content_id.'">15</a></span>
								</footer>
							</article>
						</div>
					</div><!--/.col-sm-6-->';
		
	    $segment_name = $row->fe_content_btn_label;				
		$fe_section_name = $row->fe_section_name;	
		$content_id = $row->fe_content_id;	
		$sql2 ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_content_short_desc, fe_content_short_desc2, fe_full_content, display_start_from, fe_content_btn_label, create_by, create_date 
		FROM sys_fe_content WHERE fe_content_btn_label ='$segment_info' AND  status_active = 'Y' AND fe_section_name='$fe_section_name' AND fe_content_id NOT IN('$content_id')   ORDER BY fe_content_sort_order DESC";

		$query2=$this->db->query($sql2);
		$blog.='<div class="col-md-4"><h4 class="entry-date" style="padding-top:40px">Another '.ucfirst($segment_name).'</h4>';
		foreach($query2->result() as $row2){
		 $img_url2 = base_url(). 'assets/images/upload/works/'.$row2->fe_img_files;
	 
        $blog.='<div class="blog-post blog-media wow fadeInRight" data-wow-duration="300ms" data-wow-delay="100ms">

                    <article class="media clearfix">
                    	<div class="entry-thumbnail pull-left">
                            <img class="img-responsive" style="width:70px; height:50px" src="'.$img_url2.'" alt="">
                        </div>
                        <div class="media-body">
                            <header class="entry-header">
                                <h4 class="entry-title"><a href="'.base_url().'works/detail_deep/'.$row2->fe_content_id.'">'.$row2->fe_content_title.'</a></h4>
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