<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Website Dinas Kearsipan | Pemerintah Kota Depok</title>
	<!-- core CSS -->
    <link href="<?php echo base_url()?>assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/animate.min.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/owl.carousel.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/owl.transitions.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/prettyPhoto.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/main.css" rel="stylesheet">
    <link href="<?php echo base_url()?>assets/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

<style type="text/css">
 .fa.fa-chevron-circle-right {
    right: 0;
}
.fa.fa-chevron-circle-left {
    left: 0;
}
.fa.fa-chevron-circle-right, .fa.fa-chevron-circle-left {
    margin-bottom: 1px;
    position: absolute;
    top: -30px;
    color:#FF7700;
}
.col-img-responsive02 span{
    color:#fff;
}
.col-img-responsive02 {
    
    display:none;
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0.6);
    height: 100%;
    position: absolute;
    width: 100%;
}
.carousel-control{
width:5%;
}
.panel-body{
    position:relative;
    padding:0px;
}
.btn-primary {
    background-color: #337ab7;
    border-color: #2e6da4;
    border-radius: 0;
    bottom: -15px;
    color: #fff;
    position: relative;
    width: 100%;
    -webkit-box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.38);
-moz-box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.38);
box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.38);   
}
.btn-primary {
    background-color: #ff7700;
    border-color: #fff;
}
.panel-default{
-webkit-box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.38);
-moz-box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.38);
box-shadow: 0px 4px 5px 0px rgba(0,0,0,0.38);
    border: medium none;
    border-radius: 0;
}

.panel-heading{
    padding:0px;
    position:relative;
}
.panel-heading img{
    width:100%;
}
.carousel-control.left {
    background-image: none;
}
.carousel-control.right{
    background-image: none;
}   


</style>

<script type="text/javascript">
$(document).ready(function(){
$('.carousel').carousel({
    pause: true,
    interval: false
});
});




$(document).ready(function(){
$(".col-md-3 ").mouseenter(function(){
    $(this).find(".col-img-responsive02").show(200);
}); 


$(".col-md-3").mouseleave(function(){
    $(this).find(".col-img-responsive02").hide();
}); 
});     

    
</script>

</head><!--/head-->

<body id="home" class="homepage">

    <header id="header">
        <nav id="main-menu" class="navbar navbar-default navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<?php echo base_url()?>"><img src="<?php echo base_url()?>assets/images/upload/logo/<?php echo  get_logo() ?>" alt="logo"></a>
                </div>
				<!-- MENU BEGIN HERE-->
                <?php echo $nav_bar_menu ?>
                
				<!-- MENU END HERE-->
               
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->
	<!--Page Content Start-->
    	<?php echo $page_content; ?>
	<!--Page Content End-->
	
    <script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/bootstrap.min.js"></script>
  
    <script src="<?php echo base_url()?>assets/js/owl.carousel.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/mousescroll.js"></script>
    <script src="<?php echo base_url()?>assets/js/smoothscroll.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery.prettyPhoto.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery.isotope.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/jquery.inview.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/wow.min.js"></script>
    <script src="<?php echo base_url()?>assets/js/main.js"></script>
</body>
</html>