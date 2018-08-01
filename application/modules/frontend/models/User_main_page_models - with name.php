<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_main_page_models extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
			  $this->load->helper('common');
	}	
	
	function generate_img_slider($script_section, $section_name){
		$sql ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_content_short_desc, fe_content_btn_label, fe_content_btn_url, fe_section_name FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC";
		$query=$this->db->query($sql);
		$default_button_label = get_sys_setting('002');
		$slider="<section id='main-slider'>";
		$slider.="<div class='owl-carousel'>";
		$slider_script1="";
		$slider_script2="";
		$slider_script3="";
		$slider_script4="";
		foreach ($query->result() as $row){
		$url = strtolower($row->fe_section_name).'/detail/'.$row->fe_content_id;
			$button_label = $row->fe_content_btn_label;
			if($row->fe_content_btn_label==''){
				$button_label = $default_button_label;
			}

			$img_url = base_url(). 'assets/images/upload/slider/'.$row->fe_img_files;
			$slider_script1= str_replace("[img]",$img_url,$script_section);
			$slider_script2= str_replace("[img_title]",$row->fe_content_title,$slider_script1);
			$slider_script3= str_replace("[short_description]",$row->fe_content_short_desc,$slider_script2);
			$slider_script4= str_replace("[btn_url]",$url,$slider_script3);
			$slider.= str_replace("[btn_label]",$button_label,$slider_script4);
		}
		 $slider.="</section><!--/#main-slider-->";		
		return $slider;
	}

	function generate_headline($headline_script, $section_name){
		$sql_section ="SELECT section_id, section_name, section_title, section_desc FROM sys_page_section
		 WHERE section_name='$section_name'";
		$query_section=$this->db->query($sql_section);
		$row_section=$query_section->row();
		$default_button_label = get_sys_setting('002');
		
		$sql ="SELECT fe_content_id, fe_section_name, fe_content_title, fe_content_short_desc, fe_content_btn_label, fe_content_btn_url, fe_full_content 
		FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y' ORDER BY fe_content_sort_order DESC limit 0,1";
		$query=$this->db->query($sql);
		$row=$query->row();
		$headline="";
		$title = $row->fe_content_title;
		if($row){
			$button_label = $row->fe_content_btn_label;
			$url = strtolower($row->fe_section_name).'/detail/'.$row->fe_content_id;
			if($row->fe_content_btn_label==''){
				$button_label = $default_button_label;
			}

			$short_desc =$row->fe_content_short_desc;
			if($short_desc==''){
				$short_desc = html_entity_decode(substr($row->fe_full_content,0,255))."...";
			}
			$headline_script1="";
			$headline_script2="";
			$headline_script3="";
			$headline_script1= str_replace("[title]",$title,$headline_script);
			$headline_script2= str_replace("[short_description]",$short_desc,$headline_script1);
			$headline_script3= str_replace("[btn_url]",$url,$headline_script2);
			$headline.= str_replace("[btn_label]",$button_label,$headline_script3);
		}
		return $headline;
	}

	function generate_features($features_script, $section_name){

		$row_section = get_section_info_by_name(strtolower($section_name));
		$img_url = base_url(). 'assets/images/upload/features/'.$row_section->image_section;
		$features='<section id="features">
			<div class="container">
				<div class="section-header">';
			$features.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
			$features.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
				</div>
				<div class="row">
					<div class="col-sm-6 wow fadeInLeft">
						<img class="img-responsive" src="'.$img_url.'" alt="">
					</div>
					<div class="col-sm-6">';
		$features_script1="";			
		$features_script2="";			
		$sql_item ="SELECT fe_content_id, fe_content_short_desc, fe_content_title, fe_content_icon, fe_section_name, fe_full_content, fe_link_clickable FROM sys_fe_content WHERE fe_section_name='$section_name'  AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC limit 0,6";
		$query_item=$this->db->query($sql_item);
		foreach ($query_item->result() as $row_item){
			$url = strtolower($row_item->fe_section_name).'/detail/'.$row_item->fe_content_id;
			$features_script1= str_replace("[icon]",$row_item->fe_content_icon,$features_script);
			$features_script2= str_replace("[title]",$row_item->fe_content_title,$features_script1);
			if ($row_item->fe_link_clickable=='Y'){
				$features_script2= str_replace("[title]","<a href='".$url."'>".$row_item->fe_content_title."</a>",$features_script1);
			}
			$features.= str_replace("[short_description]",$row_item->fe_content_short_desc."...",$features_script2);
		}
		$features.='</div>
					</div>
				</div>
			</div>
		</section>';
		return $features;
	}
	
	function generate_template($template_script, $section_name){
		$sql ="SELECT fe_img_files, fe_content_title, fe_content_short_desc, fe_content_btn_label, fe_content_btn_url FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y' ORDER BY fe_content_sort_order ASC";
		$query=$this->db->query($sql);
		$row=$query->row();
		$default_button_label = get_sys_setting('002');
		$template="";
		if(isset($row)){
			$button_label = $row->fe_content_btn_label;
			if($row->fe_content_btn_label==''){
				$button_label = $default_button_label;
			}

			$img_url = base_url().'assets/images/upload/template/'.$row->fe_img_files;
			$template_script1="";
			$template_script2="";
			$template_script3="";
			$template_script4="";
			$template="";
			$template_script1= str_replace("[img]",$img_url,$template_script);
			$template_script2= str_replace("[title]",$row->fe_content_title,$template_script1);
			$template_script3= str_replace("[short_description]",$row->fe_content_short_desc,$template_script2);
			$template_script4= str_replace("[btn_url]",$row->fe_content_btn_url,$template_script3);
			$template.= str_replace("[btn_label]",$button_label,$template_script4);
		}
		return $template;
	}

	function generate_services($services_script, $section_name){
		$services='';
		$row_section = get_section_info_by_name(strtolower($section_name));
		if(isset($row_section)){
		$services='<section id="services">
			<div class="container">
				<div class="section-header">';
			$services.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
			$services.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
				</div>
				<div class="row">

		<div class="services">';
		$services_script1="";			
		$services_script2="";			
		$sql_item ="SELECT  fe_content_short_desc2, fe_content_short_desc, fe_content_short_desc, fe_content_title, fe_content_icon, fe_full_content, fe_link_clickable  FROM sys_fe_content WHERE fe_section_name='$section_name'   AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC limit 0,6";
		$query_item=$this->db->query($sql_item);
		foreach ($query_item->result() as $row_item){
			$services_script1= str_replace("[icon]",$row_item->fe_content_icon,$services_script);
			$services_script2= str_replace("[title]",$row_item->fe_content_title,$services_script1);
			if ($row_item->fe_link_clickable=='Y'){
				$services_script2= str_replace("[title]","<a href='#'>".$row_item->fe_content_title."</a>",$services_script1);
			}
			$services.= str_replace("[short_description]",$row_item->fe_content_short_desc."...",$services_script2);
		}
			$services.='</div><!--/.services-->
					</div><!--/.row-->    
				</div><!--/.container-->
			</section><!--/#services-->';
		}
		return $services;
	}

	function generate_works($works_script, $section_name){
		$sql ="SELECT fe_img_files, fe_content_title, fe_content_short_desc FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC limit 0,1";
		$query=$this->db->query($sql);
		$row=$query->row();
		$works='';
		$row_section = get_section_info_by_name(strtolower($section_name));
		if(isset($row_section)){
		$img_base_url =base_url()."assets/images/upload/works/"; 
		$img_url = $img_base_url.$row->fe_img_files;

		$works='<section id="portfolio">
			<div class="container">
				<div class="section-header">';
			$works.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
			$works.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
				</div>';

		$works.='<div class="text-center">
            <ul class="portfolio-filter">
                <li><a class="active" href="#" data-filter="*">All</a></li>';
		$sql_tab = "SELECT DISTINCT fe_content_btn_label FROM sys_fe_content WHERE fe_section_name='$section_name'";
		$query_tab=$this->db->query($sql_tab);
		foreach ($query_tab->result() as $row_tab){
			$works.= '<li><a href="#" data-filter=".'.strtolower($row_tab->fe_content_btn_label).'">'.$row_tab->fe_content_btn_label.'</a></li>';	
		}
		$works.='</ul><!--/#portfolio-filter-->
        	</div><!--text-center-->
			<div class="portfolio-items creative">';
		$works_script1="";			
		$works_script2="";			
		$works_script3="";			
		$works_script4="";			
		$works_script5="";			
		$sql_item ="SELECT fe_content_id, fe_content_short_desc, fe_section_name, fe_content_title, fe_full_content,  fe_content_btn_label, fe_img_files, fe_img_files2, fe_content_short_desc2, fe_content_short_desc3 FROM sys_fe_content 
		WHERE fe_section_name='$section_name'  AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC";
		$query_item=$this->db->query($sql_item);
		foreach ($query_item->result() as $row_item){
			$link = strtolower($row_item->fe_section_name).'/detail/'.$row_item->fe_content_id;	
			$url  ='<a href="'.base_url().$link.'">'.$row_item->fe_content_title.' </a>';
			$works_script1= str_replace("[btn_label]", strtolower($row_item->fe_content_btn_label),$works_script);
			$works_script2= str_replace("[img1]",$img_base_url.$row_item->fe_img_files,$works_script1);
			$works_script3= str_replace("[short_description1]",$url,$works_script2);
			$works_script4= str_replace("[short_description2]",$row_item->fe_content_short_desc,$works_script3);
			$works.= str_replace("[img2]",$img_base_url.$row_item->fe_img_files2,$works_script4);
			//$works.= str_replace("[short_description]",$row_item->fe_full_content,$works_script5);
		}
			$works.='</div>
			</div><!--/.container-->
		</section><!--/#portfolio-->';
		}
		return $works;
	}

	function generate_about($about_script, $section_name){
		$sql ="SELECT fe_img_files, fe_content_title, fe_content_short_desc, fe_content_short_desc2, fe_content_short_desc3, fe_content_btn_url, fe_content_btn_label, fe_full_content FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC limit 0,1";
		$query=$this->db->query($sql);
		$row=$query->row();
		$about='';
		$row_section = get_section_info_by_name(strtolower($section_name));
		if(isset($row_section)){
		$img_base_url = base_url(). 'assets/images/upload/about/'; 
		$img_url = $img_base_url.$row_section->image_section;
		$about='<section id="about">
			<div class="container">
				<div class="section-header">';
			$about.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
			$about.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
				</div>';

		$about.='<div class="row">
			<div class="col-sm-6 wow fadeInLeft">
				<img class="img-responsive" src="'.$img_url.'" alt="">
			</div>
            <div class="col-sm-6 wow fadeInRight">
			 <h3 class="column-title">'.$row->fe_content_short_desc2.'</h3>
                <p>'.$row->fe_content_short_desc3.'</p>
				<p>'.$row->fe_full_content.'</p>';
		$about.='<a class="btn btn-primary" href="'.$row->fe_content_btn_url.'">'.$row->fe_content_btn_label.'</a>
					</div>
				</div>
			</div>
		</section><!--/#about-->';
		}
		return $about;
	}

	function generate_team($team_script, $section_name){
		$team='';
		$img_url='';
		$row_section = get_section_info_by_name(strtolower($section_name));
		//$sql ="SELECT fe_content_title, fe_content_short_desc FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order";
		//$query=$this->db->query($sql);
		//$row=$query->row();
		if(isset($row_section)){
		//$head_title = $row->fe_content_title;
		$team='<!--/#meet-team-->
		<section id="meet-team">
			<div class="container">
				<div class="section-header">';
			$team.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
			$team.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
				</div>';
			$team.='<div class="row">';
					
		$sql_item ="SELECT fe_content_id,  fe_img_files, fe_content_title, fe_section_name, fe_content_short_desc, fe_content_short_desc3, fe_full_content, fe_sosmed, fe_link_clickable   FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC";
		$query_item=$this->db->query($sql_item);
		$link_more ='';
		foreach ($query_item->result() as $row_item){
			$content_decoded = 	html_entity_decode($row_item->fe_full_content);
			$img_url = base_url(). 'assets/images/upload/team/'.$row_item->fe_img_files;
			$url = strtolower($row_item->fe_section_name).'/detail/'.$row_item->fe_content_id;	
			if($row_item->fe_link_clickable=='Y'){	
				
				if(strlen($content_decoded)>=104){
					$link_more ="<a href=".'#'."> Detail</a>";	
				}
			}

			$team.='<div class="col-sm-6 col-md-3">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img" style="">
                            <img class="img-responsive" src="'.$img_url.'" alt="">
                        </div>
                        <div class="team-info">
                            <h4><a href='.$url.'>'.$row_item->fe_content_title.'</a></h4>
                            <span>'.$row_item->fe_content_short_desc.'</span>
                        </div>';
			if($row_item->fe_link_clickable=='Y'){	
				
				if(strlen($content_decoded)>=104){
					$link_more ="<a href=".'#'."> Detail...</a>";	
				}
			}
			//$team.=substr($row_item->fe_full_content).$link_more;
/*			$team.='<ul class="social-icons">';
			$arr_socmed = explode(";",$row_item->fe_sosmed);
			foreach($arr_socmed as $dtsocmed){
				$arr_item_socmed = explode("|",$dtsocmed);
				$team.='<li><a href="'.$arr_item_socmed[1].'"><i class="fa fa-'.$arr_item_socmed[0].'"></i></a></li>&nbsp;';
			}
			$team.='</ul>';
*/			$team.='</div>
                </div>';
		}
			$team.='</div><!--/#row-->
			<div class="divider"></div>';
			$team.='</div>
			</section><!--/#meet-team-->';
		}
		return $team;
	}

	function generate_blog($section_name){
		$blog='';
		$sql ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_full_content, fe_content_short_desc, fe_content_short_desc2, 
		fe_content_btn_url, display_start_from, fe_content_btn_label, create_by, create_date FROM sys_fe_content 
		WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order DESC  limit 0,1";
		$query=$this->db->query($sql);
		$row=$query->row();
		$default_button_label = get_sys_setting('002');
		$row_section = get_section_info_by_name(strtolower($section_name));
		if(isset($row)){
			$head_title = $row->fe_content_title;
			$img_url = base_url(). 'assets/images/upload/blog/'.$row->fe_img_files;
			$button_label = $row->fe_content_btn_label;
			if($row->fe_content_btn_label==''){
				$button_label = $default_button_label;
			}
			$blog.='<section id="blog">
				<div class="container">
					<div class="section-header" >
						<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>
						<p class="wow fadeInDown">'.$row_section->section_desc.'</p>
					</div>';
			$blog.='<div class="row">';	
			$blog.='<div class="col-sm-6">
						<div class="blog-post blog-large wow fadeInLeft" data-wow-duration="300ms" data-wow-delay="0ms">
							<article>
								<header class="entry-header">
									<div class="entry-thumbnail">
										<img class="img-responsive" style="width:553px; height:302px" src="'.$img_url.'" alt="">
										<span class="post-format post-format-video"><i class="fa fa-pencil-square-o"></i></span>
									</div>
									<div class="entry-date">'.indonesian_date($row->create_date).'</div>
									<h2 class="entry-title"><a href="blog/detail/'.$row->fe_content_id.'">'.$row->fe_content_title.'</a></h2>
								</header>
		
								<div class="entry-content">
									'. html_entity_decode(substr($row->fe_full_content,0,341)).'
									<a class="btn btn-primary" href="blog/detail/'.$row->fe_content_id.'">'.$button_label.'</a>
								</div>
		
								<footer class="entry-meta">
									<span class="entry-author"><i class="fa fa-pencil"></i> <a href="#">'.$row->create_by.'</a></span>
									<span class="entry-comments"><i class="fa fa-comments-o"></i> <a href="blog/detail/'.$row->fe_content_id.'">15</a></span>
								</footer>
							</article>
						</div>
					</div><!--/.col-sm-6-->';
			
		$sql2 ="SELECT fe_content_id, fe_img_files, fe_content_title, fe_content_short_desc, fe_content_short_desc2, fe_full_content, display_start_from, fe_content_btn_label, create_by, create_date 
		FROM sys_fe_content WHERE fe_section_name='$section_name'  AND status_active = 'Y'  ORDER BY fe_content_sort_order DESC  limit 1,2";

		$query2=$this->db->query($sql2);
		$blog.='<div class="col-sm-6">';
		foreach($query2->result() as $row2){
		 $img_url2 = base_url(). 'assets/images/upload/blog/'.$row2->fe_img_files;
		 $button_label = $row2->fe_content_btn_label;
		 if($row2->fe_content_btn_label==''){
			$button_label = $default_button_label;
		 }
		 
		 $three_dot='';
		 if(strlen($row2->fe_full_content)>105){
			 $three_dot=' ...';
		 }
		 


        $blog.='<div class="blog-post blog-media wow fadeInRight" data-wow-duration="300ms" data-wow-delay="100ms">
                    <article class="media clearfix">
                        <div class="entry-thumbnail pull-left">
                            <img class="img-responsive" style="width:263px; height:301px" src="'.$img_url2.'" alt="">
                            <span class="post-format post-format-gallery"><i class="fa fa-pencil-square-o"></i></span>
                        </div>
                        <div class="media-body">
                            <header class="entry-header">
                                <div class="entry-date">'.indonesian_date($row2->create_date).'</div>
                                <h2 class="entry-title"><a href="#">'.$row2->fe_content_title.'</a></h2>
                            </header>

                            <div class="entry-content">
                                <P>'.html_entity_decode(substr($row2->fe_full_content,0,105)).$three_dot.'</P>
                                <a class="btn btn-primary" href="blog/detail/'.$row2->fe_content_id.'">'.$button_label.'</a>
                            </div>

                            <footer class="entry-meta">
                                <span class="entry-author"><i class="fa fa-pencil"></i> <a href="#">'.$row2->create_by.'</a></span>
                                <span class="entry-comments"><i class="fa fa-comments-o"></i> <a href="blog/detail/'.$row2->fe_content_id.'">15</a></span>
                            </footer>
                        </div>
                    </article>
                </div>';
		}
		$blog.='</div><!--/.col-sm-6-->';
		$blog.='</section><!--/#blog-->';
		}
		return $blog;
	}

	function generate_get_in_touch($get_in_touch_script, $section_name){
		$get_in_touch='';
		$sql ="SELECT fe_content_title, fe_content_short_desc FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order";
		$query=$this->db->query($sql);
		$row=$query->row();
		if(isset($row)){
			$get_in_touch.='<section id="get-in-touch" >
				<div class="container">
					<div class="section-header" >
						<h2 class="section-title text-center wow fadeInDown">'.$row->fe_content_title.'</h2>
						<p class="text-center wow fadeInDown">'.$row->fe_content_short_desc.'</p>
					</div>
				</div>
			</section><!--/#get-in-touch-->';
		}
		return $get_in_touch;
	}
		
	function generate_contact($contact_script, $section_name){
		$row_section = get_section_info_by_name(strtolower($section_name));
		$img_url = base_url(). 'assets/images/upload/contact/'.$row_section->image_section;
		$contact='<section id="get-in-touch" >
			<div class="container">
				<div class="section-header" >
					<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>
					<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
				</div>
			</div>
		</section><!--/#get-in-touch-->';
	    $contact.='';
		$sql ="SELECT fe_content_title, fe_img_files,  fe_content_short_desc, fe_full_content FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order";
		$query=$this->db->query($sql);
		$row=$query->row();
		if(isset($row)){
			//$img_url = base_url(). 'assets/images/upload/contact/'.$img_url;
			$contact.='<section id="contact">
			
				<div style="height:650px" >
					<img class="img-responsive" style="height:600px" src="http://dkp.pastech.id/assets/images/upload/contact/contactus.jpg" alt="">
			   </div>
			   
				<div class="container-wrapper" >
					<div class="container">
						<div class="row">
							<div class="col-sm-4 col-sm-offset-8">
								<div class="contact-form">
									<h3>'.$row->fe_content_title.'</h3>
			
									<address>
									  '.$row->fe_full_content.'
									</address>
									<form id="main-contact-form" name="contact-form" method="post" action="#">
										<div class="form-group">
											<input type="text" name="name" class="form-control" placeholder="Name" required>
										</div>
										<div class="form-group">
											<input type="email" name="email" class="form-control" placeholder="Email" required>
										</div>
										<div class="form-group">
											<input type="text" name="subject" class="form-control" placeholder="Subject" required>
										</div>
										<div class="form-group">
											<textarea name="message" class="form-control" rows="8" placeholder="Message" required></textarea>
										</div>
										<button type="submit" class="btn btn-primary">Send Message</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section><!--/#contact-->';
		}
		return $contact;
	}

	function generate_footer($section_name){
		$footer='';
		$sql ="SELECT fe_content_title, fe_content_short_desc, fe_sosmed FROM sys_fe_content 
		WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order";
		//echo $sql;
		$query=$this->db->query($sql);
		$row=$query->row();
		if(isset($row)){
			$footer.='<!--/#footer-->
			<footer id="footer">
				<div class="container">
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
		
	 function generate_page_section(){
		$sql ="SELECT section_name, section_script FROM sys_page_section WHERE is_visible = 'Y' ORDER BY sort_order ASC";
		$query = $this->db->query($sql);
		$section_script ="";
		foreach ($query->result() as $row){
			if($row->section_name=='Slider'){
				$section_script.=$this->generate_img_slider($row->section_script, $row->section_name);
			}elseif($row->section_name=='Headline'){
				$section_script.=$this->generate_headline($row->section_script, $row->section_name);
			}elseif($row->section_name=='Features'){
				$section_script.=$this->generate_features($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='Template'){
				$section_script.=$this->generate_template($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='Services'){
				$section_script.=$this->generate_services($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='Works'){
				$section_script.=$this->generate_works($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='About'){
				$section_script.=$this->generate_about($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='Team'){
				$section_script.=$this->generate_team($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='Contact'){
				$section_script.=$this->generate_contact($row->section_script, $row->section_name)	;			
			}elseif($row->section_name=='Footer'){
				$section_script.=$this->generate_Footer($row->section_name)	;			
			}elseif($row->section_name=='Blog'){
				$section_script.=$this->generate_Blog($row->section_name)	;			
			}
		}
		
		return $section_script;
	}
	
	
}//Class
?>