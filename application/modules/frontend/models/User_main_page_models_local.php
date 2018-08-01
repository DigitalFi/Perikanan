<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_main_page_models extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
			  $this->load->helper('common');
	}	
	
	function generate_1($script_section, $section_name){ // Slider
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
		$folder_name=get_foldername_by_section_id($row->fe_section_name);	
		$url = strtolower($folder_name).'/detail/'.$row->fe_content_id;
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

	function generate_13($headline_script, $section_name){//headline
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
		if($row){
			$title = $row->fe_content_title;
			$button_label = $row->fe_content_btn_label;
			$folder_name=get_foldername_by_section_id($row->fe_section_name);	
			$url = strtolower($folder_name).'/detail/'.$row->fe_content_id;
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

	function generate_2($features_script, $section_name){//feature

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
			$folder_name=get_foldername_by_section_id($row_item->fe_section_name);
			$short_desc=$row_item->fe_content_short_desc;
			$short_desc =strip_tags_content($short_desc); 	
			$url = strtolower($folder_name).'/detail/'.$row_item->fe_content_id;
			$features_script1= str_replace("[icon]",'fa fa-pencil-square-o',$features_script);
			//$features_script2= str_replace("[title]",$row_item->fe_content_title,$features_script1);
			//if ($row_item->fe_link_clickable=='Y'){
				$features_script2= str_replace("[title]","<a href='".$url."'>".$row_item->fe_content_title."</a>",$features_script1);
			//}
			$features.= str_replace("[short_description]",strip_tags_content($row_item->fe_content_short_desc),$features_script2);
		}
		$features.='</div>
					</div>
				</div>
			</div>
		</section>';
		return $features;
	}
	
	function generate_3($template_script, $section_name){//template
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

	function generate_4($services_script, $section_name){//srvices
		$services='';
		$row_section = get_section_info_by_name(strtolower($section_name));

		$folder_name=get_foldername_by_section_id($section_name);

		//echo "id ". $folder_name;	
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
		$sql_item ="SELECT fe_content_id,  fe_content_short_desc2, fe_content_short_desc, fe_content_short_desc, fe_content_title, fe_content_icon, fe_full_content, fe_link_clickable  FROM sys_fe_content WHERE fe_section_name='$section_name'   AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC limit 0,6";
		$query_item=$this->db->query($sql_item);

		foreach ($query_item->result() as $row_item){
			$url = strtolower($folder_name).'/detail/'.$row_item->fe_content_id;
			$services_script1= str_replace("[icon]",$row_item->fe_content_icon,$services_script);
			$services_script2= str_replace("[title]",$row_item->fe_content_title,$services_script1);
			if ($row_item->fe_link_clickable=='Y'){
				$services_script2= str_replace("[title]","<a href='".$url."'>".$row_item->fe_content_title."</a>",$services_script1);
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

function generate_17($services_script, $section_name){//File Gallery
		$services='';
		$row_section = get_section_info_by_name(strtolower($section_name));

		$folder_name= 'files' ;get_foldername_by_section_id($section_name);

		//echo "id ". $folder_name;	
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
		$sql_item ="SELECT fe_img_files, fe_content_id,  fe_content_short_desc2, fe_content_short_desc, fe_content_short_desc, fe_content_title, 
		fe_content_icon, fe_full_content, fe_link_clickable  FROM sys_fe_content WHERE fe_section_name='$section_name'   
		AND status_active = 'Y'  ORDER BY fe_content_sort_order DESC limit 0,6"; // echo $sql_item;
		$query_item=$this->db->query($sql_item);
		$url ='';
		foreach ($query_item->result() as $row_item){
			$ext_file = explode(".",  $row_item->fe_img_files);
			$ftype = $ext_file[1];

			$icon = base_url().'assets/images/upload/icon/'.strtolower($ftype).".png" ;
			$url = strtolower($folder_name).'/detail/'.$section_name;
			$services_script1= str_replace("[img]",$icon,$services_script);
			$services_script2= str_replace("[title]",$row_item->fe_content_title,$services_script1);
			if ($row_item->fe_link_clickable=='Y'){
				$services_script2= str_replace("[title]","<a href='".$url."'>".$row_item->fe_content_title."</a>",$services_script1);
			}
			$services.= str_replace("[short_description]",$row_item->fe_content_short_desc."...",$services_script2);
		}
			$services.='</div><!--/.services-->
					</div><!--/.row-->    
				</div><!--/.container-->
				<div style="text-align:center">
				<a class="btn btn-primary btn-lg" href="'.$url.'">View More...</a>
				</div>
			</section><!--/#services-->';
		}
		return $services;
	}
	function generate_5_ver_10($works_script, $section_name){//works
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
			$folder_name=get_foldername_by_section_id($row_item->fe_section_name);	
			$link = strtolower($folder_name).'/detail/'.$row_item->fe_content_id;	
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

function generate_5($works_script, $section_name){//works
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
			$folder_name=get_foldername_by_section_id($row_item->fe_section_name);	
			$link = strtolower($folder_name).'/detail/'.$section_name.'/'.strtolower($row_item->fe_content_btn_label);	
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


function generate_17_10($works_script, $section_name){//files
		$sql ="SELECT fe_img_files, fe_content_title, fe_content_short_desc FROM sys_fe_content WHERE fe_section_name='$section_name' AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC limit 0,1";
		$query=$this->db->query($sql);
		//echo $sql;
		$row=$query->row();
		$works='';
		if($row){
			$row_section = get_section_info_by_name(strtolower($section_name));
			if(isset($row_section)){
			$img_base_url =base_url()."assets/images/upload/files/"; 
			$img_url = $img_base_url.$row->fe_img_files;

			$works='<section id="portfolio">
				<div class="container">
					<div class="section-header">';
				$works.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
				$works.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
					</div>';

			$works.='<div class="text-center">
	            <ul class="portfolio-filter" data-filter-group="who">
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
			$sql_item ="SELECT fe_content_id, fe_img_files, fe_content_short_desc, fe_section_name, fe_content_title, fe_full_content,  fe_content_btn_label, fe_img_files, fe_img_files2, fe_content_short_desc2, fe_content_short_desc3 FROM sys_fe_content 
			WHERE fe_section_name='$section_name'  AND status_active = 'Y'  ORDER BY fe_content_sort_order ASC";
			$query_item=$this->db->query($sql_item);
			foreach ($query_item->result() as $row_item){
				$ext_file = explode(".",  $row_item->fe_img_files);
				$ftype = $ext_file[1];

				$icon = base_url().'assets/images/upload/icon/'.$ftype.".png" ;
				$folder_name=get_foldername_by_section_id($row_item->fe_section_name);	
				$link = strtolower($folder_name).'/detail/'.$section_name.'/'.strtolower($row_item->fe_content_btn_label);	
				$url  ='<a href="'.base_url().$link.'">'.$row_item->fe_content_title.' </a>';
				$works_script1= str_replace("[btn_label]", strtolower($row_item->fe_content_btn_label),$works_script);
				$works_script2= str_replace("[img1]",$icon,$works_script1);
				$works_script3= str_replace("[short_description1]",$url,$works_script2);
				$works_script4= str_replace("[short_description2]",$row_item->fe_content_short_desc,$works_script3);
				$works.= str_replace("[img2]",$img_base_url.$row_item->fe_img_files2,$works_script4);
				//$works.= str_replace("[short_description]",$row_item->fe_full_content,$works_script5);
			}
				$works.='</div>
				</div><!--/.container-->
			</section><!--/#portfolio-->';
			}
		}		
		return $works;
	}
		function generate_6($about_script, $section_name){//about
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

	function generate_8($team_script, $section_name){//team
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
			$folder_name=get_foldername_by_section_id($row_item->fe_section_name);
			$content_decoded = 	html_entity_decode($row_item->fe_full_content);
			$img_url = base_url(). 'assets/images/upload/team/'.$row_item->fe_img_files;
			$url = strtolower($folder_name).'/detail/'.$row_item->fe_content_id;	
			if($row_item->fe_link_clickable=='Y'){	
				
				if(strlen($content_decoded)>=104){
					$link_more ="<a href=".'#'."> Detail</a>";	
				}
			}

			$team.='<div class="col-sm-6 col-md-3">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img text-center" >
                            <img class="img-responsive" style="width:263;height:278px" src="'.$img_url.'" alt="">
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

	function generate_14($section_name){//blog
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

	function generate_12($get_in_touch_script, $section_name){//get_in_touch
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
		
	function generate_15($contact_script, $section_name){//contact
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
		echo $sql;
		$query=$this->db->query($sql);
		$row=$query->row();
		if(isset($row)){
			$img_url = base_url(). 'assets/images/upload/contact/'.$row->fe_img_files;
			//$img_url = base_url(). 'assets/images/upload/contact/'.$img_url;
			echo "gambar ". $img_url;
			$contact.='<section id="contact">
			
				<div style="height:650px" >
					<img class="img-responsive" style="height:600px" src="'.$img_url.'" alt="">
			   </div>
			   
				<div class="container-wrapper" >
					<div class="container">
						<div class="row">
							<div class="col-sm-4 col-sm-offset-8">
								<div class="contact-form">
									<h3>'.$row->fe_content_title.'</h3>
			
									<address>
									  '.html_entity_decode($row->fe_full_content).'
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

	function generate_16($script_section, $section_name){//footer
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
		

public function generate_18($script_section, $section_name){//File Gallery
	$row_section = get_section_info_by_name(strtolower($section_name));
	$folder_name = get_foldername_by_section_id($section_name);
	$gallery='<section id="gallery">
		<div class="container">
			<div class="section-header">';
		$gallery.='<h2 class="section-title text-center wow fadeInDown">'.$row_section->section_title.'</h2>';
		$gallery.='<p class="text-center wow fadeInDown">'.$row_section->section_desc.'</p>
			</div>
			<div class="row">
	<div class="gallery">';	

	$gallery.= '<div class="container" >';
	$gallery.='<header id="myCarousel" class="carousel slide" style="filter:none;">';
	$gallery.='<div id="myCarousel" class="carousel slide" data-ride="carousel"  >';
	$gallery.='<div class="carousel-inner" role="listbox">';

	$sql = "SELECT fe_content_id, fe_content_title FROM sys_fe_content WHERE status_active = 'Y' AND fe_section_name = '$section_name' ORDER BY fe_content_sort_order DESC";
	//echo $sql. "<BR>";
	$query = $this->db->query($sql);
	$item_state =' active';
	$cnt_item = 0;
	foreach ($query->result() as $dt){
		if($cnt_item>0){
			$item_state='';
		}
		$content_id = $dt->fe_content_id;
		$sql_item = "SELECT files_name, file_desc FROM tbl_gallery_files WHERE content_id = '$content_id' ORDER BY img_gallery_id";
		$query_item = $this->db->query($sql_item);
		$gallery.='<div class="item'.$item_state.'">';
		$gallery.='<div class="row" >';
		foreach($query_item->result() as $dt_active){

		$img_url = base_url(). 'assets/images/upload/'.$folder_name.'/'.$dt_active->files_name;	
		$gallery.='<div class="col-md-3 col-sm-6">';
			$gallery.='<div class="panels panel-warning text-center">
		                    <div class="panel-heading">
							<div class="col-img-responsive02"><span>'.$dt_active->file_desc.'</span></div>
		                      <img style="width:200px; height:100px" src="'.$img_url.'" />
		                    </div>
		                    <div class="panel-body">
		                        <a class="btn btn-primary" href="#">Learn More <i class="fa fa-chevron-right"></i></a>
		                    </div>
		                </div><!--panel panel-warning text-center-->';
			$gallery.='</div><!--col-md-3 col-sm-6-->';
		}	
			$gallery.='</div><!--row-->';
			$gallery.='</div><!--item active-->';
		//}	
/*		$sql_item2 = "SELECT files_name, file_desc FROM tbl_gallery_files WHERE content_id = '$content_id' ORDER BY img_gallery_id";
		$query_item2 = $this->db->query($sql_item2);
		foreach($query_item2->result() as $dt_item2){*/
			/*$gallery.='<div class="item">
						   <div class="row">
			                 <div class="col-md-3 col-sm-6">
			                   <div class="panel panel-warning text-center">
			                      <div class="panel-heading">
								       <div class="col-img-responsive02"><span>judul</span></div>
			                                <img src="http://lorempixel.com/150/100" />
			                            </div>
			                           <div class="panel-body">
			                               <a class="btn btn-primary" href="#">Learn More <i class="fa fa-chevron-right"></i></a>
			                           </div>
			                        </div>
			                    </div>
			                </div>
						</div>';*/
		//}				
		  

		$cnt_item++; 
	}	  
	$gallery.='</div>';
	$gallery.='</div><!--carousel-inner-->';
	$gallery.='<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			<span  aria-hidden="false"><i class="fa fa-chevron-circle-left"></i></span>
			<span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" >
			<span  aria-hidden="true"><i class="fa fa-chevron-circle-right"></i></span>
			<span class="sr-only">Next</span>
		  </a>';
	$gallery.='</header>';
	$gallery.='</div>';

	return $gallery;
}

function generate_page_section(){
		$sql ="SELECT section_id, section_name, section_script, sort_order FROM sys_page_section WHERE is_visible = 'Y' ORDER BY sort_order ASC";
		$query = $this->db->query($sql);
		$section_script ="";
		foreach ($query->result() as $row){
			$funct_id = $row->section_id;
			$funct_nm = "generate_".$funct_id;
			//echo "nama fungsi ". $funct_nm ."<BR>";
			if(method_exists('User_main_page_models',$funct_nm)){
				$section_script.=$this->$funct_nm($row->section_script, $funct_id);
			}
		}
		return $section_script;
	}
	
	
}//Class
?>