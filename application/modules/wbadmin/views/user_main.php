<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dinas Kearsipan</title>
        <!-- Bootstrap -->
        <link href="<?php echo base_url()?>assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="<?php echo base_url()?>assets/css/font-awesome.min.css" rel="stylesheet">
        <!-- Font fontawesome-iconpicker.min.css -->
        <link href="<?php echo base_url()?>assets/css/fontawesome-iconpicker.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="<?php echo base_url()?>assets/css/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="<?php echo base_url()?>assets/css/green.css" rel="stylesheet">
        <!-- bootstrap-progressbar -->
        <link href="<?php echo base_url()?>assets/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
        <!-- JQVMap -->
        <link href="<?php echo base_url()?>assets/css/jqvmap.min.css" rel="stylesheet">
        <!-- bootstrap-daterangepicker -->
        <link href="<?php echo base_url()?>assets/css/daterangepicker.css" rel="stylesheet">
        <!-- Custom Theme Style -->
        <link href="<?php echo base_url()?>assets/css/custom.min.css" rel="stylesheet">
               <!-- jQuery -->
  		<script src="<?php echo base_url()?>assets/js/jquery.min.js"></script>

<style type="text/css">
.loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('<?php echo base_url() ?>assets/images/loader/loading_img.gif') 50% 50% no-repeat rgb(249,249,249);
    opacity: .8;
    }

</style>
 <script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});
</script>
<script type="text/javascript">
   var baseURL = "<?php echo base_url(); ?>user/";
</script>

    </head>
    <body class="nav-md">
    <div class="loader"></div>
        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Admin Page</span></a>
                        </div>
                        <div class="clearfix"></div>
                        <!-- menu profile quick info -->
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <img src="<?php echo base_url()?>assets/images/upload/img.jpg" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Welcome,</span>
                                <h2><?php echo $this->session->userdata('name') ?></h2>
                            </div>
                        </div>
                        <!-- /menu profile quick info -->
                        <br>
                        <!-- sidebar menu -->
                        <?php  echo $left_menu ?>
                        <!-- /sidebar menu -->
                        
                        <!-- /menu footer buttons -->
                        <div class="sidebar-footer hidden-small">
                            <a data-toggle="tooltip" data-placement="top" title="Settings"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
                            <a data-toggle="tooltip" data-placement="top" title="FullScreen"><span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span></a>
                            <a data-toggle="tooltip" data-placement="top" title="Lock"><span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span></a>
                            <a data-toggle="tooltip" data-placement="top" title="Logout" href="<?php echo base_url() ?>user/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
                        </div>
                        <!-- /menu footer buttons -->
                    </div>
                </div>
                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <nav>
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <img src="<?php echo base_url()?>assets/images/upload/img.jpg" alt=""><?php echo $full_user_name ?>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                                        <!-- <li>
                                            <a href="javascript:;"> Profile</a>
                                        </li>
                                        <li>
                                            <a href="javascript:;"><span class="badge bg-red pull-right">50%</span><span>Settings</span></a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">Help</a>
                                        </li> -->
                                        <li>
                                            <a href="<?php echo base_url()?>user/loadChangePass"><i class="fa fa-key pull-right"></i>Change Password</a>
                                        </li>                                        <li>
                                            <a href="<?php echo base_url()?>user/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                        </li>
                                    </ul>
                                </li>
                                <li role="presentation" class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope-o"></i><span class="badge bg-green">6</span></a>
                                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                        <li>
                                            <a><span class="image"><img src="<?php echo base_url()?>assets/images/upload/img.jpg" alt="Profile Image"></span><span><span>John Smith</span><span class="time">3 mins ago</span></span><span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...</span></a>
                                        </li>
                                        <li>
                                            <a><span class="image"><img src="<?php echo base_url()?>assets/images/upload/img.jpg" alt="Profile Image"></span><span><span>John Smith</span><span class="time">3 mins ago</span></span><span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...</span></a>
                                        </li>
                                        <li>
                                            <a><span class="image"><img src="<?php echo base_url()?>assets/images/upload/img.jpg" alt="Profile Image"></span><span><span>John Smith</span><span class="time">3 mins ago</span></span><span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...</span></a>
                                        </li>
                                        <li>
                                            <a><span class="image"><img src="<?php echo base_url()?>assets/images/upload/img.jpg" alt="Profile Image"></span><span><span>John Smith</span><span class="time">3 mins ago</span></span><span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...</span></a>
                                        </li>
                                        <li>
                                            <div class="text-center">
                                                <a><strong>See All Alerts</strong><i class="fa fa-angle-right"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->
                <!-- page content start -->
                 <div class="right_col" role="main">
                 <br> <br> <br>

                <?php  if(isset($page_content)){ $this->load->view($page_content);  } ?>
                </div>
                <!-- /page content -->
                <!-- footer content End -->
                <footer>
                    <div class="pull-right">Copyright@2017 - Diskominfo Pememrintah Kota Depok
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
            
        
        <!-- Bootstrap -->
        <script src="<?php echo base_url()?>assets/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="<?php echo base_url()?>assets/js/fastclick.js"></script>
        <!-- NProgress -->
        <script src="<?php echo base_url()?>assets/js/nprogress.js"></script>
        <!-- Chart.js -->
        <script src="<?php echo base_url()?>assets/js/Chart.min.js"></script>
        <!-- gauge.js -->
        <script src="<?php echo base_url()?>assets/js/gauge.min.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="<?php echo base_url()?>assets/js/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="<?php echo base_url()?>assets/js/icheck.min.js"></script>
        <!-- Skycons -->
        <script src="<?php echo base_url()?>assets/js/skycons.js"></script>
        <!-- Flot -->
        <script src="<?php echo base_url()?>assets/js/jquery.flot.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.flot.pie.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.flot.time.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.flot.stack.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.flot.resize.js"></script>
        <!-- Flot plugins -->
        <script src="<?php echo base_url()?>assets/js/jquery.flot.orderBars.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.flot.spline.min.js"></script>
        <script src="<?php echo base_url()?>assets/js/curvedLines.js"></script>
        <!-- DateJS -->
        <script src="<?php echo base_url()?>assets/js/date.js"></script>
        <!-- JQVMap -->
        <script src="<?php echo base_url()?>assets/js/jquery.vmap.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.vmap.world.js"></script>
        <script src="<?php echo base_url()?>assets/js/jquery.vmap.sampledata.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="<?php echo base_url()?>assets/js/moment.min.js"></script>
        <script src="<?php echo base_url()?>assets/js/daterangepicker.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="<?php echo base_url()?>assets/js/custom.min.js"></script>
        

        
    </body>
</html>