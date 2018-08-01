<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class features_models extends CI_Model{
	
	function __construct(){
			  // Call the Model constructor
			  parent::__construct();
			  $this->load->library('session');
	}	
	
	function generate_features(){
	 $features="<section id='features'>
				<div class='container'>
					<div class='section-header'>
						<h2 class='section-title text-center wow fadeInDown'>Awesome Features</h2>
						<p class='text-center wow fadeInDown'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut enim ad minim veniam</p>
					</div>
					<div class='row'>
						<div class='col-sm-6 wow fadeInLeft'>
							<img class='img-responsive' src='".base_url()."assets/images/upload/features/main-feature.png' alt=''>
						</div>
						<div class='col-sm-6'>
							<div class='media service-box wow fadeInRight'>
								<div class='pull-left'>
									<i class='fa fa-line-chart'></i>
								</div>
								<div class='media-body'>
									<h4 class='media-heading'>UX design</h4>
									<p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
								</div>
							</div>
		
							<div class='media service-box wow fadeInRight'>
								<div class='pull-left'>
									<i class='fa fa-cubes'></i>
								</div>
								<div class='media-body'>
									<h4 class='media-heading'>UI design</h4>
									<p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
								</div>
							</div>
		
							<div class='media service-box wow fadeInRight'>
								<div class='pull-left'>
									<i class='fa fa-pie-chart'></i>
								</div>
								<div class='media-body'>
									<h4 class='media-heading'>SEO Services</h4>
									<p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
								</div>
							</div>
		
							<div class='media service-box wow fadeInRight'>
								<div class='pull-left'>
									<i class='fa fa-pie-chart'></i>
								</div>
								<div class='media-body'>
									<h4 class='media-heading'>SEO Services</h4>
									<p>Backed by some of the biggest names in the industry, Firefox OS is an open platform that fosters greater</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>";				
		return $features;
	}
	
}//Class
?>